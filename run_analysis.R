library(tools)
library(dplyr)

setwd("C:/Coursera/DataScience2017/03-GetCleanData/UCI HAR Dataset")

#Test group dataset tidy script
#1)Read in the Activity id's, 2) Read the Subject id's. **Note: Not having "header = FALSE"
# in the first two reads was dropping the first row
testact <- read.csv("y_test.txt", sep = "", col.names = "activity", header = FALSE)
testsub <- read.csv("subject_test.txt", sep = "", col.names = "subjectid", header = FALSE)
#3)Read in the features and transpose to columns and extract only the named row.
feat <- t(read.table("features.txt"))[2,]
#4)Read in the sample data and name the columns according to the feature
testdata <- read.table("X_test.txt", col.names = feat)

#5)Find the instances in the feature vector where mean and standard deviation appear
colkeep <- grep(c("mean|std"), feat)

#6 Keep only the mean and std columns
testdata <- testdata[,colkeep]
testall <- cbind(testact,testsub,testdata)

#7 Give nice names to the activities
i <-1
for (i in 1:2947){
        if(testall$activity[i]==1){
        testall$activity[i] <- "WALKING"}
    else if(testall$activity[i]==2){
        testall$activity[i] <- "WALKING UPSTAIRS"}
    else if(testall$activity[i]==3){
        testall$activity[i] <- "WALKING DOWNSTAIRS"}
    else if(testall$activity[i]==4){
        testall$activity[i] <- "SITTING"}
    else if(testall$activity[i]==5){
        testall$activity[i] <- "STANDING"}
    else{testall$activity[i] <- "LAYING"}
    i<-i+1
}



#Train group dataset tidy script follows the same routine as the test data set, minus the features
trainact <- read.csv("y_train.txt", sep = "", col.names = "activity", header = FALSE)
trainsub <- read.csv("subject_train.txt", sep = "", col.names = "subjectid", header = FALSE)
traindata <- read.table("X_train.txt", col.names = feat)

traindata <- traindata[,colkeep]
trainall <- cbind(trainact,trainsub,traindata)

i <-1
for (i in 1:7352){
    if(trainall$activity[i]==1){
        trainall$activity[i] <- "WALKING"}
    else if(trainall$activity[i]==2){
        trainall$activity[i] <- "WALKING UPSTAIRS"}
    else if(trainall$activity[i]==3){
        trainall$activity[i] <- "WALKING DOWNSTAIRS"}
    else if(trainall$activity[i]==4){
        trainall$activity[i] <- "SITTING"}
    else if(trainall$activity[i]==5){
        trainall$activity[i] <- "STANDING"}
    else{trainall$activity[i] <- "LAYING"}
    i<-i+1
}

#Merge the tidy test and train datasets
mrgdat <- merge(testall,trainall, all = TRUE)

#From the dataset from the previous step, a final, independent tidy data set 
#with the average of each variable for each activity and each subject is created.
byactivity <- mrgdat %>% group_by(subjectid, activity)
final <- bysubject %>% summarise_all(mean)

#Step #4 Dataset
write.table(byactivity, file = "tidydat_mrgbyactivity.txt", sep = " ", row.names = FALSE)

#Step #5 Dataset
write.table(final, file = "tidydat_mrgbyactmean.txt", sep = " ", row.names = FALSE)