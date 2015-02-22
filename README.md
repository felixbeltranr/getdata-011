# getdata-011
Peer Assessments / Getting and Cleaning Data Course Project

PRE REQUISITES
You should have the following packages installed on your R environment
- plyr
- dplyr
- reshape2

If you don't have them installed, run the following instructions on your R console
> install.packages("plyr")
> install.packages("dplyr")
> install.packages("reshape2")

Wait for each one to download and install

INSTRUCTIONS FOR RUNNING THE SCRIPT
1) Make sure the data files are in the following routes inside your working directory:
Note: The file structure is generated automatically when you unzip the source ZIP file provided
/UCI HAR Dataset/features.txt
/UCI HAR Dataset/activity_labels.txt
/UCI HAR Dataset/test/subject_test.txt
/UCI HAR Dataset/test/X_test.txt
/UCI HAR Dataset/test/y_test.txt
/UCI HAR Dataset/train/subject_train.txt
/UCI HAR Dataset/train/X_train.txt
/UCI HAR Dataset/train/y_train.txt

2) Download the "run_analysis.R" file and put it on your working directory

3) Run the code typing in RStudio or R Console
source("run_analysis.R")

4) Wait for a few seconds

5) If everything is all right, you should have a file calle "activitySummaryBySubject.txt" inside the "UCI HAR Dataset" directory on your working director
./UCI HAR Dataset/activitySummaryBySubject.txt
