# packages

library(dplyr)
library(reshape2)

# load features and activities

features <- read.table('./UCI HAR Dataset/features.txt',
                       header = FALSE,
                       col.names = c("number", "feature"))
activities <- read.table('./UCI HAR Dataset/activity_labels.txt',
                         header = FALSE,
                         col.names = c("activity_number", "activity"))

# load training data

x_train <- read.table('./UCI HAR Dataset/train/X_train.txt', header = FALSE,
                      col.names = features$feature)
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt', header = FALSE,
                      col.names = "activity_number")
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt',
                            header = FALSE, col.names = "subject")

# load testing data

x_test <- read.table('./UCI HAR Dataset/test/X_test.txt', header = FALSE,
                     col.names = features$feature)
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt', header = FALSE,
                     col.names = "activity_number")
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt',
                           header = FALSE, col.names = "subject")

# combine data (STEP 1)

x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

combined <- cbind(subject, y, x)

# clean transitional data

rm(x_train, y_train, x_test, y_test, subject_train, subject_test, x, y, subject)

# extract means and std of each measurement into new data frame (STEP 2)

result <- select(combined, subject, activity_number,
                 contains('mean'), contains('std'))

# apply descriptive names for activities (STEP 3)

result <- merge(activities, result, by = "activity_number")

result <- result %>%
  select(subject, activity, 4:89) %>% # 3rd column not needed (activity number)
  arrange(subject, activity)

# reshape data into slim & long table (STEP 4)

resultMelt <- melt(result,
                   id = c("subject", "activity"),
                   measure.vars = c(3:88),
                   value.name = "measurement")

# get the average of each variable for each activity and each subject (STEP 5)

resultSummary <- resultMelt %>%
  group_by(subject, activity, variable) %>%
  summarize(mean_measurement = mean(measurement))

# write file

write.table(resultSummary, file="result.txt", quote = FALSE, row.names = FALSE)
