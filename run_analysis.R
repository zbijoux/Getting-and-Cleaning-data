setwd("C:/Users/MY i5 E6410/Documents/COURSERA/GCD/WK3")

if (!file.exists("data")){
  dir.create("data")
}

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url, destfile = "./data/datset.zip", mode="wb")
unzip("./data/datset.zip", exdir = "./data/datset")
datset <- list.files("./data/datset/UCI HAR DATASET", recursive = TRUE)
datset



## Reading the Activity files

ActivityTest  <- read.table("./data/datset/UCI HAR DATASET/test/Y_test.txt",header = FALSE)
ActivityTrain <- read.table("./data/datset/UCI HAR DATASET/train/Y_train.txt",header = FALSE)



## Reading the Subject files

SubjectTrain <- read.table("./data/datset/UCI HAR DATASET/train/subject_train.txt", header = FALSE)
SubjectTest  <- read.table("./data/datset/UCI HAR DATASET/test/subject_test.txt", header = FALSE)



## Reading Fearures files

FeaturesTest  <- read.table("./data/datset/UCI HAR DATASET/test/X_test.txt",header = FALSE)
FeaturesTrain <- read.table("./data/datset/UCI HAR DATASET/train/X_train.txt",header = FALSE)

dim(FeaturesTrain)
dim(FeaturesTest)

str(FeaturesTrain)

## Merging the training and the test sets to create one data set.
## Concatenate the data tables by rows

Subjects <- rbind(SubjectTrain, SubjectTest)
Activity<- rbind(ActivityTrain, ActivityTest)
Features<- rbind(FeaturesTrain, FeaturesTest)


## Assigning names to variables

names(Subjects)<-c("subject")
names(Activity)<- c("activity")


##Extracts only the measurements on the mean and standard deviation for each measurement

## Reading the Feature.txt file to obtain variable names

FeaturesNames <- read.table("./data/datset/UCI HAR DATASET/features.txt",head=FALSE)
names(Features)<- FeaturesNames$V2

### Merge columns to get the data frame Data for all data

allCombine <- cbind(Subjects, Activity)
FullDat <- cbind(Features, allCombine)

## i.e taken Names of Features with "mean()" or "std()"
## Subset Name of Features by measurements on the mean and standard deviation

subsetFeaturesNames<-FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", FeaturesNames$V2)]

## Appropriately labelling the data set with descriptive variable names

## Subsetting the data frame Data by seleted names of Features

selectedNames<-c(as.character(subsetFeaturesNames), "subject", "activity" )
Dat<-subset(FullDat,select=selectedNames)

## Reading descriptive activity names from "activity_labels.txt"

activityLabels <- read.table("./data/datset/UCI HAR DATASET/activity_labels.txt",header = FALSE)
activity_labels<-read.table("./data/datset/UCI HAR DATASET/activity_labels.txt")["V2"]

## Using descriptive activity names to name the activities in the data set
## facorize Variable activity in the data frame Data using descriptive activity names

Dat$activity <- factor(Dat$activity,levels = activityLabels$V1, labels = activityLabels$V2)


##.check
head(activity_labels)
head(Dat$activity,30)
str(activityLabels)
names(Dat)[1:6]

## Matching the right names to variables in the data

names(Dat)<-gsub("^t", "time", names(Dat))
names(Dat)<-gsub("^f", "frequency", names(Dat))
names(Dat)<-gsub("Acc", "Accelerometer", names(Dat))
names(Dat)<-gsub("Gyro", "Gyroscope", names(Dat))
names(Dat)<-gsub("Mag", "Magnitude", names(Dat))
names(Dat)<-gsub("BodyBody", "Body", names(Dat))

dim(Dat)
names(Dat)
str(Dat)
dim(Dat)

## In this part,a second, independent tidy data set will be created with the average of each variable for each activity and each subject based on the data set in step 4.

library(plyr);
Data<-aggregate(. ~subject + activity, Dat, mean)
Data<-Data[order(Data$subject,Data$activity),]
write.table(Data, file = "tidydata.txt",row.name=FALSE)

## Checking the data for appropriateness 

head(Data[,1:4], 12)
dim(Data)
names(Data)
str(Data)
all(colSums(is.na(Data)) == 0)


