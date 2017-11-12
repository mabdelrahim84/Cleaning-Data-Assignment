---
title: "CodeBook.md"
author: "Mohammad Abdelrahim"
date: "November 12, 2017"
output: html_document
---
Identifiers

subject - The ID of the test subject
activity - The type of activity performed when the corresponding measurements were taken

Measurements:-

time of bodyacc mean x
time of bodyacc mean y
time of bodyacc mean z
time of gravityacc mean x
time of gravityacc mean y
time of gravityacc mean z
time of bodyaccjerk mean x
time of bodyaccjerk mean y
time of bodyaccjerk mean z
time of bodygyro mean x
time of bodygyro mean y
time of bodygyro mean z
time of bodygyrojerk mean x
time of bodygyrojerk mean y
time of bodygyrojerk mean z
time of bodyaccmag mean
time of gravityaccmag mean
time of bodyaccjerkmag mean
time of bodygyromag mean
time of bodygyrojerkmag mean
freq of bodyacc mean x
freq of bodyacc mean y
freq of bodyacc mean z
freq of bodyaccjerk mean x
freq of bodyaccjerk mean y
freq of bodyaccjerk mean z
freq of bodygyro mean x
freq of bodygyro mean y
freq of bodygyro mean z
freq of bodyaccmag mean
freq of bodybodyaccjerkmag mean
freq of bodybodygyromag mean
freq of bodybodygyrojerkmag mean
time of bodyacc std x
time of bodyacc std y
time of bodyacc std z
time of gravityacc std x
time of gravityacc std y
time of gravityacc std z
time of bodyaccjerk std x
time of bodyaccjerk std y
time of bodyaccjerk std z
time of bodygyro std x
time of bodygyro std y
time of bodygyro std z
time of bodygyrojerk std x
time of bodygyrojerk std y
time of bodygyrojerk std z
time of bodyaccmag std
time of gravityaccmag std
time of bodyaccjerkmag std
time of bodygyromag std
time of bodygyrojerkmag std
freq of bodyacc std x
freq of bodyacc std y
freq of bodyacc std z
freq of bodyaccjerk std x
freq of bodyaccjerk std y
freq of bodyaccjerk std z
freq of bodygyro std x
freq of bodygyro std y
freq of bodygyro std z
freq of bodyaccmag std
freq of bodybodyaccjerkmag std
freq of bodybodygyromag std
freq of bodybodygyrojerkmag std

Activity Labels

WALKING (value 1): subject was walking during the test
WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
SITTING (value 4): subject was sitting during the test
STANDING (value 5): subject was standing during the test
LAYING (value 6): subject was laying down during the test

Transformations:-

The following transformations were applied to the source data:

1) The train set was created via column binding of the subject, activity and measurements.
2) The test set was created via column binding of the subject, activity and measurements.
3) The train and test sets were row binded to construct the complete set.
4) The measurements on the mean and standard deviation (i.e. signals containing the strings mean and std) were extracted for each measurement, and the others were discarded.
5) The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names (see Identifiers section).
6) The variable names were replaced with descriptive variable names using the following set of rules:
    - Special characters (i.e. (, ), and -) were removed
    - The initial f and t were expanded to "freq of" and "time of" respectively.
    - mean() and std() were replaced by mean and std respectively.
7) From the data set in step 4, the final data set was created with the average of each variable for each activity and each subject.