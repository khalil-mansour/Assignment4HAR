# Human Activity Recognition (HAR) dataset formatting

The objective of this assignment is to collect, format, merge, summarize and clean a dataset prior to performing analysis.
The HAR dataset is the chosen dataset for this assignment and can be downloaded [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Assignment

1. Create an R script called `run_analysis.R` that will perform the following.
2. Load the data tables from the following files:
- `features.txt`
- `activity_labels.txt`
- `X_train.txt` & `X_test.txt`
- `y_train.txt` & `y_test.txt`
- `subject_train.txt` & `subject_test.txt`
3. Merge the training and test sets into one dataset. Each set contains the files `x_`, `y_` and `subject_`
containing the features, activities and subjects.
4. Extract the measurements on the mean and standard deviation for each measurement.
5. Label the dataset with descriptive variable names.
6. Create another independent tidy dataset with the average for each variable for each activity for each subject.
7. Write the resulting dataset to a file called `result.txt`.

## Contents

### Output

The output file is `result.txt` and contains the merged tidy dataset with the average for each variable.

### Input

The input files are contained in `/UCI HAR Dataset/` and consist of the files enumerated in step 2.

### Script

The only script file is `run_analysis.R`. This script is what takes produces the output from the input files 
following the steps listed above.

### Codebook

The codebook is a markdown file called `Codebook.md` and it contains a description of the variables, units and summaries
calculated.