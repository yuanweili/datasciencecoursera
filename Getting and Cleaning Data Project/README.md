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

## variables in the final output file
## subject id: int  1 1 1 1 1 1 1 1 1 1 ...
## activity  : Factor with 6 levels 
## 1 WALKING
## 2 WALKING_UPSTAIRS
## 3 WALKING_DOWNSTAIRS
## 4 SITTING
## 5 STANDING
## 6 LAYING
## variable  : Factor w/ 79 levels 

##[1] "total body accelaration -mean-X axis"                               
##[2] "total body accelaration -mean-Y axis"                               
##[3] "total body accelaration -mean-Z axis"                               
##[4] "total body accelaration -std-X axis"                                
##[5] "total body accelaration -std-Y axis"                                
##[6] "total body accelaration -std-Z axis"                                
##[7] "total Gravity accelaration -mean-X axis"                            
##[8] "total Gravity accelaration -mean-Y axis"                            
##[9] "total Gravity accelaration -mean-Z axis"                            
##[10] "total Gravity accelaration -std-X axis"                             
##[11] "total Gravity accelaration -std-Y axis"                             
##[12] "total Gravity accelaration -std-Z axis"                             
##[13] "total body accelaration Jerk-mean-X axis"                           
##[14] "total body accelaration Jerk-mean-Y axis"                           
##[15] "total body accelaration Jerk-mean-Z axis"                           
##[16] "total body accelaration Jerk-std-X axis"                            
##[17] "total body accelaration Jerk-std-Y axis"                            
##[18] "total body accelaration Jerk-std-Z axis"                            
##[19] "total Body Gyro -mean-X axis"                                       
##[20] "total Body Gyro -mean-Y axis"                                       
##[21] "total Body Gyro -mean-Z axis"                                       
##[22] "total Body Gyro -std-X axis"                                        
##[23] "total Body Gyro -std-Y axis"                                        
##[24] "total Body Gyro -std-Z axis"                                        
##[25] "total Body Gyro Jerk-mean-X axis"                                   
##[26] "total Body Gyro Jerk-mean-Y axis"                                   
##[27] "total Body Gyro Jerk-mean-Z axis"                                   
##[28] "total Body Gyro Jerk-std-X axis"                                    
##[29] "total Body Gyro Jerk-std-Y axis"                                    
##[30] "total Body Gyro Jerk-std-Z axis"                                    
##[31] "total body accelaration  Euclidean norm magnitude -mean"            
##[32] "total body accelaration  Euclidean norm magnitude -std"             
##[33] "total Gravity accelaration  Euclidean norm magnitude -mean"         
##[34] "total Gravity accelaration  Euclidean norm magnitude -std"          
##[35] "total body accelaration Jerk Euclidean norm magnitude -mean"        
##[36] "total body accelaration Jerk Euclidean norm magnitude -std"         
##[37] "total Body Gyro  Euclidean norm magnitude -mean"                    
##[38] "total Body Gyro  Euclidean norm magnitude -std"                     
##[39] "total Body Gyro Jerk Euclidean norm magnitude -mean"                
##[40] "total Body Gyro Jerk Euclidean norm magnitude -std"                 
##[41] "frequency body Acc-mean-X axis"                                     
##[42] "frequency body Acc-mean-Y axis"                                     
##[43] "frequency body Acc-mean-Z axis"                                     
##[44] "frequency body Acc-std-X axis"                                      
##[45] "frequency body Acc-std-Y axis"                                      
##[46] "frequency body Acc-std-Z axis"                                      
##[47] "frequency body Acc-meanFreq-X axis"                                 
##[48] "frequency body Acc-meanFreq-Y axis"                                 
##[49] "frequency body Acc-meanFreq-Z axis"                                 
##[50] "frequency body AccJerk-mean-X axis"                                 
##[51] "frequency body AccJerk-mean-Y axis"                                 
##[52] "frequency body AccJerk-mean-Z axis"                                 
##[53] "frequency body AccJerk-std-X axis"                                  
##[54] "frequency body AccJerk-std-Y axis"                                  
##[55] "frequency body AccJerk-std-Z axis"                                  
##[56] "frequency body AccJerk-meanFreq-X axis"                             
##[57] "frequency body AccJerk-meanFreq-Y axis"                             
##[58] "frequency body AccJerk-meanFreq-Z axis"                             
##[59] "frequency body Gyro-mean-X axis"                                    
##[60] "frequency body Gyro-mean-Y axis"                                    
##[61] "frequency body Gyro-mean-Z axis"                                    
##[62] "frequency body Gyro-std-X axis"                                     
##[63] "frequency body Gyro-std-Y axis"                                     
##[64] "frequency body Gyro-std-Z axis"                                     
##[65] "frequency body Gyro-meanFreq-X axis"                                
##[66] "frequency body Gyro-meanFreq-Y axis"                                
##[67] "frequency body Gyro-meanFreq-Z axis"                                
##[68] "frequency body Acc Euclidean norm magnitude -mean"                  
##[69] "frequency body Acc Euclidean norm magnitude -std"                   
##[70] "frequency body Acc Euclidean norm magnitude -meanFreq"              
##[71] "frequency body accelaration Jerk Euclidean norm magnitude -mean"    
##[72] "frequency body accelaration Jerk Euclidean norm magnitude -std"     
##[73] "frequency body accelaration Jerk Euclidean norm magnitude -meanFreq"
##[74] "frequency body Gyro Euclidean norm magnitude -mean"                 
##[75] "frequency body Gyro Euclidean norm magnitude -std"                  
##[76] "frequency body Gyro Euclidean norm magnitude -meanFreq"             
##[77] "frequency body GyroJerk Euclidean norm magnitude -mean"             
##[78] "frequency body GyroJerk Euclidean norm magnitude -std"              
##[79] "frequency body GyroJerk Euclidean norm magnitude -meanFreq"
## mean value:
