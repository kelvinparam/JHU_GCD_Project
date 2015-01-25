# README.md

The goal of this project is to prepare tidy data that can be used for later analysis. The source data sets and supporting information are available from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The source data sets and supporting information were created by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto of Smartlab, Genoa, Italy.

More information about the data sets is available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

run_analysis.R does the following:

* Uses descriptive activity names to name the activities in the training and test data sets.
* Appropriately labels the training and test data sets with descriptive variable names.
* Associates the correct subject IDs with the training and test data sets.
* Merges the resultant training and the test data sets to create one data set. 
* Extracts only the measurements on the mean and standard deviation for each measurement for the training and test data sets.
* From the data set in step 5 (immediately above), creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This script also removes open and close parenthesis marks, and hyphens from column names. Where appropriate, these characters are replaced with underscores. Also the column names from column 3 through the last column of the data frame resulting from step 6 (last step) is prepended with "mn_"

run_analysis.R is written to be run in R or R Studio in a Linux environment.

Download the zip file from the first URL in this document, and extract its contents. Copy and paste the "UCI HAR Dataset" directory into your R working directory. 
If you're using, R Studio, you can set up the default working directory by clicking on "Tools" in the menu bar, and then selecting "Global Options". Alternatively use ALT+T+G.
You can find out your working directory by the command "getwd()". 

The resulting data frame from step 6 is exported as a text file - "means_by_activity_subject.txt", with header. This txt file is written to the working directory. 
To import this file into R, use "read.table()" with the "header=TRUE" option e.g. df_test_output <- read.table("means_by_activity_subject.txt", header=TRUE).

run_analysis.R also produces a csv file of the same data frame - "means_by_activity_subject.csv". It is also written to the working directory.

January 24, 2015
