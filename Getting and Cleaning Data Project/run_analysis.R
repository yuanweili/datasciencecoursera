## load the libraries needed
library(plyr)
library(reshape2)


## 1 - Merges the training and the test sets to create one data set.

## Read in activity label files
trlab <- read.table("y_train.txt") ## load "y_train.txt" for activity labels
trl <- trlab$V1 ## Convert variable "V1" to vector "trl"

telab <- read.table("y_test.txt") ## load "y_test.txt" for activity labels
tel <- telab$V1 ## Convert variable "V1" to vector "tel"

# Read in subject label files
trsub <- read.table("subject_train.txt") ## load "subject_train.txt" for subject labels
trs <- trsub$V1 ## Convert variable "V1" to vector "trs"

tesub <- read.table("subject_test.txt") ## load "subject_test.txt" for subject labels
tes <- tesub$V1 ## Convert variable "V1" to vector "tes"

# Read in main data files
xtrain <- read.table("x_train.txt") ## load "x_train.txt" for test data
xtest <- read.table("x_test.txt") ## load "x_test.txt" for test data

## Merge subject and activity labels data with cbind
lab<-c(trl,tel)
sub<-c(trs,tes)

## merge the data files with rbind
all_raw<-rbind(xtrain,xtest)

## Read in feature names data files
features <- read.table("features.txt")

## assign feature names to merged data set as variable names
names(all_raw) <-features[,2]

## 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 

all_data_mean_std_only <- all_raw[, subset(names(all_data_full),grepl("mean",names(all_data_full)) |  grepl("std",names(all_data_full))) ]


## 3 - Uses descriptive activity names to name the activities in the data set

## Read in activity label mapping files
activity_labels <- read.table("activity_labels.txt")

## assign column names to activity label mapping files
names(activity_labels) <- c("id","activity")
sub_lab <- as.data.frame( cbind(lab,sub ))

## join with activity label id to find the activity description
mergedData <- merge(sub_lab,activity_labels,by.x="lab",by.y="id",all=TRUE )

## extract only the subject id and activity label descriptions
id_columns<-mergedData[,c("sub","activity")]

## 4 - Appropriately labels the data set with descriptive variable names. 

names(all_data_mean_std_only) <- gsub("tBodyAcc", "total body accelaration ", names(all_data_mean_std_only))

names(all_data_mean_std_only) <- gsub("fBodyBodyAcc", "frequency body accelaration ", names(all_data_mean_std_only))

names(all_data_mean_std_only) <- gsub("Mag", " Euclidean norm magnitude ", names(all_data_mean_std_only))

names(all_data_mean_std_only) <- gsub("tGravityAcc", "total Gravity accelaration ", names(all_data_mean_std_only))

names(all_data_mean_std_only) <- gsub("tBodyGyro", "total Body Gyro ", names(all_data_mean_std_only))

names(all_data_mean_std_only) <- gsub("fBodyBody", "frequency body ", names(all_data_mean_std_only))

names(all_data_mean_std_only) <- gsub("fBody", "frequency body ", names(all_data_mean_std_only))

names(all_data_mean_std_only) <- gsub("-mean\\(\\)", "-mean", names(all_data_mean_std_only))

names(all_data_mean_std_only) <- gsub("-std\\(\\)", "-std", names(all_data_mean_std_only))

names(all_data_mean_std_only) <- gsub("-meanFreq\\(\\)", "-meanFreq", names(all_data_mean_std_only))

names(all_data_mean_std_only) <- gsub("\\-X", "-X axis", names(all_data_mean_std_only))

names(all_data_mean_std_only) <- gsub("\\-Y", "-Y axis", names(all_data_mean_std_only))

names(all_data_mean_std_only) <- gsub("\\-Z", "-Z axis", names(all_data_mean_std_only))

## add activity and subject id columns to the measure variables data set. 
all_data_mean_std_only <- cbind(id_columns,all_data_mean_std_only)

## 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

all_data_melt<-melt(all_data_mean_std_only,id=c("sub","activity"),measures.vars=names(all_data_mean_std_only)[3:81])

final_output<- ddply(all_data_melt,.(sub,activity,variable),summarize,mean(value))

names(final_output)[1]<-"subject id"
names(final_output)[4]<-"mean value"


write.table(final_output,"tidyData.txt",sep="\t", col.names = T, row.names = F)



