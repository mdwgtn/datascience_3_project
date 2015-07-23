# Codebook for result.txt

This document should be read in conjunction with README.txt from the source data set "Human Activity Recognition Using Smartphones".

## General description

result.txt is a data file with a single header line as its first line.

Each other line in the file is a single record with space-separated fields.

Each record in the file provides the average value of a unique triplet of (subject, activity, measurement) drawn from the source data set as described under Method.

The source data set is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Variables in a record

Each record contains a value for the variables <tt>subject</tt>, <tt>activity</tt>, <tt>measurement</tt>, <tt>mean_value</tt>.

### subject

Identifies the subject who performed the activity. 

These values were extracted from the files subject_test.txt and subject_train.txt in the source data set. Each observation in those files corresponds one-to-one with the respective observation in X_test.txt and X_train.txt.

Its integer values range from 1 to 30 inclusive.

### activity

Identifies the activity measured. 

These values were extracted from the files y_test.txt and y_train.txt in the source data set. Each observation in those files corresponds one-to-one with the respective observation in X_test.txt and X_train.txt.

The string names of the activities were taken from activity_labels.txt.

Its set of values is

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS 
* SITTING
* STANDING
* LAYING

### measurement

Identifies the measurement. The set of measurements in result.txt is the subset of measurements corresponding to the mean and standard deviation of each of the following signals. All other measurements from source data are excluded.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The sequence of variables in each record in the files X_test.txt and X_train.txt is enumerated in the file features.txt.

The set of values of this variable, and the unit of the mean_value variable given the measurement value, is

| measurement | mean_value unit |
| ----------- | --------------- |
tBodyAcc-mean()-X  | gravitational unit g                   
tBodyAcc-mean()-Y   | gravitational unit g                                     
tBodyAcc-mean()-Z    | gravitational unit g                                     
tBodyAcc-std()-X    | gravitational unit g                                     
tBodyAcc-std()-Y     | gravitational unit g                                     
tBodyAcc-std()-Z   | gravitational unit g                                      
tGravityAcc-mean()-X    | gravitational unit g                                  
tGravityAcc-mean()-Y    | gravitational unit g                                 
tGravityAcc-mean()-Z     | gravitational unit g                                 
tGravityAcc-std()-X    | gravitational unit g                                  
tGravityAcc-std()-Y    | gravitational unit g                                   
tGravityAcc-std()-Z    | gravitational unit g                                  
tBodyAccJerk-mean()-X     | gravitational unit g                                
tBodyAccJerk-mean()-Y   | gravitational unit g                                 
tBodyAccJerk-mean()-Z     | gravitational unit g                                
tBodyAccJerk-std()-X   | gravitational unit g                                  
tBodyAccJerk-std()-Y     | gravitational unit g                                 
tBodyAccJerk-std()-Z      | gravitational unit g                               
tBodyGyro-mean()-X   | radians per second                
tBodyGyro-mean()-Y    | radians per second                              
tBodyGyro-mean()-Z   | radians per second                                
tBodyGyro-std()-X    | radians per second                               
tBodyGyro-std()-Y    | radians per second                                
tBodyGyro-std()-Z     | radians per second                              
tBodyGyroJerk-mean()-X   | radians per second                            
tBodyGyroJerk-mean()-Y   | radians per second                           
tBodyGyroJerk-mean()-Z   | radians per second                            
tBodyGyroJerk-std()-X   | radians per second                            
tBodyGyroJerk-std()-Y   | radians per second                             
tBodyGyroJerk-std()-Z   | radians per second                            
tBodyAccMag-mean()     | gravitational unit g                                   
tBodyAccMag-std()      | gravitational unit g                                  
tGravityAccMag-mean()    | gravitational unit g                                 
tGravityAccMag-std()      | gravitational unit g                               
tBodyAccJerkMag-mean()   | gravitational unit g                                 
tBodyAccJerkMag-std()     | gravitational unit g                               
tBodyGyroMag-mean()      | radians per second                            
tBodyGyroMag-std()       | radians per second                           
tBodyGyroJerkMag-mean()  | radians per second                            
tBodyGyroJerkMag-std()   | radians per second                           
fBodyAcc-mean()-X    | gravitational unit g                                     
fBodyAcc-mean()-Y      | gravitational unit g                                  
fBodyAcc-mean()-Z     | gravitational unit g                                    
fBodyAcc-std()-X     | gravitational unit g                                    
fBodyAcc-std()-Y     | gravitational unit g                                     
fBodyAcc-std()-Z     | gravitational unit g                                    
fBodyAccJerk-mean()-X      | gravitational unit g                              
fBodyAccJerk-mean()-Y     | gravitational unit g                                
fBodyAccJerk-mean()-Z     | gravitational unit g                               
fBodyAccJerk-std()-X     | radians per second                            
fBodyAccJerk-std()-Y      | radians per second                          
fBodyAccJerk-std()-Z     | radians per second                            
fBodyGyro-mean()-X     | radians per second                
fBodyGyro-mean()-Y     | radians per second                             
fBodyGyro-mean()-Z     | radians per second                              
fBodyGyro-std()-X       | radians per second                            
fBodyGyro-std()-Y     | radians per second                               
fBodyGyro-std()-Z     | radians per second                              
fBodyAccMag-mean()       | gravitational unit g                                              
fBodyAccMag-std()      | gravitational unit g                                                 
fBodyBodyAccJerkMag-mean()  | gravitational unit g                                            
fBodyBodyAccJerkMag-std()  | gravitational unit g                                            
fBodyBodyGyroMag-mean()  | radians per second                           
fBodyBodyGyroMag-std()    | radians per second                           
fBodyBodyGyroJerkMag-mean()  | radians per second                        
fBodyBodyGyroJerkMag-std()  | radians per second                        

### mean_value

Mean value for this measurement for this subject performing this activity.

The unit of the mean_value in an observation depends on the value of the measurement variable, as given in the table above.

This field was calculated as the mean of all observations for each unique triplet of combinations of values in the variables (subject, activity, measurement).
