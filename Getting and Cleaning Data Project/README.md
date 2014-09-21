## load the libraries needed
##library(plyr)
##library(reshape2)

## step 1 - Merges the training and the test sets to create one data set.

## Read in activity label files

# Read in subject label files

# Read in main measure data files

## Merge subject and activity labels data with cbind

## merge the data files with rbind

## Read in feature names data files

## assign feature names to merged data set as variable names

## step 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 


## step 3 - Uses descriptive activity names to name the activities in the data set

## Read in activity label mapping files

## assign column names to activity label mapping files

## join with activity label id to find the activity description with the merge function

## extract only the subject id and activity label descriptions

## step 4 - Appropriately labels the data set with descriptive variable names. 
## use gsub to modify the raw variable names from the features.txt file

## add activity and subject id columns to the measure variables data set. 

## step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## use melt function to assign the id and measures variables
## use ddply function to summarize by subject, activity and measure variable to get the mean values 

