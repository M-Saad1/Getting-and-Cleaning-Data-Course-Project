---
title: "Getting and Cleaning Data Course Project"
output: html_document
---

## About this repository
This repository contains my submission for the final course project in the Getting and Cleaning Data course (course #3 in the Johns Hopkins Data Science specialization).

The purpose of this project is described as such:

>The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The data used for this project was sourced from the [Human Activity Recognition Using Smartphones dataset provided by the UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). __Please note that in order for this script to work, the data set must be downloaded from the UCI repository and placed in the immediate directory of this repository.__

The assignment was to create one R script that does the following:

> 1. Merges the training and the test sets to create one data set.

> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

> 3. Uses descriptive activity names to name the activities in the data set

> 4. Appropriately labels the data set with descriptive variable names. 

> 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files in this repository

### ```README.MD``` 
* This file that you are reading

### ```run_analysis.R```
* R script that transforms the data from the "UCI HAR Dataset" folder into the final tidy data. 
* Exports tidyData.txt. 
__For further in-depth details please refer to the Code Book__

### ```CodeBook.MD```
* Describes all the variables, data, and transformations performed in run_analysis.R to go from the original data to the final tidy data sets.

