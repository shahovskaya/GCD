## 1. READ PACKAGES
library("data.table")

## 2. FEATURES / ACTIVITIES:
features <- read.csv("features.txt", header = FALSE, sep = ' ')
activity<-read.table("activity_labels.txt")

##3. TRAIN:
XTrain<- read.table("train/X_train.txt")
YTrain<- read.table("train/Y_train.txt")
SubjectTrain <-read.table("train/subject_train.txt")

## 4. TEST:
XTest<- read.table("test/X_test.txt")
YTest<- read.table("test/Y_test.txt")
SubjectTest <-read.table("test/subject_test.txt")

## 5. MERGING DATA
X<-rbind(XTest, XTrain)
Y<-rbind(YTest, YTrain)
Subject<-rbind(SubjectTest, SubjectTrain)

## 6. REMOVE OLD DATA SETS
rm("XTest","XTrain","YTest","YTrain", "SubjectTest", "SubjectTrain")

## 7. Getting mean and dt.deviation
index<-grep("mean\\(\\)|std\\(\\)", features[,2])
X<-X[,index] 
dim(X)

## 8. Naming activities in data set
Y[,1]<-activity[Y[,1],2]
names<-features[index,2]
names(Subject)<-"SubjectID"
names(Y)<-"Activity"
DataClean<-cbind(Subject, Y, X)

## 9. Creating new tidy data set with average of each variable for each activity and each subject
DataClean<-data.table(DataClean)
DataNew <- DataClean[, lapply(.SD, mean), by = 'SubjectID,Activity'] 
dim(DataNew)
write.table(DataNew, file = "Tidy.txt", row.names = FALSE) 
