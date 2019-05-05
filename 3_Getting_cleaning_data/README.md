Run.analysis.R is the script to generate a tidy dataset from the raw data. 
The overall strategy of cleaning this dataset is as following: <br/>
＊ collect all the data from the "test" folder <br/>
＊ add the column name of the combined test dataset <br/>
＊ select columns including subject, activity, and others with mean or std <br/>
＊ repeat step1-3 for the "train" dataset <br/>
＊ bind the two dataset together to get the merged dataset <br/>
＊ group the merged dataset according to subject and activity <br/>
＊ calculate the mean for the grouping and create a new table named as "tidydata"<br/>

The following explains the code one by one:
> X_test<-read.table("test/X_test.txt") #import data files from "test" folder <br/>
> subject<-read.table("test/subject_test.txt") <br/>
y_test<-read.table("test/y_test.txt") <br/>
features<-read.table("features.txt") <br/>
names(X_test)<-as.character(features[,2]) #name the datasets just imported <br/>
names(subject)<-c("subject") #name subject dataset <br/>
names(y_test)<-c("activity_lables") #name y dataset <br/>
features_vec<-as.vector(features) # set the features as vectors <br/>
pattern<-"mean\\(\\)|std\\(\\)"  <br/>
meanStdSet<-X_test[,grep(pattern,names(X_test),value=TRUE)] #grep mean and std values <br/>
test<-cbind(subject,y_test,X_test_mean_std) #column bind subject, activity and columns containing mean or std <br/>

> X_train<-read.table("train/X_train.txt") #import data from the "train" folder <br/>
subject_train<-read.table("train/subject_train.txt") <br/>
y_train<-read.table("train/y_train.txt") <br/>
names(X_train)<-as.character(features[,2]) #name the X_train dataset <br/>
names(subject_train)<-c("subject") #name the subject_train dataset <br/>
names(y_train)<-c("activity_lables") #name the y_train dataset <br/>
meanStdSet_train<-X_train[,grep(pattern,names(X_train),value=TRUE)] #grep mean and std values <br/>
train<-cbind(subject_train,y_train,X_train_mean_std) #column bind the training dataset <br/>

> merged<-rbind(test,train) #row bind the training and test dataset with the common names <br/>

> merged$activity_lables[merged$activity_lables == 1] <- "WALKING" # replace the activity number with corresponding names <br/>
merged$activity_lables[merged$activity_lables == 2] <- "WALKING_UPSTAIRS"  <br/>
merged$activity_lables[merged$activity_lables == 3] <- "WALKING_DOWNSTAIRS" <br/>
merged$activity_lables[merged$activity_lables == 4] <- "SITTING" <br/>
merged$activity_lables[merged$activity_lables == 5] <- "STANDING" <br/>
merged$activity_lables[merged$activity_lables == 6] <- "LAYING" <br/>

> library(dplyr) <br/>
group<-group_by(merged, subject, activity_lables) #group the data based on subject and activity <br/>
tidydata<-summarise_each(group,funs(mean)) #summarize the data by calculating the mean, and stored in a new dataframe <br/>

> write.table(tidydata,"tidydata",row.name=FALSE) #write the dataframe into a table <br/>
