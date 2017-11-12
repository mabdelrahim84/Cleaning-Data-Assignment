# Getting and Cleaning Data Assignment
This repository contains the following files:

README.md, this file, which provides an overview of the data set and how it was created.
tidy_data.txt, which contains the data set.
CodeBook.md, the code book, which describes the contents of the data set (data, variables and transformations used to generate the data).
run_analysis.R, the R script that was used to create the data set 

## Comprehensive steps:-
1) Download and unzip source data if it doesn't exist.
2) Set the "UCI HAR Dataset" folder to be the working directory.
2) Read data into R.
3) Merge the training and the test sets to create one data set.
4) Extract only the measurements on the mean and standard deviation for each measurement.
5) Use descriptive activity names to name the activities in the data set.
6) Appropriately label the data set with descriptive variable names.
7) Create a second, independent tidy set with the average of each variable for each activity and each subject.
8) Write the data set to the tidy_data.txt file.
