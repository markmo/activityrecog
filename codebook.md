# Activity Recognition from Mobile Sensor Data Code Book

This project uses input data from the Human Activity Recognition Using Smartphones Data Set ('UCI HAR Dataset' from the UCI Machine Learning Repository). See a description of the input files below.

## Tidy Data Set

180 observations of 79 variables.

The tidy data set includes the average of selected variables for each subject and activity. The tidy data set uses mean and standard deviation measurements only.

The file contains the columns below.

The 'subject' and 'activity' columns are factors stored as characters.

    subject
        Identifies the subject who performed the activity. Valid range is from 1 to 30.
    activity
        Identifies the type of activity performed. Valid values are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
    
The remaining columns are the average of the measurements for the given subject and activity.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals t.acc.(x|y|z) and t.gyro.(x|y|z). These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (t.body.acc.(x|y|z) and t.gravity.acc.(x|y|z)) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (t.body.acc.jerk.(x|y|z) and t.body.gyro.jerk.(x|y|z)). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (t.body.acc.mag, t.gravity.acc.mag, t.body.acc.jerk.mag, t.body.gyro.mag, t.body.gyro.jerk.mag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing f.body.acc.(x|y|z), f.body.acc.jerk.(x|y|z), f.body.gyro.(x|y|z), f.body.acc.jerk.mag, f.body.gyro.mag, f.body.gyro.jerk.mag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern '.(x|y|z)' is used to denote 3-axial signals in the X, Y and Z directions.

The following columns are all numeric.

    avg.t.body.acc.mean.x
    avg.t.body.acc.mean.y
    avg.t.body.acc.mean.z
    avg.t.body.acc.std.x
    avg.t.body.acc.std.y
    avg.t.body.acc.std.z
    avg.t.gravity.acc.mean.x
    avg.t.gravity.acc.mean.y
    avg.t.gravity.acc.mean.z
    avg.t.gravity.acc.std.x
    avg.t.gravity.acc.std.y
    avg.t.gravity.acc.std.z
    avg.t.body.acc.jerk.mean.x
    avg.t.body.acc.jerk.mean.y
    avg.t.body.acc.jerk.mean.z
    avg.t.body.acc.jerk.std.x
    avg.t.body.acc.jerk.std.y
    avg.t.body.acc.jerk.std.z
    avg.t.body.gyro.mean.x
    avg.t.body.gyro.mean.y
    avg.t.body.gyro.mean.z
    avg.t.body.gyro.std.x
    avg.t.body.gyro.std.y
    avg.t.body.gyro.std.z
    avg.t.body.gyro.jerk.mean.x
    avg.t.body.gyro.jerk.mean.y
    avg.t.body.gyro.jerk.mean.z
    avg.t.body.gyro.jerk.std.x
    avg.t.body.gyro.jerk.std.y
    avg.t.body.gyro.jerk.std.z
    avg.t.body.acc.mag.mean
    avg.t.body.acc.mag.std
    avg.t.gravity.acc.mag.mean
    avg.t.gravity.acc.mag.std
    avg.t.body.acc.jerk.mag.mean
    avg.t.body.acc.jerk.mag.std
    avg.t.body.gyro.mag.mean
    avg.t.body.gyro.mag.std
    avg.t.body.gyro.jerk.mag.mean
    avg.t.body.gyro.jerk.mag.std
    avg.f.body.acc.mean.x
    avg.f.body.acc.mean.y
    avg.f.body.acc.mean.z
    avg.f.body.acc.std.x
    avg.f.body.acc.std.y
    avg.f.body.acc.std.z
    avg.f.body.acc.mean.freq.x
    avg.f.body.acc.mean.freq.y
    avg.f.body.acc.mean.freq.z
    avg.f.body.acc.jerk.mean.x
    avg.f.body.acc.jerk.mean.y
    avg.f.body.acc.jerk.mean.z
    avg.f.body.acc.jerk.std.x
    avg.f.body.acc.jerk.std.y
    avg.f.body.acc.jerk.std.z
    avg.f.body.acc.jerk.mean.freq.x
    avg.f.body.acc.jerk.mean.freq.y
    avg.f.body.acc.jerk.mean.freq.z
    avg.f.body.gyro.mean.x
    avg.f.body.gyro.mean.y
    avg.f.body.gyro.mean.z
    avg.f.body.gyro.std.x
    avg.f.body.gyro.std.y
    avg.f.body.gyro.std.z
    avg.f.body.gyro.mean.freq.x
    avg.f.body.gyro.mean.freq.y
    avg.f.body.gyro.mean.freq.z
    avg.f.body.acc.mag.mean
    avg.f.body.acc.mag.std
    avg.f.body.acc.mag.mean.freq
    avg.f.body.body.acc.jerk.mag.mean
    avg.f.body.body.acc.jerk.mag.std
    avg.f.body.body.acc.jerk.mag.mean.freq
    avg.f.body.body.gyro.mag.mean
    avg.f.body.body.gyro.mag.std
    avg.f.body.body.gyro.mag.mean.freq
    avg.f.body.body.gyro.jerk.mag.mean
    avg.f.body.body.gyro.jerk.mag.std
    avg.f.body.body.gyro.jerk.mag.mean.freq

## Transformations

Only features related to mean, standard deviation ("std"), and mean frequency ("meanFreq") are extracted from the input files after first merging the training and test data sets with their activity labels and subjects.

The format of this intermediate file is as follows.

10,299 observations of 79 variables (including mean, mean frequency, and standard deviation).

The 'subject' and 'activity' columns are factors.

    subject
        Identifies the subject who performed the activity. Valid range is from 1 to 30.
    activity
        Identifies the type of activity performed. Valid values are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

The following columns are all numeric and have the same definitions before being averaged as in the tidy data set.

    t.body.acc.mean.x
    t.body.acc.mean.y
    t.body.acc.mean.z
    t.body.acc.std.x
    t.body.acc.std.y
    t.body.acc.std.z
    t.gravity.acc.mean.x
    t.gravity.acc.mean.y
    t.gravity.acc.mean.z
    t.gravity.acc.std.x
    t.gravity.acc.std.y
    t.gravity.acc.std.z
    t.body.acc.jerk.mean.x
    t.body.acc.jerk.mean.y
    t.body.acc.jerk.mean.z
    t.body.acc.jerk.std.x
    t.body.acc.jerk.std.y
    t.body.acc.jerk.std.z
    t.body.gyro.mean.x
    t.body.gyro.mean.y
    t.body.gyro.mean.z
    t.body.gyro.std.x
    t.body.gyro.std.y
    t.body.gyro.std.z
    t.body.gyro.jerk.mean.x
    t.body.gyro.jerk.mean.y
    t.body.gyro.jerk.mean.z
    t.body.gyro.jerk.std.x
    t.body.gyro.jerk.std.y
    t.body.gyro.jerk.std.z
    t.body.acc.mag.mean
    t.body.acc.mag.std
    t.gravity.acc.mag.mean
    t.gravity.acc.mag.std
    t.body.acc.jerk.mag.mean
    t.body.acc.jerk.mag.std
    t.body.gyro.mag.mean
    t.body.gyro.mag.std
    t.body.gyro.jerk.mag.mean
    t.body.gyro.jerk.mag.std
    f.body.acc.mean.x
    f.body.acc.mean.y
    f.body.acc.mean.z
    f.body.acc.std.x
    f.body.acc.std.y
    f.body.acc.std.z
    f.body.acc.mean.freq.x
    f.body.acc.mean.freq.y
    f.body.acc.mean.freq.z
    f.body.acc.jerk.mean.x
    f.body.acc.jerk.mean.y
    f.body.acc.jerk.mean.z
    f.body.acc.jerk.std.x
    f.body.acc.jerk.std.y
    f.body.acc.jerk.std.z
    f.body.acc.jerk.mean.freq.x
    f.body.acc.jerk.mean.freq.y
    f.body.acc.jerk.mean.freq.z
    f.body.gyro.mean.x
    f.body.gyro.mean.y
    f.body.gyro.mean.z
    f.body.gyro.std.x
    f.body.gyro.std.y
    f.body.gyro.std.z
    f.body.gyro.mean.freq.x
    f.body.gyro.mean.freq.y
    f.body.gyro.mean.freq.z
    f.body.acc.mag.mean
    f.body.acc.mag.std
    f.body.acc.mag.mean.freq
    f.body.body.acc.jerk.mag.mean
    f.body.body.acc.jerk.mag.std
    f.body.body.acc.jerk.mag.mean.freq
    f.body.body.gyro.mag.mean
    f.body.body.gyro.mag.std
    f.body.body.gyro.mag.mean.freq
    f.body.body.gyro.jerk.mag.mean
    f.body.body.gyro.jerk.mag.std
    f.body.body.gyro.jerk.mag.mean.freq

The average of these measures is then aggregated by subject and activity by applying the R "mean" function.

(The "melt" and "dcast" functions from the Reshape2 R package has been used to aggregate the averages. Column names have been conformed to a standard using lowercase and dot notation.)

## Input Data Set

Version 1.0  
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Universit? degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The following files are used:

* UCI HAR Dataset/activity_labels.txt - Links the class labels with their activity name.
* UCI HAR Dataset/features.txt - List of all features.
* UCI HAR Dataset/train/X_train.txt - Training set.
* UCI HAR Dataset/train/y_train.txt - Training labels.
* UCI HAR Dataset/test/X_test.txt - Test set.
* UCI HAR Dataset/test/y_test.txt - Test labels.
* UCI HAR Dataset/train/subject_train.txt - Each row identifies the subject who performed the activity for each window sample in the training set. Its range is from 1 to 30.
* UCI HAR Dataset/test/subject_test.txt - Each row identifies the subject who performed the activity for each window sample in the test set. Its range is from 1 to 30.

Please note:
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.
