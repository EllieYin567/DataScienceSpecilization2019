#Script for Coursera "Getting and cleanning data" course project
#20190505

setwd("~/Desktop/3. cleaning-data/project2019")
#Download and unzip the files
URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, "Dataset.zip", method="curl")
library(utils)
unzip("Dataset.zip")

#Read the test dataset
X_test<-read.table("UCI HAR Dataset/test/X_test.txt") #import data files from "test" folder
subject<-read.table("UCI HAR Dataset/test/subject_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt") 
features<-read.table("UCI HAR Dataset/features.txt")
names(X_test)<-as.character(features[,2]) #name the datasets just imported
names(subject)<-c("subject") #name subject dataset
names(y_test)<-c("activity_lables") #name y dataset
features_vec<-as.vector(features) # set the features as vectors
pattern<-"mean\\(\\)|std\\(\\)"  
meanStdSet<-X_test[,grep(pattern,names(X_test),value=TRUE)] #grep mean and std values
test<-cbind(subject,y_test,meanStdSet) #column bind subject, activity and columns containing mean or std

#Training dataset
X_train<-read.table("UCI HAR Dataset/train/X_train.txt") #import data from the "train" folder
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
names(X_train)<-as.character(features[,2]) #name the X_train dataset
names(subject_train)<-c("subject") #name the subject_train dataset
names(y_train)<-c("activity_lables") #name the y_train dataset
meanStdSet_train<-X_train[,grep(pattern,names(X_train),value=TRUE)] #grep mean and std values
train<-cbind(subject_train,y_train,meanStdSet_train) #column bind the training dataset

merged<-rbind(test,train) #row bind the training and test dataset with the common names
merged$activity_lables[merged$activity_lables == 1] <- "WALKING" # replace the activity number with corresponding names
merged$activity_lables[merged$activity_lables == 2] <- "WALKING_UPSTAIRS" 
merged$activity_lables[merged$activity_lables == 3] <- "WALKING_DOWNSTAIRS" 
merged$activity_lables[merged$activity_lables == 4] <- "SITTING" 
merged$activity_lables[merged$activity_lables == 5] <- "STANDING" 
merged$activity_lables[merged$activity_lables == 6] <- "LAYING" 

library(dplyr)
group<-group_by(merged, subject, activity_lables) #group the data based on subject and activity
tidydata<-summarise_all(group,funs(mean)) #summarize the data by calculating the mean, and stored in a new dataframe

write.table(tidydata,"tidydata",row.name=FALSE) #write the dataframe into a table
