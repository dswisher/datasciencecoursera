require(dplyr)
require(reshape2)

# Make sure we have the data available
if (!file.exists("features.txt")) {
    stop("Please make sure your working directory is set to the directory containing the data!")
}

# Read in the data. This assumes the current working directory is the root of the zip
# file - the directory containing the README.txt file.

# Load the labels and features, and clean up the names
activity.labels <- read.table("activity_labels.txt", header = FALSE, col.names = c("code", "activity"))
features.raw <- read.table("features.txt", header = FALSE, sep = " ", col.names = c("code", "feature"), stringsAsFactors = FALSE)
features <- sub("\\.$", "", gsub("(\\.\\.\\.)|(\\.\\.)", ".", gsub("[(),-]", ".", features.raw[,2])))

# Load the raw data
train.activity <- read.table("train/y_train.txt", header = FALSE, col.names = c("code"))
test.activity <- read.table("test/y_test.txt", header = FALSE, col.names = c("code"))

train.subject <- read.table("train/subject_train.txt", header = FALSE, col.names = c("subject"), colClasses = c("factor"))
test.subject <- read.table("test/subject_test.txt", header = FALSE, col.names = c("subject"), colClasses = c("factor"))

train.raw <- read.table("train/X_train.txt", header = FALSE, col.names = features)
test.raw <- read.table("test/X_test.txt", header = FALSE, col.names = features)

# Search for the columns we want
desired.cols <- grep("(\\.mean)|(\\.std)", features)

# Use human-readable activity names
train.pretty <- merge(activity.labels, train.activity, by.x = "code", by.y = "code")
test.pretty <- merge(activity.labels, test.activity, by.x = "code", by.y = "code")

# Combine the raw data into something a bit more tidy
train <- cbind(train.subject, train.pretty[2], train.raw[desired.cols])
test <- cbind(test.subject, test.pretty[2], test.raw[desired.cols])

tidy <- rbind(train, test)

# Summarize the data
# WRONG: gives 40 rows instead of 180
# means <- tidy %>% group_by(subject, activity) %>% summarise_each(funs(mean))

# Melt and use narrow format to make it easy to compute means
tidy.melted <- melt(tidy, id=c("subject", "activity"))
means.melted <- tidy.melted %>% group_by(subject, activity, variable) %>% summarize(value = mean(value))

# WRONG: gives 40 rows instead of 180
# means <- aggregate(.~ subject + activity, tidy, mean)

# Save the data for posterity
# TODO - write out the data!
# write.table(tidy, "tidy-wide.txt")
write.table(tidy.melted, "tidy.txt", row.names = FALSE)
write.table(means.melted, "means.txt", row.names = FALSE)

