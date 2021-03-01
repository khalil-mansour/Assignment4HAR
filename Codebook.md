# Codebook

This file contains information on the variables from the original and resulting dataset
as well as information on the transformations, summaries and formatting made.

## Assumptions

- The zip file provided has been downloaded and extracted into the working repository under `./UCI HAR Dataset/`
- The packages in the script file have been installed prior to execution.

## Original dataset

The following files are the ones used in this assignment from the downloaded zip file:

- `features.txt`
- `activity_labels.txt`
- `X_train.txt` & `X_test.txt`
- `y_train.txt` & `y_test.txt`
- `subject_train.txt` & `subject_test.txt`
- The data in the `Inertial Signals` folders are NOT used for this assignment.

### Contents

- The `X_` files contain 561 observations obtained from the sensors (see `features_info.txt`)
- The `y_` files contain the activity code in a single column (1 to 6).
- The `subject_` files contain a single column that identifies the user (1 to 30).
- The `features.txt` file contains the names of the 561 columns that are to be assigned to the `X_` data files.
- The collected data have been split (70/30) into `_train` and `_test` respectively.

## Solution

The solution dataset can be found in `result.txt`.
It contains 15480 observations of the 4 following variables:

- `subject` -> id of the subject observed.
- `activity` -> name of the activity performed by the subject.
- `variable` -> filtered variables containing the `mean` and `std` of the observed activity for the subject.
- `mean_measurement` -> average of the measured variables.

## Decisions

- In order to tidy the dataset, I chose to reshape it into a long and slim data frame for easier readability.
- I chose to include all columns that contain the literals `mean` and `std` and not exclusively `mean()` values
when filtering the dataset. My interpretation is simply that the measurements contain these literals in the name.
Since it was up for interpretation, I chose this method as it is more intuitive.
