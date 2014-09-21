In this "Wearable Computing" project, raw data is collected, processed, and cleaned.
The overall objective is to prepare a tidy dataset that can be used for later analysis.

The following are produced:

   1. a code book that describes the variables, data, and necessary transformations (CodeBook.md)
   2. an R script that performs all of the processing (run_analysis.R)
   3. a tidy dataset (tidy.txt)
   4. README.md (this file)

A link to a Github repository containing these components will be provided.

The raw data for the project comes from the Human Activity Recognition Using Smartphones Dataset (Version 1.0):

   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The publication reference is:

   Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
   Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

with contacts:

   Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
   Smartlab - Non Linear Complex Systems Laboratory
   DITEN - Università degli Studi di Genova.
   Via Opera Pia 11A, I-16145, Genoa, Italy.
   activityrecognition@smartlab.ws
   www.smartlab.ws

The authors' description of the work:

   "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
    Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a
    smartphone (Samsung Galaxy S II) on the waist.
    Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a
    constant rate of 50Hz.
    The experiments have been video-recorded to label the data manually.
    The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating
    the training data and 30% the test data.

    The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width
    sliding windows of 2.56 sec and 50% overlap (128 readings/window).
    The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter
    into body acceleration and gravity.
    The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.
    From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

A single R script (run_analysis.R):

   1. merges the training and test dataset features, as well as the subjects and activities for each
   2. extracts the mean- and standard deviation-related measurements
   3. employs descriptive activity names
   4. employs appropriately descriptive variable names
   5. creates an independent tidy dataset with the average of each variable for each activity and each subject

The R script should be located such that the "./UCI HAR Dataset/" reference is valid.
