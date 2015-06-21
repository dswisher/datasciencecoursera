# Read in the data. This assumes the current working directory is the root of the zip
# file - the directory containing the README.txt file.

if (!file.exists("features.txt")) {
    stop("Please make sure your working directory is set to the directory containing the data!")
}

# Load the labels and features, and clean up the names
activity.labels <- read.table("activity_labels.txt", header = FALSE, col.names = c("code", "activity"), stringsAsFactors = FALSE)
features.raw <- read.table("features.txt", header = FALSE, sep = " ", col.names = c("code", "feature"), stringsAsFactors = FALSE)
features <- sub("\\.$", "", gsub("(\\.\\.\\.)|(\\.\\.)", ".", gsub("[(),-]", ".", features.raw[,2])))

# Load the raw data
train.activity.raw <- read.table("train/y_train.txt", header = FALSE, col.names = c("code"))
test.activity.raw <- read.table("test/y_test.txt", header = FALSE, col.names = c("code"))

train.subject <- read.table("train/subject_train.txt", header = FALSE, col.names = c("subject"), colClasses = c("numeric"))
test.subject <- read.table("test/subject_test.txt", header = FALSE, col.names = c("subject"), colClasses = c("numeric"))

train.raw <- read.table("train/X_train.txt", header = FALSE, col.names = features)
test.raw <- read.table("test/X_test.txt", header = FALSE, col.names = features)

# Search for the columns we want
desired.cols <- grep("(\\.mean)|(\\.std)", features)

# Use human-readable activity names
train.activity.name <- merge(activity.labels, train.activity.raw, by.x = "code", by.y = "code")
test.activity.name <- merge(activity.labels, test.activity.raw, by.x = "code", by.y = "code")

# Pick out the columns we want
train.subset <- train.raw[,desired.cols]
test.subset <- test.raw[,desired.cols]

# Combine the raw data into something a bit more tidy
train.combo <- data.frame(train.subject, train.activity.raw, train.subset)
test.combo <- data.frame(test.subject, test.activity.raw, test.subset)

train <- merge(activity.labels, train.combo, by.x = "code", by.y = "code")
train$code <- NULL

test <- merge(activity.labels, test.combo, by.x = "code", by.y = "code")
test$code <- NULL

tidy <- rbind(train, test)

# Summarize the data
means <- aggregate(.~ subject + activity, tidy, mean)

# Save the data for posterity
write.table(tidy, "tidy.txt", row.names = FALSE)
write.table(means, "means.txt", row.names = FALSE)

