# Create a tidy data set with the average of each variable for each activity and each subject

activity <- read.table("UCI HAR Dataset/activity_labels.txt")

# apply more descriptive activity names
names(activity) <- c("code", "name")

feature <- read.table("UCI HAR Dataset/features.txt")

# apply more descriptive feature names
names(feature) <- c("code", "name")

train.x <- read.table("UCI HAR Dataset/train/X_train.txt")
train.y <- read.table("UCI HAR Dataset/train/y_train.txt")
test.x <- read.table("UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("UCI HAR Dataset/test/y_test.txt")

# merge the test and training data sets
merged.x <- rbind(train.x, test.x)
names(merged.x) <- feature$name
merged.y <- rbind(train.y, test.y)

# apply a more descriptive name for labels
names(merged.y) <- c("code")

# extract only the measurements on the mean and standard deviation
measures <- merged.x[grepl("mean()", names(merged.x), fixed=TRUE) | grepl("std()", names(merged.x), fixed=TRUE)]

# clean up the measurement subjects
subjects <- gsub("([a-z])([A-Z])", "\\1.\\L\\2", names(measures), perl=TRUE)
subjects <- sub("()", "", subjects, fixed=TRUE)
subjects <- gsub("-", ".", subjects, fixed=TRUE)
names(measures) <- sapply(subjects, tolower)

# combine the activity name into the merged data set
measures$activity <- activity$name[match(merged.y$code, activity$code)]

# identify the numeric columns
nums <- sapply(measures, is.numeric)

# split the merged data set by activity
s <- split(measures[, nums], measures$activity)

# create a matrix of the mean value by subject and activity
mat.by.activity <- sapply(s, colMeans)

# convert the matrix to a data frame
df <- data.frame(mat.by.activity)

# clean up the activity names
activity.names <- gsub("_", ".", names(df), fixed=TRUE)
names(df) <- sapply(activity.names, tolower)

# write the data frame to a CSV file, first including the row names and header
df <- cbind(rownames(df), df)
names(df)[1] <- "subject"
write.csv(df, file="summary_by_subject_and_activity.csv", row.names=FALSE)
