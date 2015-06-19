# Step 1. 
# Merges the training and the test sets to create one data set.
# setwd("/Users/ferry/Documents/study/R/GettingAndCleaningDataPeerAssignment")
trainData <- read.table("./data/train/X_train.txt")
trainActivity <- read.table("./data/train/y_train.txt")
trainSubject <- read.table("./data/train/subject_train.txt")
testData <- read.table("./data/test/X_test.txt")
testActivity <- read.table("./data/test/y_test.txt") 
testSubject <- read.table("./data/test/subject_test.txt")
joinData <- rbind(trainData, testData)
joinActivity <- rbind(trainActivity, testActivity)
joinSubject <- rbind(trainSubject, testSubject)
mergedData <- cbind(joinSubject, joinActivity, joinData)

# Step2. 
# Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("./data/features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
mergedData <- mergedData[, c(1, 2, meanStdIndices + 2)]

# Step3. 
# Uses descriptive activity names to name the activities in the data set
activity <- read.table("./data/activity_labels.txt")
activityLabel <- activity[joinActivity[, 1], 2]
mergedData[, 2] <- activityLabel

# Step4. 
# Appropriately labels the data set with descriptive variable names. 
names <- c("subject", "activity", as.character(features[meanStdIndices, 2]))
names <- gsub("\\(\\)", "", names)
names(mergedData) <- names

# Step5. 
# From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.
library(plyr)
library(reshape2)
dataWithMean <- ddply(melt(mergedData, id.vars=c("subject", "activity")), 
                        .(subject, activity), summarise, mean=mean(value))

write.table(mergedData, "merged_data.txt", row.name = F)
write.table(dataWithMean, "data_with_means.txt", row.name = F)