# Getting and Cleaning Data - Course Project

This codebook provides information about the variables, data, and transformations used in the final tidy dataset, created for the course project associated with the "Getting and Cleaning Data" course, run by Johns Hopkins University and Coursera.

## Raw Data

The raw version of this data can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A description of this raw data, including how it was collected and pre-processed, can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Processing the Data

First, the training and testing sets were merged independently of each other, and then they were all merged together into one data frame that contained all the variables from each. Then, other than the subject and activity ID variables, only the mean and standard deviation columns for each measurement were extracted out of the original, and the final data set contains the mean value of each continuous variable, aggregated across subject and activity type. Variable labels were cleaned up as well.

## Attribute Information

For each row in the dataset, the following is provided:
- An identifier of the activity
- The activity label (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- An identifier of the subject who carried out the experiment.
- Mean and standard deviation values of triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Mean and standard deviation values of triaxial angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 

## List of Variables in the Tidy Data Set

Here is a list of all the variables in the tidy data set:
-activityID
-subjectID
-TimeBodyAccMagnitudeMean
-TimeBodyAccMagnitudeStdDev
-TimeGravityAccMagnitudeMean
-TimeGravityAccMagnitudeStdDev
-TimeBodyAccJerkMagnitudeMean
-TimeBodyAccJerkMagnitudeStdDev
-TimeBodyGyroMagnitudeMean
-TimeBodyGyroMagnitudeStdDev
-TimeBodyGyroMagnitudeMean
-TimeBodyGyroMagnitudeStdDev
-FrequencyBodyAccMagnitudeMean
-FrequencyBodyAccMagnitudeStdDev
-FrequencyBodyAccJerkMagnitudeMean
-FrequencyBodyAccJerkMagnitudeStdDev
-FrequencyBodyGyroMagnitudeMean
-FrequencyBodyGyroMagnitudeStdDev
-FrequencyBodyGyroJerkMagnitudeMean
-FrequencyBodyGyroJerkMagnitudeStdDev
-activityType

Please see Attribute Information above to understand what each of these variables is measuring.

