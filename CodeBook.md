# CodeBook

## Overview

This codebook describes the variables, data, and transformations used to create the tidy dataset `tidy_dataset.txt` for the Getting and Cleaning Data course project. The original data was collected from the accelerometers of the Samsung Galaxy S smartphone.

## Source Data

Original data source:
[UCI Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Raw data used:
- `train/X_train.txt`
- `train/y_train.txt`
- `train/subject_train.txt`
- `test/X_test.txt`
- `test/y_test.txt`
- `test/subject_test.txt`
- `features.txt`
- `activity_labels.txt`

## Data Processing Steps

1. **Merged the training and test datasets** to create one complete dataset.
2. **Extracted only the measurements on the mean and standard deviation** for each measurement.
3. **Used descriptive activity names** to label the activities in the dataset.
4. **Renamed variables** with more descriptive labels:
    - Prefix `t` → `Time`
    - Prefix `f` → `Frequency`
    - `Acc` → `Accelerometer`
    - `Gyro` → `Gyroscope`
    - `Mag` → `Magnitude`
    - `BodyBody` → `Body`
5. **Created a second tidy dataset** with the **average of each variable for each activity and each subject**.

## Variables in `tidy_dataset.txt`

Each row in the final tidy dataset represents a **unique subject-activity pair**, and each column is the **average of a specific measurement**.

### Identifiers:
- `subject`: ID of the subject (integer from 1 to 30)
- `activity`: Activity performed by the subject (e.g., WALKING, SITTING)

### Measurement Variables:
These are averages of the mean and standard deviation features originally extracted from the raw dataset. Examples include (but not limited to):

- `TimeBodyAccelerometerMeanX`
- `TimeBodyAccelerometerMeanY`
- `TimeBodyAccelerometerMeanZ`
- `TimeBodyAccelerometerStdX`
- `TimeBodyAccelerometerStdY`
- `FrequencyBodyGyroscopeMeanX`
- `FrequencyBodyGyroscopeStdZ`

Each variable name follows the pattern:

`[Time|Frequency][Body|Gravity][Accelerometer|Gyroscope][Jerk|][Magnitude|][Mean|Std][X|Y|Z]`

Values are numeric and represent the average of the corresponding measurement across all observations for a given subject-activity pair.


