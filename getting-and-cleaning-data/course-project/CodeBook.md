# Codebook #

Data was gathered for each subject and activity. The `tidy.txt` file contains this data,
with one row per sample. The variable column contains the name of the variable, as listed
in the section below. There are multiple rows with the same identifier (as there are
multiple samples per subject+activity+variable).

The `means.txt` file contains a summary of the data, with one row per identifier
(subject+activity+variable). The rows are combined using the mean (average) function. 

## Identifiers ##
- subject - the ID of the subject
- activity - the name of the activity in which the subject was engaged
- variable - the name of the variable - see below

## Variables ##
In the names below, XYZ indicates three variables: one for X, one for Y and one for Z.
In addition, "mean" indicates an average value, and "std" indicates a standard deviation.

For details on each data point, see the original paper cited in the [README](README.md).
The names were altered slightly from the original, to make them valid R names: parenthesis, dashes and commas were removed. A subset of the original data points was selected: only features with "mean" or "std" in their names were retained (case sensitive).

- tBodyAcc.mean.XYZ
- tBodyAcc.std.XYZ
- tGravityAcc.mean.XYZ
- tGravityAcc.std.XYZ
- tBodyAccJerk.mean.XYZ
- tBodyAccJerk.std.XYZ
- tBodyGyro.mean.XYZ
- tBodyGyro.std.XYZ
- tBodyGyroJerk.mean.XYZ
- tBodyGyroJerk.std.XYZ
- tBodyAccMag.mean
- tBodyAccMag.std
- tGravityAccMag.mean
- tGravityAccMag.std
- tBodyAccJerkMag.mean
- tBodyAccJerkMag.std
- tBodyGyroMag.mean
- tBodyGyroMag.std
- tBodyGyroJerkMag.mean
- tBodyGyroJerkMag.std
- fBodyAcc.mean.XYZ
- fBodyAcc.std.XYZ
- fBodyAcc.meanFreq.XYZ
- fBodyAccJerk.mean.XYZ
- fBodyAccJerk.std.XYZ
- fBodyAccJerk.meanFreq.XYZ
- fBodyGyro.mean.XYZ
- fBodyGyro.std.XYZ
- fBodyGyro.meanFreq.XYZ
- fBodyAccMag.mean
- fBodyAccMag.std
- fBodyAccMag.meanFreq
- fBodyBodyAccJerkMag.mean
- fBodyBodyAccJerkMag.std
- fBodyBodyAccJerkMag.meanFreq
- fBodyBodyGyroMag.mean
- fBodyBodyGyroMag.std
- fBodyBodyGyroMag.meanFreq
- fBodyBodyGyroJerkMag.mean
- fBodyBodyGyroJerkMag.std
- fBodyBodyGyroJerkMag.meanFreq


