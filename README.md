# Activity Recognition from Mobile Sensor Data

## Script to create a tidy data set

The run_analysis.R script transforms the 'UCI HAR Dataset' into a tidy data set with the average of selected variables for each subject and activity. The tidy data set uses mean and standard deviation measurements only. The data set is output to a space-separated text file.

Please note that I have interpreted mean frequency ("meanFreq") as included in the set of mean measurements.

### Usage

The script is dependent on the Reshape2 package. You may need to first install this package:

    > install.packages("reshape2")
    
It is expected that the input data set is in the following directory structure under the root of the project directory.

    UCI HAR Dataset/
      activity_labels.txt
      features.txt
      features_info.txt
      test/
        subject_text.txt
        X_test.txt
        y_test.txt
      train/
        subject_train.txt
        X_train.txt
        y_train.txt

The script runs automatically when loaded:

    > source("run_analysis.R")

The script will read the input files, merge the training and test data sets, extract only the mean and standard deviation measurements, tidy column names into a consistent format, aggregate the average by subject and activity for each extracted feature, and write the output to a file.

The ouput data file "average_measures_by_subject_and_activity.txt" is created in the root of the project directory.

### Naming convention

Column names are in lowercase dot notation.

### Metadata

See the [Code Book](./codebook.md) for more information about the data.
