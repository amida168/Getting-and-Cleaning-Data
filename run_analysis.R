#library(dplyr)
#library(tidyr)
library(gdata)
library(reshape2)
# 1. Merges the training and the test sets to create one data set.

#read train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
names(X_train) <- features[,2]
X_train <- cbind(subject_train, y_train, X_train)

# read test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
names(X_test) <- features[,2]
X_test <- cbind(subject_test, y_test, X_test)

X_combined <- rbind(X_train, X_test)
colnames(X_combined)[1:2] <- c("subject_id", "activity_id")


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

X_extracted <- X_combined[,unlist(matchcols(X_combined, with = c("id", "\\-mean\\(", "\\-std\\("), method = "or"))]

# 3. Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("activity_id", "activity_label")
X_extracted$activity_id <- activity_labels$activity_label[match(X_extracted$activity_id, activity_labels$activity_id)]
colnames(X_extracted)[2] <- "activity"

# 4. Appropriately labels the data set with descriptive variable names. 
# done in step 1

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
X_narrow <- melt(X_extracted, id.vars = c("subject_id", "activity"))
X_wide <- dcast(X_narrow, subject_id + activity ~ variable, fun.aggregate = mean)

write.table(X_wide, "tidy_data.txt", row.name=FALSE)