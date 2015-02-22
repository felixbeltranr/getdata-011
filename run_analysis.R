## To run the project type: source("run_analysis.R")
## I'm assuming there is a directory called "UCI HAR Dataset" in the working directory
## with all the files extracted from the "getdata_projectfiles_UCI HAR Dataset.zip" file

## Load the libraries I'm going to need
library(plyr)
library(dplyr)
library(reshape2)

#####################################################################################
## 0. STEP 0. Not on the instructions, but I have to read first the data sets
#####################################################################################
## Read the features and activity label tables
features <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Read the TEST subjects
testSubjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt") ## Subjects (people)
## Reading TEST Actual variables. At the same time, I'm assigning the variable names
testX <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=as.vector(features[[2]]))
## Reading TEST Activities for each reading
testY <- read.table("./UCI HAR Dataset/test/y_test.txt")

## Read the TRAIN subjects
trainSubjectTest <- read.table("./UCI HAR Dataset/train/subject_train.txt") ## Subjects (people)
## Reading TRAIN Actual variables. At the same time, I'm assigning the variable names
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=as.vector(features[[2]]))
## Reading TRAIN Activities for each reading
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt")

#####################################################################################
## 1. Merges the training and the test sets to create one data set.
#####################################################################################
##First merge all the "test" and "train" dataset into one "complete" data set
completSubject = rbind(testSubjectTest, trainSubjectTest)
completeX = rbind(testX, trainX)
completeY = rbind(testY, trainY)

## I create an aux table with the list of activities and their labels
auxAct <- join(completeY, activityLabels, by="V1")
## Create a new column in the readings table, with the subjects
completeX$Subject <- completSubject$V1
## Create another column with the activity labels
completeX$Activity <- auxAct$V2

#####################################################################################
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#####################################################################################
## Now I get rid of the columns I don't needed, by selecting only the columns withe the "mean" and "std" strings
readingsWithFinalColumns <- subset(completeX, select=(names(completeX)[grep("[Mm]ean|[Ss]td|Subject|Activity", names(completeX))]))

#####################################################################################
## 3. Uses descriptive activity names to name the activities in the data set
#####################################################################################
## Not need of this step any more. The names of the activities are already on the dataset

#####################################################################################
## 4. Appropriately labels the data set with descriptive variable names.
#####################################################################################
## Not need of this step any more. The labels of the variables are already on the dataset

#####################################################################################
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#####################################################################################
## Now I group the readings by subject and activity, and then i get the mean for each column
myNewTidyData <- summarise_each(group_by(readingsWithFinalColumns, Subject, Activity), funs(mean))

## Write the data to a table on disk
write.table(myNewTidyData, file = "./UCI HAR Dataset/activitySummaryBySubject.txt", row.name=FALSE)
