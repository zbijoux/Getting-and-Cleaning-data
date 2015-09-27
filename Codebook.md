---
title: "Codebook.md"
author: "zbijoux"
date: "September 26, 2015"
output: html_document
---
## Raw Data
The raw data was obtain from Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The raw dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.The variable description can  be seen here 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Process Data
The process data tidydata contain 180 observations, 68 variables and 30 subjects. Each person had to execute six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. These activities were measured using accelerometer and gyroscope which captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The set of variables were estimated using the mean and standard deviation.Finally the data was summarized by averaging each variable with respect to the subject and activities. The characteristic of the tidydata is a multivariate dataset of a repeated measurement.

## Variable Description
Subject: An identifier of the subject that performed the activities of the experiment
Activity:  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

The record of the other 66 variable was provided by:
- Triaxial acceleration from the accelerometer and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- Time or frequency domain signal.
- Jerk signal
- 3-axial signals in the  X,Y and Z directions
- Mean and standard deviation of each activities 

The Variables of the tidydata are listed below:


```r
names(Data)
```

```
##  [1] "subject"                                       
##  [2] "activity"                                      
##  [3] "timeBodyAccelerometer-mean()-X"                
##  [4] "timeBodyAccelerometer-mean()-Y"                
##  [5] "timeBodyAccelerometer-mean()-Z"                
##  [6] "timeBodyAccelerometer-std()-X"                 
##  [7] "timeBodyAccelerometer-std()-Y"                 
##  [8] "timeBodyAccelerometer-std()-Z"                 
##  [9] "timeGravityAccelerometer-mean()-X"             
## [10] "timeGravityAccelerometer-mean()-Y"             
## [11] "timeGravityAccelerometer-mean()-Z"             
## [12] "timeGravityAccelerometer-std()-X"              
## [13] "timeGravityAccelerometer-std()-Y"              
## [14] "timeGravityAccelerometer-std()-Z"              
## [15] "timeBodyAccelerometerJerk-mean()-X"            
## [16] "timeBodyAccelerometerJerk-mean()-Y"            
## [17] "timeBodyAccelerometerJerk-mean()-Z"            
## [18] "timeBodyAccelerometerJerk-std()-X"             
## [19] "timeBodyAccelerometerJerk-std()-Y"             
## [20] "timeBodyAccelerometerJerk-std()-Z"             
## [21] "timeBodyGyroscope-mean()-X"                    
## [22] "timeBodyGyroscope-mean()-Y"                    
## [23] "timeBodyGyroscope-mean()-Z"                    
## [24] "timeBodyGyroscope-std()-X"                     
## [25] "timeBodyGyroscope-std()-Y"                     
## [26] "timeBodyGyroscope-std()-Z"                     
## [27] "timeBodyGyroscopeJerk-mean()-X"                
## [28] "timeBodyGyroscopeJerk-mean()-Y"                
## [29] "timeBodyGyroscopeJerk-mean()-Z"                
## [30] "timeBodyGyroscopeJerk-std()-X"                 
## [31] "timeBodyGyroscopeJerk-std()-Y"                 
## [32] "timeBodyGyroscopeJerk-std()-Z"                 
## [33] "timeBodyAccelerometerMagnitude-mean()"         
## [34] "timeBodyAccelerometerMagnitude-std()"          
## [35] "timeGravityAccelerometerMagnitude-mean()"      
## [36] "timeGravityAccelerometerMagnitude-std()"       
## [37] "timeBodyAccelerometerJerkMagnitude-mean()"     
## [38] "timeBodyAccelerometerJerkMagnitude-std()"      
## [39] "timeBodyGyroscopeMagnitude-mean()"             
## [40] "timeBodyGyroscopeMagnitude-std()"              
## [41] "timeBodyGyroscopeJerkMagnitude-mean()"         
## [42] "timeBodyGyroscopeJerkMagnitude-std()"          
## [43] "frequencyBodyAccelerometer-mean()-X"           
## [44] "frequencyBodyAccelerometer-mean()-Y"           
## [45] "frequencyBodyAccelerometer-mean()-Z"           
## [46] "frequencyBodyAccelerometer-std()-X"            
## [47] "frequencyBodyAccelerometer-std()-Y"            
## [48] "frequencyBodyAccelerometer-std()-Z"            
## [49] "frequencyBodyAccelerometerJerk-mean()-X"       
## [50] "frequencyBodyAccelerometerJerk-mean()-Y"       
## [51] "frequencyBodyAccelerometerJerk-mean()-Z"       
## [52] "frequencyBodyAccelerometerJerk-std()-X"        
## [53] "frequencyBodyAccelerometerJerk-std()-Y"        
## [54] "frequencyBodyAccelerometerJerk-std()-Z"        
## [55] "frequencyBodyGyroscope-mean()-X"               
## [56] "frequencyBodyGyroscope-mean()-Y"               
## [57] "frequencyBodyGyroscope-mean()-Z"               
## [58] "frequencyBodyGyroscope-std()-X"                
## [59] "frequencyBodyGyroscope-std()-Y"                
## [60] "frequencyBodyGyroscope-std()-Z"                
## [61] "frequencyBodyAccelerometerMagnitude-mean()"    
## [62] "frequencyBodyAccelerometerMagnitude-std()"     
## [63] "frequencyBodyAccelerometerJerkMagnitude-mean()"
## [64] "frequencyBodyAccelerometerJerkMagnitude-std()" 
## [65] "frequencyBodyGyroscopeMagnitude-mean()"        
## [66] "frequencyBodyGyroscopeMagnitude-std()"         
## [67] "frequencyBodyGyroscopeJerkMagnitude-mean()"    
## [68] "frequencyBodyGyroscopeJerkMagnitude-std()"
```
 
## Getting the data
There were 8 data was obtained from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
The files use to process the raw data:
- test/subject_test.txt
- test/X_test.txt
- test/y_test.txt
- train/subject_train.txt
- train/X_train.txt
- train/y_train.txt
- activity_labels.txt                        
- features.txt                                
- README.txt 
 
## Putting related files together
- Subject: test/subject_test.txt and train/subject_train.txt
- Activity: test/Y_test.txt and train/Y_train.txt
- Mearsurement(Features): test/X_test.txt and train/X_train.txt
- Names of variables: feature.txt
- Labels of activity: activity_labels.txt

## Data manipulation steps
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. An independent tidy data set with the average of each variable for each activity and each subject was created from step 4.
 
## Checking the data  

```r
head(Data[,1:4], 12)
```

```
##     subject           activity timeBodyAccelerometer-mean()-X
## 1         1            WALKING                      0.2773308
## 31        1   WALKING_UPSTAIRS                      0.2554617
## 61        1 WALKING_DOWNSTAIRS                      0.2891883
## 91        1            SITTING                      0.2612376
## 121       1           STANDING                      0.2789176
## 151       1             LAYING                      0.2215982
## 2         2            WALKING                      0.2764266
## 32        2   WALKING_UPSTAIRS                      0.2471648
## 62        2 WALKING_DOWNSTAIRS                      0.2776153
## 92        2            SITTING                      0.2770874
## 122       2           STANDING                      0.2779115
## 152       2             LAYING                      0.2813734
##     timeBodyAccelerometer-mean()-Y
## 1                     -0.017383819
## 31                    -0.023953149
## 61                    -0.009918505
## 91                    -0.001308288
## 121                   -0.016137590
## 151                   -0.040513953
## 2                     -0.018594920
## 32                    -0.021412113
## 62                    -0.022661416
## 92                    -0.015687994
## 122                   -0.018420827
## 152                   -0.018158740
```

```r
dim(Data)
```

```
## [1] 180  68
```

```r
all(colSums(is.na(Data)) == 0)
```

```
## [1] TRUE
```


