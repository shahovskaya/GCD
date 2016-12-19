# Code Book

## Raw Data
Downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
It must be extracted into working directory.

## The Process Used
 * Read "train" and "test" data
 * Extract the variables names and activities labels
 * Combine the measurements with the subjects and activities
 * Extract mean() and std() variables
 * Group the data by subject and activity to calculate the mean

## Output
The results will be saved in ```tidy_data.txt```. 
