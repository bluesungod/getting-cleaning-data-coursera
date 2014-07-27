# This file will run a script in accordance with the instructions of the course
# project for "Getting and Cleaning Data" through Coursera and Johns Hopkins.

# The data comes from the UCI HAR Dataset.

# First, the working directory must be set - wherever the dataset was unzipped.

# Let's read in all the relevant datasets first.
subject_Test <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
        header=FALSE)
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt", header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
subject_Train <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
        header=FALSE)
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt", header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", 
        header=FALSE)

# The original files did not have headers so let's add some.
colnames(subject_Test) <- "subjectID"
colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityID"
colnames(subject_Train) <- "subjectID"
colnames(activity_labels) <- c("activityID", "activityType")

# Now let's merge together the test and the train datasets individually.
# Merge training dataset first.
train_data <- cbind(y_train, subject_Train, x_train)

# Merge test dataset now
test_data <- cbind(y_test, subject_Test, x_test)

# Now combine test dataset and training dataset into one file.
merged_data <- rbind(train_data, test_data)

# To extract only the data on mean and std dev, let's use a logical vector.
# First we need to create the vector based on the column names.
column_names <- colnames(merged_data)
logical <- (grepl("activity..", column_names) | grepl("subject..", column_names) 
        | grepl("-mean..", column_names) & !grepl("-meanFreq..", column_names) & 
        !grepl("mean..-", column_names) | grepl("-std..", column_names) & 
        !grepl("-std()..-", column_names))

# Now subset out the relevant data using the logical vector we have created.
new_merged_data <- merged_data[logical==TRUE]

# Time to merge in the activity labels so we know what activities we're talking 
# about.
merged_with_activity <- merge(new_merged_data, activity_labels, by="activityID", 
        all.x=TRUE)

# Clean up the data labels.
new_column_names <- colnames(merged_with_activity)

for (i in 1:length(new_column_names)) {
  new_column_names[i] <- gsub("\\()","",new_column_names[i])
  new_column_names[i] <- gsub("-std$","StdDev",new_column_names[i])
  new_column_names[i] <- gsub("-mean","Mean",new_column_names[i])
  new_column_names[i] <- gsub("^(t)","Time",new_column_names[i])
  new_column_names[i] <- gsub("^(f)","Frequency",new_column_names[i])
  new_column_names[i] <- gsub("([Gg]ravity)","Gravity",new_column_names[i])
  new_column_names[i] <- gsub("([Bb]ody[Bb]ody|[Bb]ody)",
        "Body",new_column_names[i])
  new_column_names[i] <- gsub("[Gg]yro","Gyro",new_column_names[i])
  new_column_names[i] <- gsub("AccMag","AccMagnitude",new_column_names[i])
  new_column_names[i] <- gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",
        new_column_names[i])
  new_column_names[i] <- gsub("JerkMag","JerkMagnitude",new_column_names[i])
  new_column_names[i] <- gsub("GyroMag","GyroMagnitude",new_column_names[i])
}

colnames(merged_with_activity) <- new_column_names

# For the final part of the assignment, we need to remove the activity labels
# column and then aggregate the data by each activity/subject and the mean value
# of the relevant variable. Let's do this.

revised_data <- merged_with_activity[, colnames(merged_with_activity) != 
        "activityType"]

final_data <- aggregate(revised_data[, colnames(revised_data) != c("activityID", 
        "subjectID")], by=list(activityID = revised_data$activityID, subjectID = 
        revised_data$subjectID), mean)

# Remember to put back in the activity labels.
final_data <- merge(final_data, activity_labels, by="activityID", all.x=TRUE)

# Export the final data set into a text file, and we are done!
write.table(final_data, "./tidyDataset.txt", row.names=TRUE, sep="\t")

