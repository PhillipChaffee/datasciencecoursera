##Read in the two data frames
train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")

##Merge them into one data frame
data <- rbind(train,test)

##Gather column data
features <- scan("features.txt", what="character", sep="\n")
columns <- numeric(0)
colnames <- character(0)
for(i in 1:(length(features))) {
  if((grep("-mean()", features[i], fixed=T)) != integer(0)) {
    columns <- c(columns, i)
    colnames <- c(colnames, features[i])
  }
  else if(grep("-std()", features[i], fixed=T) != integer(0)) {
    columns <- c(columns, i)
    colnames <- c(colnames, features[i])
  }
}

##Subset to only mean and std values & merge back together


##Read in train/test subject/activity data
trainSubs <- scan("train/subject_train.txt", what="numeric", sep="\n")
trainAct <- scan("train/y_train.txt", what="numeric", sep="\n")
testSubs <- scan("test/subject_test.txt", what="numeric", sep="\n")
testAct <- scan("test/y_test.txt", what="numeric", sep="\n")

##Add subject and activity columns
data$Subject <- c(trainSubs, testSubs)
data$Activity <- c(trainAct, testAct)
