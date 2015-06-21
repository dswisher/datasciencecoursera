
# Read in the data. This assumes the current working directory is the root of the zip
# file - the directory containing the README.txt file.

# Load the labels and features, and clean up the names
activity.labels <- read.table("activity_labels.txt", header = FALSE, col.names = c("code", "activity"))
features.raw <- read.table("features.txt", header = FALSE, sep = " ", col.names = c("code", "feature"), stringsAsFactors = FALSE)
features <- sub("\\.$", "", gsub("(\\.\\.\\.)|(\\.\\.)", ".", gsub("[(),-]", ".", features.raw[,2])))

# Load the raw data
train.activity <- read.table("train/y_train.txt", header = FALSE, col.names = c("code"))
test.activity <- read.table("test/y_test.txt", header = FALSE, col.names = c("code"))

train.subject <- read.table("train/subject_train.txt", header = FALSE, col.names = c("subject"))
test.subject <- read.table("test/subject_test.txt", header = FALSE, col.names = c("subject"))

train.raw <- read.table("train/X_train.txt", header = FALSE, col.names = features)
test.raw <- read.table("test/X_test.txt", header = FALSE, col.names = features)

# Search for the columns we want
desired.cols <- grep("(\\.mean)|(\\.std)", features)

# Use human-readable activity names
train.pretty <- inner_join(activity.labels, train.activity, by=c("code"))
test.pretty <- inner_join(activity.labels, test.activity, by=c("code"))

# Combine the raw data into something a bit more tidy
train <- cbind(train.subject, train.pretty[2], train.raw[desired.cols])
test <- cbind(test.subject, test.pretty[2], test.raw[desired.cols])

tidy1 <- rbind(train, test)

# Summarize the data
# TODO - dplyr group_by/mean?

