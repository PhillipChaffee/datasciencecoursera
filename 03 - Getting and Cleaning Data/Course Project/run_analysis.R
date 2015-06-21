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
  if((length(grep("-mean()", features[i], fixed=T))) > 0) {
    columns <- c(columns, i)
    colnames <- c(colnames, features[i])
  }
  else if(length(grep("-std()", features[i], fixed=T)) > 0) {
    columns <- c(columns, i)
    colnames <- c(colnames, features[i])
  }
}

##Tidy up column names
colnames <- gsub("[^[:alpha:] ]","",colnames)

##Subset to only mean and std values
data <- data[, columns]

##Read in train/test subject/activity data
trainSubs <- scan("train/subject_train.txt", what="numeric", sep="\n")
trainAct <- scan("train/y_train.txt", what="numeric", sep="\n")
testSubs <- scan("test/subject_test.txt", what="numeric", sep="\n")
testAct <- scan("test/y_test.txt", what="numeric", sep="\n")

##Add subject and activity columns
data$Subject <- c(trainSubs, testSubs)
data$Activity <- c(trainAct, testAct)

##Replace activity numbers with activity names
activities <- scan("activity_labels.txt", what="numeric", sep="\n")
for(i in 1:length(activities)) {
  activities[i] <- substring(activities[i], 3)
}
  
for(i in 1:length(data$Activity)) {
  if(data[,"Activity"][i] == "1") {
    data[,"Activity"][i] <- activities[1]
  }else if(data[,"Activity"][i] == "2") {
    data[,"Activity"][i] <- activities[2]
  }else if(data[,"Activity"][i] == "3") {
    data[,"Activity"][i] <- activities[3]
  }else if(data[,"Activity"][i] == "4") {
    data[,"Activity"][i] <- activities[4]
  }else if(data[,"Activity"][i] == "5") {
    data[,"Activity"][i] <- activities[5]
  }else if(data[,"Activity"][i] == "6") {
    data[,"Activity"][i] <- activities[6]
  }
}

##Add column/variable names
for(i in 1:length(colnames)) {
  if(i < 7) {
    names(data)[i] <- substring(colnames[i], 2)
  }
  else if(i < 19) {
    names(data)[i] <- substring(colnames[i], 3)
  }
  else {
    names(data)[i] <- substring(colnames[i], 4)
  }
}

##Create new tidy data frame
newData <- data.frame()

for(i in 1:30) {
  for(j in 1:6) {
    current <- data[data$Activity == activities[j] & data$Subject == i,]
    for(x in 1:66) {
      current[1,x] <- mean(current[,x])
    }
    newData <- rbind(newData, current[1,])
  }
}

##Write new tidy data frame
write.table(newData, file="tidyUCIdata.txt", sep=" ", na="NA", col.names=T, row.names=F)