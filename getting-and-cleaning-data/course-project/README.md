# Getting and Cleaning Data - Course Project #

## Overview ##

The goal of this project is to take raw data from [this zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and turn it into a [tidy data](https://d396qusza40orc.cloudfront.net/getdata/lecture_slides/01_03_componentsOfTidyData.pdf) set.


## Running the Script ##

To run the script, follow these steps:

1. Make sure you have the `dplyr` package installed. If unsure, run `install.packages("dplyr")`.
2. Make sure you have the `reshape2` package installed. If unsure, run `install.packages("reshape2")`.
1. Download the [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip the contents to a directory of your choice.
1. Open R Studio and set the working directory to the directory created in the previous step.
1. Open the `run_analysis.R` script and run it using the "Source" button in the upper right of the text editor window.
1. The tidy data set is written to `tidy.txt`. A summary tidy data set containing the means of each value, grouped by subject and activity, is written to `means.txt`. The summary data set is the one for submission as part of the assignment.


## Feature Selection ##

The raw data set contains many features. For this analysis, we are concerned with the means and standard deviations. These are defined as the features whose names contain mean() or std(). See the [code book](CodeBook.md) for details.


## References ##

The data was gathered as part of a study on recognizing human activity using sensors available in smart phones. More information on the data set is available in the README.txt contained withing the zip file as well as this [web page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The citation for the paper describing the experiment is:

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

