# Code Book

## Overview
The goal of this project is to prepare tidy data that can be used for later analysis. The source data sets and supporting information are available from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The source data sets and supporting information were created by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto of Smartlab, Genoa, Italy

More information about the data sets is available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Running run_analysis.R

run_analysis.R is written to be run in R or R Studio in a Linux environment.

Download the zip file from the above URL, and extract its contents. Copy and paste the "UCI HAR Dataset" directory into your R working directory. 
If you're using, R Studio, you can set up the default working directory by clicking on "Tools" in the menu bar, and then selecting "Global Options". Alternatively use ALT+T+G.
You can find out your working directory by the command "getwd()" 

Download the zip file from the above URL, and extract its contents. Copy and paste the "UCI HAR Dataset" directory into ~/Workspace/R_Stuff/


## What run_analysis.R does

run_analysis.R does the following:
* Uses descriptive activity names to name the activities in the training and test data sets.
* Appropriately labels the training and test data sets with descriptive variable names.
* Associates the correct subject IDs with the training and test data sets.
* Merges the resultant training and the test data sets to create one data set. 
* Extracts only the measurements on the mean and standard deviation for each measurement for the training and test data sets.
* From the data set in step 5 (immediately above), creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This script also removes open and close parenthesis marks, and hyphens from column names. Where appropriate, these characters are replaced with underscores. Also the column names from column 3 through the last column of the data frame resulting from step 6 (last step) is prepended with "mn_"

#Input

"UCI HAR Dataset"/features.txt
"UCI HAR Dataset"/activity_labels.txt
"UCI HAR Dataset"/train/X_train.txt
"UCI HAR Dataset"/y_train.txt"
"UCI HAR Dataset/train/subject_train.txt"
"UCI HAR Dataset/test/X_test.txt"
"UCI HAR Dataset/test/y_test.txt"
"UCI HAR Dataset/test/subject_test.txt"

## Output

The final data frame "df_means_by_activity_subject" looks like this - just a lot wider - 88 columns:

  activity subject_id mn_tBodyAcc_mean_X mn_tBodyAcc_mean_Y mn_tBodyAcc_mean_Z mn_tBodyAcc_std_X
1   LAYING          1          0.2215982        -0.04051395         -0.1132036        -0.9280565
2   LAYING          2          0.2813734        -0.01815874         -0.1072456        -0.9740595
3   LAYING          3          0.2755169        -0.01895568         -0.1013005        -0.9827766
4   LAYING          4          0.2635592        -0.01500318         -0.1106882        -0.9541937
5   LAYING          5          0.2783343        -0.01830421         -0.1079376        -0.9659345
6   LAYING          6          0.2486565        -0.01025292         -0.1331196        -0.9340494

This data frame is exported as a csv file - "means_by_activity_subject.csv". The csv file is written to the working directory.

The leading "mn_" to each variable name indicates that this is a mean

## Variables
* 1	activity	character
* 2	subject_id	integer
* 3	mn_tBodyAcc_mean_X	numeric
* 4	mn_tBodyAcc_mean_Y	numeric
* 5	mn_tBodyAcc_mean_Z	numeric
* 6	mn_tBodyAcc_std_X	numeric
* 7	mn_tBodyAcc_std_Y	numeric
* 8	mn_tBodyAcc_std_Z	numeric
* 9	mn_tGravityAcc_mean_X	numeric
* 10	mn_tGravityAcc_mean_Y	numeric
* 11	mn_tGravityAcc_mean_Z	numeric
* 12	mn_tGravityAcc_std_X	numeric
* 13	mn_tGravityAcc_std_Y	numeric
* 14	mn_tGravityAcc_std_Z	numeric
* 15	mn_tBodyAccJerk_mean_X	numeric
* 16	mn_tBodyAccJerk_mean_Y	numeric
* 17	mn_tBodyAccJerk_mean_Z	numeric
* 18	mn_tBodyAccJerk_std_X	numeric
* 19	mn_tBodyAccJerk_std_Y	numeric
* 20	mn_tBodyAccJerk_std_Z	numeric
* 21	mn_tBodyGyro_mean_X	numeric
* 22	mn_tBodyGyro_mean_Y	numeric
* 23	mn_tBodyGyro_mean_Z	numeric
* 24	mn_tBodyGyro_std_X	numeric
* 25	mn_tBodyGyro_std_Y	numeric
* 26	mn_tBodyGyro_std_Z	numeric
* 27	mn_tBodyGyroJerk_mean_X	numeric
* 28	mn_tBodyGyroJerk_mean_Y	numeric
* 29	mn_tBodyGyroJerk_mean_Z	numeric
* 30	mn_tBodyGyroJerk_std_X	numeric
* 31	mn_tBodyGyroJerk_std_Y	numeric
* 32	mn_tBodyGyroJerk_std_Z	numeric
* 33	mn_tBodyAccMag_mean	numeric
* 34	mn_tBodyAccMag_std	numeric
* 35	mn_tGravityAccMag_mean	numeric
* 36	mn_tGravityAccMag_std	numeric
* 37	mn_tBodyAccJerkMag_mean	numeric
* 38	mn_tBodyAccJerkMag_std	numeric
* 39	mn_tBodyGyroMag_mean	numeric
* 40	mn_tBodyGyroMag_std	numeric
* 41	mn_tBodyGyroJerkMag_mean	numeric
* 42	mn_tBodyGyroJerkMag_std	numeric
* 43	mn_fBodyAcc_mean_X	numeric
* 44	mn_fBodyAcc_mean_Y	numeric
* 45	mn_fBodyAcc_mean_Z	numeric
* 46	mn_fBodyAcc_std_X	numeric
* 47	mn_fBodyAcc_std_Y	numeric
* 48	mn_fBodyAcc_std_Z	numeric
* 49	mn_fBodyAcc_meanFreq_X	numeric
* 50	mn_fBodyAcc_meanFreq_Y	numeric
* 51	mn_fBodyAcc_meanFreq_Z	numeric
* 52	mn_fBodyAccJerk_mean_X	numeric
* 53	mn_fBodyAccJerk_mean_Y	numeric
* 54	mn_fBodyAccJerk_mean_Z	numeric
* 55	mn_fBodyAccJerk_std_X	numeric
* 56	mn_fBodyAccJerk_std_Y	numeric
* 57	mn_fBodyAccJerk_std_Z	numeric
* 58	mn_fBodyAccJerk_meanFreq_X	numeric
* 59	mn_fBodyAccJerk_meanFreq_Y	numeric
* 60	mn_fBodyAccJerk_meanFreq_Z	numeric
* 61	mn_fBodyGyro_mean_X	numeric
* 62	mn_fBodyGyro_mean_Y	numeric
* 63	mn_fBodyGyro_mean_Z	numeric
* 64	mn_fBodyGyro_std_X	numeric
* 65	mn_fBodyGyro_std_Y	numeric
* 66	mn_fBodyGyro_std_Z	numeric
* 67	mn_fBodyGyro_meanFreq_X	numeric
* 68	mn_fBodyGyro_meanFreq_Y	numeric
* 69	mn_fBodyGyro_meanFreq_Z	numeric
* 70	mn_fBodyAccMag_mean	numeric
* 71	mn_fBodyAccMag_std	numeric
* 72	mn_fBodyAccMag_meanFreq	numeric
* 73	mn_fBodyBodyAccJerkMag_mean	numeric
* 74	mn_fBodyBodyAccJerkMag_std	numeric
* 75	mn_fBodyBodyAccJerkMag_meanFreq	numeric
* 76	mn_fBodyBodyGyroMag_mean	numeric
* 77	mn_fBodyBodyGyroMag_std	numeric
* 78	mn_fBodyBodyGyroMag_meanFreq	numeric
* 79	mn_fBodyBodyGyroJerkMag_mean	numeric
* 80	mn_fBodyBodyGyroJerkMag_std	numeric
* 81	mn_fBodyBodyGyroJerkMag_meanFreq	numeric
* 82	mn_angle_tBodyAccMean_gravity	numeric
* 83	mn_angle_tBodyAccJerkMean_gravityMean	numeric
* 84	mn_angle_tBodyGyroMean_gravityMean	numeric
* 85	mn_angle_tBodyGyroJerkMean_gravityMean	numeric
* 86	mn_angle_X_gravityMean	numeric
* 87	mn_angle_Y_gravityMean	numeric
* 88	mn_angle_Z_gravityMean	numeric

January 22, 2015