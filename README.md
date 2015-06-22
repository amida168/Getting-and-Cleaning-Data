# Getting-and-Cleaning-Data
This is the project repo for the Courera course Getting and Cleaning Data.

The project have the following files/folder:

- README.md - this file

- CODEBOOK.md - code book describing the tidy data set

- run_analysis.R - R script to process the data and transform it to a tidy data set

- UCI HAR Dataset/ - data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. See the README.txt file in the folder for the description of this raw data set.


The script file does the following steps:

1. Read the X_train file
2. Read subject_train file
3. Read y_train file
4. Read feautres file
5. Substitute column names of X_train file with features
6. Combine subject_train, y_train and X_train
7. Repeat the previous steps for X_test
8. Merge the X_train and X_test
9. Extracts only the measurements on the mean and standard deviation for each measurement. 
10. Create a narrow tidy data set.
11. Create a wide tidy data set with the average of each variable for each activity and each subject
12. Write the tidy data set to file
