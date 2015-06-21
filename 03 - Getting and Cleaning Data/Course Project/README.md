#Getting & Cleaning Data Course Project

##Data used for this project

-Website - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
-Direct Link - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Included in this repo

-run_analysis.R - An R script used to take the provided data and create a small, clean, tidy data set.
-CodeBook.md - The code book describing the used variables and how to read them.

##Tidy Data Set <- Data Set

1. The two original data frames, test and train, are read into R.
2. They are merged into one data set using rbind().
3. The features list is read in from features.txt.
4. The list is subsetted to values with mean() and std() values, storing the column locations in columns and names in colnames.
5. The colnames variable's contents are cleaned up by removing non-alphabet characters.
6. The merged data frame is subsetted based on the column numbers now stored in the columns variable.
7. The subject and actvity data is read in.
8. The subject and activity data is appended to the data frame as two new columns.
9. The acticity numbers are replaced with their respective names.
10. The column/variable names are added to the data set.
11. The new data is created. A single row for each subject/actvity pair is created with the mean values for every column of that pair.
12. The new data set is written to a file called tidyUCIdata.txt.
