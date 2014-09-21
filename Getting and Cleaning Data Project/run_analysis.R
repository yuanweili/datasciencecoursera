library(plyr)
library(reshape2)


# part I - merge data

trlab <- read.table("y_train.txt") # Call "y_train.txt" for activity labels
trl <- trlab$V1 # Convert variable "V1" to vector "trl"

telab <- read.table("y_test.txt") # Call "y_test.txt" for activity labels
tel <- telab$V1 # Convert variable "V1" to vector "tel"

trsub <- read.table("subject_train.txt") # Call "subject_train.txt" for subject labels
trs <- trsub$V1 # Convert variable "V1" to vector "trs"

tesub <- read.table("subject_test.txt") # Call "subject_test.txt" for subject labels
tes <- tesub$V1 # Convert variable "V1" to vector "tes"

# Read in data files
xtrain <- read.table("x_train.txt") # Call "x_train.txt" for test data
xtest <- read.table("x_test.txt") # Call "x_test.txt" for test data

all_raw<-rbind(xtrain,xtest)

features <- read.table("features.txt")

activity_labels <- read.table("activity_labels.txt")

names(activity_labels) <- c("id","activity")
# assign feature names to data set
names(all_raw) <-features[,2]

# Merge data and labels
lab<-c(trl,tel)# Combine train/test activity labels into vector
sub<-c(trs,tes)# Combine train/test subject labels into vector

sub_lab <- as.data.frame( cbind(lab,sub ))


all_data_full <- cbind(sub_lab, all_raw)

mergedData <- merge(sub_lab,activity_labels,by.x="lab",by.y="id",all=TRUE )

id_columns<-mergedData[,c("sub","activity")]

all_data_mean_std_only <- all_data_full[, subset(names(all_data_full),grepl("mean",names(all_data_full)) |  grepl("std",names(all_data_full))) ]


all_data_mean_std_only <- cbind(id_columns,all_data_mean_std_only)

all_data_melt<-melt(all_data_mean_std_only,id=c("sub","activity"),measures.vars=names(all_data_mean_std_only)[3:81])

final_output<- ddply(all_data_melt,.(sub,activity,variable),summarize,mean(value))

names(final_output)[1]<-"subject id"
names(final_output)[4]<-"mean value





