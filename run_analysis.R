## load library 
library(plyr)
## Reading training data
x_train <- read.table("~/train/X_train.txt",header = FALSE,stringsAsFactors = FALSE)
y_train <- read.table("~/train/y_train.txt",header = FALSE,stringsAsFactors = FALSE)
subjec_train <- read.table("~/train/subject_train.txt",header = FALSE,stringsAsFactors = FALSE)

## Column binding subject ids and activitys with the training set
train_set <- cbind(subjec_train,y_train,x_train)

## Reading testing data
x_test <- read.table("~/test/X_test.txt",header = FALSE,stringsAsFactors = FALSE)
y_test <- read.table("~/test/y_test.txt",header = FALSE,stringsAsFactors = FALSE)
subject_test <- read.table("~/test/subject_test.txt",header = FALSE,stringsAsFactors = FALSE)

## Column binding subject ids and activitys with the testing set
test_set <- cbind(subject_test,y_test,x_test)

## 1- Merging the training and the test sets to create one data set.
## Row binding test and training sets into all_set data frame
all_set <- rbind(test_set,train_set)

## Read the features names 
features <- read.table("~/features.txt",header = FALSE,stringsAsFactors = FALSE)


## 2- Extracting only the measurements on the mean and standard deviation for each measurement.
## Extracting only mean() variables positions 
mean_cols <- grep(x=features$V2,pattern = "mean\\(")

## Extracting only std() (Standard Deviation) variables positions  
std_cols <- grep(x=features$V2,pattern = "std\\(")

## Reduce the set to only the mean and std variables with subject ids and activity codes.
## Note that we add 2 to the mean_cols and std_cols because of the leading to columns (subject id and activity)
reduced_set <- all_set[,c(1,2,mean_cols+2,std_cols+2)]

## Renaming the column headers
names(reduced_set) <- c("subjectid","activity",features[mean_cols,2],features[std_cols,2])

## 3- Using descriptive activity names to name the activities in the data set
## Reading activity lookup 
activity <- read.table("~/activity_labels.txt",header = FALSE,stringsAsFactors = FALSE)

## Changing the activity IDs with their names.

reduced_set$activity <- activity[reduced_set$activity,2]

## 4- Appropriately labels the data set with descriptive variable names.

## Changing column names
columns <- names(reduced_set)
columns <- columns[3:length(columns)]
columns <- gsub("^t","time of ",columns)
columns <- gsub("^f","freq of ",columns)
columns <- gsub("mean\\(\\)"," mean ",columns)
columns <- gsub("std\\(\\)"," std ",columns)
columns <- gsub("-","",columns)
columns <- gsub(" $","",columns)
columns <- tolower(columns)
names(reduced_set) <- c("subject", "activity",columns)

## 5- Creating a second data set with average of each column grouped by subject and activity

gcols <- names(reduced_set[1:2])
dcols <- names(reduced_set)[3:ncol(reduced_set)]
res <- ddply(reduced_set, gcols, function(x) colMeans(x[dcols]))
write.table(res,file = "tidy_data.txt")
