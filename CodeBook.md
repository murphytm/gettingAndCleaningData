In this "Wearable Computing" project, raw data is collected, processed, and cleaned.
The overall objective is to prepare a tidy dataset that can be used for later analysis.

The raw data for the project comes from the Human Activity Recognition Using Smartphones Dataset (Version 1.0):

   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The publication reference is:

   Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
   Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

(See README.md for more details.)

For each record, the authors provide:

   1. triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
   2. triaxial angular velocity from the gyroscope
   3. a 561-feature vector with time and frequency domain variables
   4. its activity label
   5. an identifier of the subject who carried out the experiment

The acceleration signal from the smartphone accelerometer is in standard gravity units 'g'.
The body acceleration signal is obtained by subtracting the gravity from the total acceleration.
The angular velocity vector measured by the gyroscope has units radians/second.
Features are normalized and bounded within [-1, 1].
Each feature vector is a row on the text file.

(See features_info.txt for more information about the variables used on the feature vector.)
(See features.txt for a list of all features.)

The raw datasets include the following 6 files:

   X_train.txt (training set) -- 7352 x 561
   y_train.txt (training labels) (see activity_labels.txt to link class labels to activity names [range: 1-6]) -- 7352 x 1
   subject_train.txt (subject who performed the activity [range: 1-30]) -- 7352 x 1

   X_test.txt (test set) -- 2947 x 561
   y_test.txt (test labels) (see activity_labels.txt to link class labels to activity names [range: 1-6]) -- 2947 x 1
   subject_test.txt (subject who performed the activity [range: 1-30]) -- 2947 x 1

A single R script (run_analysis.R) performs all of the processing.
The R script should be located such that the "./UCI HAR Dataset/" reference is valid.

For both training and test, the label column and subject column is merged with the feature columns (column binding).
Following this, the enhanced training and test rows are merged (row binding).
(That is, the 6 datasets listed above are the components of a single larger, merged dataset [10299 x 563].)

Activity labels were transformed into a factor, "Activity", with levels:

   "WALKING" (1), "WALKING_UPSTAIRS" (2), "WALKING_DOWNSTAIRS" (3), "SITTING" (4), "STANDING" (5), "LAYING" (6)

The column containing the subject number was renamed "Subject".

In addition to "Subject" and "Activity", the following 66 columns were selected from the merged dataset:
   (original feature/column number included)

   1 tBodyAcc-mean()-X
   2 tBodyAcc-mean()-Y
   3 tBodyAcc-mean()-Z
   4 tBodyAcc-std()-X
   5 tBodyAcc-std()-Y
   6 tBodyAcc-std()-Z
   41 tGravityAcc-mean()-X
   42 tGravityAcc-mean()-Y
   43 tGravityAcc-mean()-Z
   44 tGravityAcc-std()-X
   45 tGravityAcc-std()-Y
   46 tGravityAcc-std()-Z
   81 tBodyAccJerk-mean()-X
   82 tBodyAccJerk-mean()-Y
   83 tBodyAccJerk-mean()-Z
   84 tBodyAccJerk-std()-X
   85 tBodyAccJerk-std()-Y
   86 tBodyAccJerk-std()-Z
   121 tBodyGyro-mean()-X
   122 tBodyGyro-mean()-Y
   123 tBodyGyro-mean()-Z
   124 tBodyGyro-std()-X
   125 tBodyGyro-std()-Y
   126 tBodyGyro-std()-Z
   161 tBodyGyroJerk-mean()-X
   162 tBodyGyroJerk-mean()-Y
   163 tBodyGyroJerk-mean()-Z
   164 tBodyGyroJerk-std()-X
   165 tBodyGyroJerk-std()-Y
   166 tBodyGyroJerk-std()-Z
   201 tBodyAccMag-mean()
   202 tBodyAccMag-std()
   214 tGravityAccMag-mean()
   215 tGravityAccMag-std()
   227 tBodyAccJerkMag-mean()
   228 tBodyAccJerkMag-std()
   240 tBodyGyroMag-mean()
   241 tBodyGyroMag-std()
   253 tBodyGyroJerkMag-mean()
   254 tBodyGyroJerkMag-std()
   266 fBodyAcc-mean()-X
   267 fBodyAcc-mean()-Y
   268 fBodyAcc-mean()-Z
   269 fBodyAcc-std()-X
   270 fBodyAcc-std()-Y
   271 fBodyAcc-std()-Z
   345 fBodyAccJerk-mean()-X
   346 fBodyAccJerk-mean()-Y
   347 fBodyAccJerk-mean()-Z
   348 fBodyAccJerk-std()-X
   349 fBodyAccJerk-std()-Y
   350 fBodyAccJerk-std()-Z
   424 fBodyGyro-mean()-X
   425 fBodyGyro-mean()-Y
   426 fBodyGyro-mean()-Z
   427 fBodyGyro-std()-X
   428 fBodyGyro-std()-Y
   429 fBodyGyro-std()-Z
   503 fBodyAccMag-mean()
   504 fBodyAccMag-std()
   516 fBodyBodyAccJerkMag-mean()
   517 fBodyBodyAccJerkMag-std()
   529 fBodyBodyGyroMag-mean()
   530 fBodyBodyGyroMag-std()
   542 fBodyBodyGyroJerkMag-mean()
   543 fBodyBodyGyroJerkMag-std()

Each of these original column names were renamed using the following general conventions:

   1. "t" becomes "time"
   2. "f" becomes "freq"
   3. "-mean()" becomes "Mean"
   4. "-std()" becomes "Std"
   5. "-X" becomes "X"
   6. "-Y" becomes "Y"
   7. "-Z" becomes "Z"

The reduced dataset is 10299 x 68.

Finally, an independent tidy dataset (tidy.txt) with the average of each variable for each activity and each subject
is created from the merged and reduced dataset (primarily utilizing ddply from the plyr package).

The file tidy.txt represents a 180 x 68 table with column headers.
(30 subjects x 6 activities = 180, with 66 averages each)
