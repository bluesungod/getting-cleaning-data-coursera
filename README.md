# Getting and Cleaning Data - Course Project

This repo contains the various files required for the completion of the course project associated with the "Getting and Cleaning Data" course, run by Johns Hopkins University and Coursera.

## Overview

The goal of this project is to take data in a rawer form and process it / 'clean' it, creating a tidy dataset at the end that can be used for various types of analyses.

The raw version of this data can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A description of this raw data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Contents

This repo contains 
-a folder, "UCI HAR Dataset", that has all the unzipped raw data files. This folder needs to be placed into your working directory in order for the R script to work.
-an R script called run_analysis.R that processes the raw data files and creates a tidy dataset at the end.
-a text file, tidyDataset.txt, that represents the final output of the run_analysis.R script.
-a codebook that explains the variables of the final tidy dataset in more depth.

## Actual Assignment Instructions (from course website)

You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
