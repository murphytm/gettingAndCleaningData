run_analysis <- function( ) {

# install.packages("plyr")
library(plyr)

######## course project ########

# process 3 "train" components

xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)

allTrain <- cbind(xTrain, yTrain, subjectTrain)

# process 3 "test" components

xTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, stringsAsFactors = FALSE, fill = TRUE)

allTest <- cbind(xTest, yTest, subjectTest)

# merge "train" and "test"

allData <- rbind(allTrain, allTest)

# reduce

trimmedData <- allData[, c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 82, 83, 84, 85, 86,
                           121, 122, 123, 124, 125, 126, 161, 162, 163, 164, 165, 166,
                           201, 202, 214, 215, 227, 228, 240, 241, 253, 254,
                           266, 267, 268, 269, 270, 271, 345, 346, 347, 348, 349, 350, 424, 425, 426, 427, 428, 429,
                           503, 504, 516, 517, 529, 530, 542, 543,
                           562, 563)]

# meaningful column names

colnames(trimmedData) <- c("timeBodyAccMeanX", "timeBodyAccMeanY", "timeBodyAccMeanZ", "timeBodyAccStdX", "timeBodyAccStdY",
                           "timeBodyAccStdZ", "timeGravityAccMeanX", "timeGravityAccMeanY", "timeGravityAccMeanZ", "timeGravityAccStdX",
                           "timeGravityAccStdY", "timeGravityAccStdZ", "timeBodyAccJerkMeanX", "timeBodyAccJerkMeanY", "timeBodyAccJerkMeanZ",
                           "timeBodyAccJerkStdX", "timeBodyAccJerkStdY", "timeBodyAccJerkStdZ", "timeBodyGyroMeanX", "timeBodyGyroMeanY",
                           "timeBodyGyroMeanZ", "timeBodyGyroStdX", "timeBodyGyroStdY", "timeBodyGyroStdZ", "timeBodyGyroJerkMeanX",
                           "timeBodyGyroJerkMeanY", "timeBodyGyroJerkMeanZ", "timeBodyGyroJerkStdX", "timeBodyGyroJerkStdY", "timeBodyGyroJerkStdZ",
                           "timeBodyAccMagMean", "timeBodyAccMagStd", "timeGravityAccMagMean", "timeGravityAccMagStd", "timeBodyAccJerkMagMean",
                           "timeBodyAccJerkMagStd", "timeBodyGyroMagMean", "timeBodyGyroMagStd", "timeBodyGyroJerkMagMean", "timeBodyGyroJerkMagStd",
                           "freqBodyAccMeanX", "freqBodyAccMeanY", "freqBodyAccMeanZ", "freqBodyAccStdX", "freqBodyAccStdY",
                           "freqBodyAccStdZ", "freqBodyAccJerkMeanX", "freqBodyAccJerkMeanY", "freqBodyAccJerkMeanZ", "freqBodyAccJerkStdX",
                           "freqBodyAccJerkStdY", "freqBodyAccJerkStdZ", "freqBodyGyroMeanX", "freqBodyGyroMeanY", "freqBodyGyroMeanZ",
                           "freqBodyGyroStdX", "freqBodyGyroStdY", "freqBodyGyroStdZ", "freqBodyAccMagMean", "freqBodyAccMagStd",
                           "freqBodyBodyAccJerkMagMean", "freqBodyBodyAccJerkMagStd", "freqBodyBodyGyroMagMean", "freqBodyBodyGyroMagStd", "freqBodyBodyGyroJerkMagMean",
                           "freqBodyBodyGyroJerkMagStd")

names(trimmedData)[67] <- "Activity"

trimmedData$Activity <- factor(trimmedData$Activity, levels = c("1", "2", "3", "4", "5", "6"),
                                                     labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

names(trimmedData)[68] <- "Subject"

# average of each variable for each activity and each subject

tidy <- ddply(trimmedData, .(Activity, Subject), numcolwise(mean))

# tidy dataset

write.table(tidy, file = "./UCI HAR Dataset/tidy.txt", row.names = FALSE)

}
