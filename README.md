# Getting and Cleaning Data - Course Project

## Overview

This repository contains the code and documentation for the course project of the "Getting and Cleaning Data" course. The goal is to transform raw data collected from the accelerometers of the Samsung Galaxy S smartphone into a tidy dataset.

## Contents

- `run_analysis.R`: R script that performs the data cleaning and transformation.
- `tidy_dataset.txt`: The final tidy dataset (each variable is averaged by subject and activity).
- `CodeBook.md`: Description of the variables and steps taken to clean the data.
- `README.md`: This file.

## Source Data

The data used in this project comes from:
[UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Download link:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## How to Run

1. Place `run_analysis.R` in your R working directory.
2. Run the script in R using `source("run_analysis.R")`.
3. It will download and extract the dataset if not already available.
4. It will generate a file named `tidy_dataset.txt` in your working directory.

## Output

The output `tidy_dataset.txt` contains the average of each selected variable (mean and standard deviation measurements) for each activity and each subject.

Each row is a unique combination of a subject and an activity. Each column is a mean value of one of the original measurement variables.

---

Enjoy your clean and tidy data! 📊

