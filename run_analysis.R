#run_analysis.R v 1.0

library(data.table)
library(plyr)
library(dplyr)

data_sub_directory <- "UCI HAR Dataset"

df_features <- read.table(paste(data_sub_directory,"features.txt",sep="/")) 
df_activity_labels <- read.table(paste(data_sub_directory,"activity_labels.txt",sep="/"))
v_features <- as.vector(df_features[,2]) #convert the data frame into a vector
v_features <- gsub("\\(\\)","",v_features) #delete "()" pairs
v_features <- gsub("-","_",v_features) #convert hyphen to underscore
#convert unpaired open parenthesis "(" to underscore; note that the paired parentheses have already been deleted
v_features <- gsub("\\(","_",v_features)
#delete unpaired close parenthesis ")"; note that the paired parentheses have already been deleted  
v_features <- gsub("\\)","",v_features) 
v_features <- gsub(",","_",v_features) #replace comma with underscore

#replace the auto-generated column names of df_activity_labels with "activity_id" and "activity_label"
colnames(df_activity_labels) <- c("activity_id","activity_label")

#for training data set
df_X_train <- read.table(paste(data_sub_directory, "train/X_train.txt", sep="/"))
df_y_train <- read.table(paste(data_sub_directory,"train/y_train.txt", sep="/"))
df_subject_train <- read.table(paste(data_sub_directory,"train/subject_train.txt",sep="/"))

#replace the auto-generated column names in df_X_train with those in v_features (which are a modified version of those in features.txt)
colnames(df_X_train) <- v_features 
colnames(df_y_train) <- c("activity_id") #replace the auto-generated column name for df_y_train with "activity_id"  
colnames(df_subject_train) <- c("subject_id") #replace the auto-generated column name of df_subject_train with "subject_id"
df_activities_train_lj <- left_join(df_y_train, df_activity_labels) #associate the correct activity_label value with each element in df_y_train 

#select columns in df_X_train that contain "mean", "Mean" or "std"
df_train <- df_X_train[,(grepl("_mean" , names(df_X_train)) | grepl("+[A-Za-z]Mean" , names(df_X_train)) | grepl("_std" , names(df_X_train)))]

df_train <- cbind(df_activities_train_lj$activity_label,df_train) #clip the activity_label column to the left most column of df_train
names(df_train)[names(df_train) == "df_activities_train_lj$activity_label"] <- "activity" #change the column name to "activity"

df_train <- cbind(df_subject_train,df_train) #clip the subject_id column to the left of the activity column in df_train

#for test data set
df_X_test <- read.table(paste(data_sub_directory,"test/X_test.txt", sep="/"))
df_y_test <- read.table(paste(data_sub_directory,"test/y_test.txt", sep="/"))
df_subject_test <- read.table(paste(data_sub_directory,"test/subject_test.txt", sep="/"))

#replace the auto-generated column names in df_X_test with those in v_features (which are a modified version of those in features.txt)
colnames(df_X_test) <- v_features 
colnames(df_y_test) <- c("activity_id") #replace the auto-generated column name for df_y_test with "activity_id" 
colnames(df_subject_test) <- c("subject_id") #replace the auto-generated column name of df_subject_test with "subject_id"

df_activities_test_lj <- left_join(df_y_test, df_activity_labels)  #associate the correct activity_label value with each element in df_y_test 

#select columns in df_X_test that contain "mean", "Mean" or "std"
df_test <- df_X_test[,(grepl("_mean" , names(df_X_test))  | grepl("+[A-Za-z]Mean" , names(df_X_test))|  grepl("_std" , names(df_X_test)))]

df_test <- cbind(df_activities_test_lj$activity_label,df_test) #clip the activity_label column to the left most column of df_test
names(df_test)[names(df_test) == "df_activities_test_lj$activity_label"] <- "activity" #change the column name to "activity"

df_test <- cbind(df_subject_test,df_test) #clip the subject_id column to the left of the activity column in df_test

df_train_test <- rbind(df_train,df_test) #append all rows in df_test to df_train 

#compute the means of column 3 through the last column of df_train_test grouped by activity and subbject_id 
df_means_by_activity_subject <- df_train_test %>% 
  group_by(activity,subject_id) %>% 
  summarise_each(funs(mean))

v_colnames <- as.vector(colnames(df_means_by_activity_subject)) #convert column names of df_means_by_activity_subject to a vector

#prepend "mn_" to column names of column 3 through the last column in df_means_by_activity_subject
for (i in 3:length(v_colnames)) {
  v_colnames[i] <- paste("mn",v_colnames[i],sep="_")
}
colnames(df_means_by_activity_subject) <- v_colnames #replace original column names with those in v_colnames

#export df_means_by_activity_subject as a csv file
write.csv(df_means_by_activity_subject,file="means_by_activity_subject.csv",row.names=F)
