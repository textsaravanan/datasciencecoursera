#Getting and Cleaning Data Course Project

### How run_analysis.R works

- Gathered all observation files and files with label text in one directory location

- Created run_analysis.R script with the following steps (in the same location as input files)
  * Loads data set for Training from file: X_train.txt using read.table with space as separator
  * Loads labels for Training data set from file: y_train.txt using read.table
  * Label the column name for labels set
  * Glued the labels for Training with Training data set
  * Added a column in the data frame to identify the source of the data and tagged as “Training”

  * Loads data set for Test from file: X_test.txt using read.table with space as separator
  * Loads labels for Test data set from file: y_test.txt using read.table
  * Label the column name for labels set
  * Glued the labels for Test with Test data set
  * Added a column in the data frame to identify the source of the data and tagged as “Test”

  * Loads data set for features (ask measurements) from embedded accelerometer and gyroscope
  * Merged Training and Test data sets
  * Assigned column names for source of the data and activity measured => "source","activity"
  * Extracts only the measurements on the mean and standard deviation for each measurement
  * Loads activity labels from file: activity_labels.txt and adds column names to the data
 
  * Merged activity labels data set with originally merged  Training and Test data sets
  * Rearrange columns and removed unwanted columns from the merged data set

  * Using aggregate function independent new tidy data set was created with the average of each variable for each activity and each subject

  * new tidy data set was exported as a txt file with write.table() using row.name=FALSE 

- File getdata_009_human_activity_recog.txt was uploaded to CourseEra project repository for review
  