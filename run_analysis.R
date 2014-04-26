# Create a tidy data set with the average of only the measurements on the mean
# and standard deviation for each activity and each subject.

library(reshape2)

activity <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=TRUE)
# apply more descriptive column names
names(activity) <- c("code", "name")

feature <- read.table("UCI HAR Dataset/features.txt")
# apply more descriptive column names
names(feature) <- c("code", "name")

train.x <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses=c("numeric"), nrows=7352)
train.y <- read.table("UCI HAR Dataset/train/y_train.txt", colClasses=c("numeric"), nrows=7352)
test.x <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses=c("numeric"), nrows=2947)
test.y <- read.table("UCI HAR Dataset/test/y_test.txt", colClasses=c("numeric"), nrows=2947)
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt", colClasses=c("numeric"), nrows=7352)
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt", colClasses=c("numeric"), nrows=2947)

# merge the training and test data sets
merged.x <- rbind(train.x, test.x)
# use the variable names from the features file
names(merged.x) <- feature$name
merged.y <- rbind(train.y, test.y)
merged.subject <- rbind(train.subject, test.subject)
# apply a more descriptive column name for labels
names(merged.y) <- c("code")

# extract only the measurements on the mean and standard deviation
measures <- merged.x[grepl("(mean|std|meanFreq)\\(", names(merged.x))]

# clean up the variable names - convert camel case to dot notation
varnames <- gsub("([a-z])([A-Z])", "\\1.\\L\\2", names(measures), perl=TRUE)
# remove parentheses
varnames <- sub("()", "", varnames, fixed=TRUE)
# change hyphens to dots
varnames <- gsub("-", ".", varnames, fixed=TRUE)
# change commas used in ranges to hyphens
varnames <- sub(",", "-", varnames, fixed=TRUE)
# convert column names to lower case
names(measures) <- sapply(varnames, tolower)

# combine the activities into the merged data set
measures <- cbind(activity$name[match(merged.y$code, activity$code)], measures)
# combine the subjects into the merged data set
measures <- cbind(merged.subject[, 1], measures)
# apply more descriptive column names for these columns
names(measures)[1:2] <- c("subject", "activity")
# convert subject values into a factor
measures$subject <- factor(measures$subject)

######## Method 1 - using Reshape2   ####################

m <- melt(measures, id=c("subject", "activity"))
df <- dcast(m, subject + activity ~ variable, mean)
# add a prefix to the name of derived columns
names(df)[3:length(df)] <- sapply(names(df)[3:length(df)], function (x) paste("avg.", x, sep=""))

# write the data frame to a txt file
write.table(df, file="average_measures_by_subject_and_activity.txt", row.names=FALSE)


######## Method 2 - without Reshape2 ####################

# identify the numeric columns
nums <- sapply(measures, is.numeric)

# split the merged data set by subject and activity
s <- split(measures[, nums], list(measures$activity, measures$subject))

# create a matrix of the mean values by subject and activity
mat <- sapply(s, colMeans)

tm <- t(mat)
# extract the non-numeric subject and activity columns from the row names
# back into the data set
tm <- cbind(t(sapply(strsplit(rownames(tm), "\\."), identity))[, 2:1], tm)

# convert the matrix into a data frame
df2 <- data.frame(tm)

# apply more descriptive column names to subject and activity
names(df2)[1:2] <- c("subject", "activity")
# add a prefix to the name of derived columns
names(df2)[3:length(df2)] <- sapply(names(df2)[3:length(df2)], function (x) paste("avg.", x, sep=""))

# write the data frame to a txt file, first including the row names and header
write.table(df2, file="average_measures_by_subject_and_activity2.txt", row.names=FALSE)
