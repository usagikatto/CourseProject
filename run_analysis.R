# Step 1: Download and unzip the data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "UCI_HAR_Dataset.zip"
if (!file.exists(zipfile)) download.file(url, zipfile, mode = "wb")
if (!file.exists("UCI HAR Dataset")) unzip(zipfile)

# Step 2: Read data files
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

# Step 3: Merge training and test sets
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged <- cbind(subject, y, x)

# Step 4: Extract mean and standard deviation measurements
library(dplyr)
tidy <- merged %>%
  select(subject, code, contains("mean"), contains("std"))

# Step 5: Use descriptive activity names
tidy$code <- activities[tidy$code, 2]

# Step 6: Label variables with descriptive names
names(tidy)[2] <- "activity"
names(tidy) <- gsub("^t", "Time", names(tidy))
names(tidy) <- gsub("^f", "Frequency", names(tidy))
names(tidy) <- gsub("Acc", "Accelerometer", names(tidy))
names(tidy) <- gsub("Gyro", "Gyroscope", names(tidy))
names(tidy) <- gsub("Mag", "Magnitude", names(tidy))
names(tidy) <- gsub("BodyBody", "Body", names(tidy))

# Step 7: Create final tidy dataset with averages
final <- tidy %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Step 8: Write the tidy data to a file
write.table(final, "tidy_dataset.txt", row.name = FALSE)