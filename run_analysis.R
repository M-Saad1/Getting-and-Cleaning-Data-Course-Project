## SAAD MAHMOOD 
## OCTOBER 5, 2021

library(data.table)
library(dplyr)

#METADATA
featureNames <- read.table("UCI HAR Dataset/features.txt")  #List of all features.
labelNames <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE) #Links the class labels with their activity name.
#TRAINING SET
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE) #subject identifiers
trainMeasurements <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE) #measurements
trainLabels <- read.table("UCI HAR Dataset/train/Y_train.txt", header=FALSE) #labels
#TESTING SET
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE) #subject identifiers
testMeasurements <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE) #measurements
testLabels <- read.table("UCI HAR Dataset/test/Y_test.txt", header=FALSE) #labels

## combine training and testing observations 
subjects <- rbind(trainSubjects,testSubjects)
measurements <- rbind(trainMeasurements,testMeasurements)
activityLabels <- rbind(trainLabels,testLabels)

## clear environment of unnecessary tables 
rm(list="trainSubjects","trainMeasurements","trainLabels","testSubjects","testMeasurements","testLabels")

## give names to the columns
colnames(measurements) <- t(featureNames[2])
colnames(subjects) <- "Subject"
colnames(activityLabels) <- "Activity"
colnames(labelNames) <- "Activity"

## replace activity labels with descriptive labels
activityLabels$Activity <- labelNames[activityLabels$Activity,2]

## merge all tables into one data set
allData <- cbind(subjects,activityLabels,measurements)

## clear environment of unnecessary tables 
rm(list="subjects","activityLabels","measurements","featureNames","labelNames")

## extract only the measurements on mean and STD for each measurement
allData<-select(allData, Subject, Activity, matches("mean"), matches("std"))

## make column names more readable
names(allData)<-gsub("Acc", "Accelerometer", names(allData))
names(allData)<-gsub("Gyro", "Gyroscope", names(allData))
names(allData)<-gsub("BodyBody", "Body", names(allData))
names(allData)<-gsub("Mag", "Magnitude", names(allData))
names(allData)<-gsub("^t", "Time", names(allData))
names(allData)<-gsub("^f", "Frequency", names(allData))
names(allData)<-gsub("tBody", "TimeBody", names(allData))
names(allData)<-gsub("-mean()", "Mean", names(allData), ignore.case = TRUE)
names(allData)<-gsub("-std()", "STD", names(allData), ignore.case = TRUE)
names(allData)<-gsub("-freq()", "Frequency", names(allData), ignore.case = TRUE)
names(allData)<-gsub("angle", "Angle", names(allData))
names(allData)<-gsub("gravity", "Gravity", names(allData))

## second, independent tidy data set with the average of each variable for each activity and each subject
tidyData <- allData %>%
  group_by(Subject, Activity) %>%
  summarise_all(list(mean))

## export the final data set
write.table(tidyData, "tidyData.txt", row.name=FALSE)

rmarkdown::render("CodeBook.md")