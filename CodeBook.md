** CODEBOOK **

By Victor Ceron





*** PLEASE DOWNLOAD THIS FILE TO YOUR COMPUTER AS IT DOES NOT DISPLAY WELL IN GITHUB'S PREVIEW. USE NOTEPAD++ TO VIEW FILE ***





The information referred below was generated in R Studio version 1.0.143 using Windows 10 and R version 3.4.1. 





This codebook includes:

1. Work and transformation to clean up raw data

2. Description of variables and data





** Work and transformation to clean up raw data **

	The data was assembled as follows:

		a) First, the script run_analysis(), looks for the file "FUCI HAR Dataset.zip" in R's working directory. If the file is not found, it will try to download it from the internet. 

		b) It will unzip the zip file into a "Dataset" folder inside the working directory

		c) It will import the data included in the files "activity_labels.txt", "features.txt", "subject_train.txt", "subject_test.txt", "X_train.txt", "X_test.txt", "y_train.txt", "y_test.txt" in separate dataframes. One dataframe per file. 

		d) For the dataframe containing the data from "features.txt",

			1. The data in the 2nd column will be transposed and exported into a vector

			2. This vector will be used to partially fill the column names for a bigger dataset named clean_dataset that will contain all of the data from the files in step c)

		e) Using the dataframe containing the data from "X_train.txt",

			1. This dataframe will be copied into clean_dataset

		f) The vector from step d)1. is imported as column names of clean_dataset

		g) Using the dataframe containing the data from "X_test.txt",

			1. This dataframe is appended to clean_dataset via the row bind (rbind) command. 

		h) The dataframes containing the data from "y_train.txt", "y_test.txt" are merged via the row bind (rbind) command. Its column name is named "Activity".

		i) The dataframes containing the data from "subject_train.txt", "subject_test.txt" are merged via the row bind (rbind) command. Its column name is named "Subject".

		j) The dataframes from steps h) and i) are merged, in that order, with clean_dataset via the column bind (cbind) command.

		k) The "Activity" column, of class integer, is converted to a factor variable with 6 levels using the labels from the dataframe containing data from "activity_labels.txt". This completed the dataset clean_dataset

		l) Using the clean_dataset dataframe, two final dataframes will be created per the assignment: clean_dataset_mean_std_only and clean_dataset_mean_only

		m) To create clean_dataset_mean_std_only, 

			1. First the script identifies the columns in the clean_dataset dataframe for which their column names do not include "mean(" and "std(", without including the "Subject" and "Activity" columns. 

			2. The script filters out the identified columns from step m)1 and assigns this new dataframe to clean_dataset_mean_std_only as a global dataframe to prevent the dataframe from being destroyed after the function is completed. 

			3. The column names are renamed to better describe the variable names. 

		n) To create clean_dataset_mean_only,

			1. Using the recently created clean_dataset_mean_std_only, the script identifies the columns in the clean_dataset_mean_std_only dataframe for which their column names do not include "Mean", without including the "Subject" and "Activity" columns. 

			2. The script filters out the identified columns from step n)1 and assigns this new dataframe to clean_dataset_mean_only as a global dataframe to prevent the dataframe from being destroyed after the function is completed. 

			3. The column names were already renamed to better describe the variable names in step m)3.

		o) Both the clean_dataset_mean_std_only  and clean_dataset_mean_only dataframes as exported to TXT files using their dataframe names. 

		p) The final result is two dataframes and two TXT files:

			1. The clean_dataset_mean_std_only dataframe and the clean_dataset_mean_std_only.TXT file include the measurements on the mean and standard deviation for each measurement. 

			2. The clean_dataset_mean_only dataframe and the clean_dataset_mean_only.TXT file include the measurements on only the mean  for each measurement. 

			

Note 1: The Inertial signal files were not imported as they did not contain useful data for this exercise.

Note 2: The angle data was discarded as they were not truly mean data. They refer to mean data but they were not mean angles themselves.  		

		

	



** Description of variables and data **


The description of variables and data below apply to the clean_dataset_mean_std_only dataframe and the clean_dataset_mean_std_only.TXT file, as every variable is present in these datasets.
For the the clean_dataset_mean_only dataframe and the clean_dataset_mean_only.TXT file, the variables containing "StDev" do not apply as these variables were discarded.  






	Variable Name																	Subject
	Variable Description															The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. The subject variable labels each and every volunteer with an integer number from 1 to 30
	Variable Class in R																Integer
	Units																			None (Adimensional)
	Variable Range																	[1, 30]






Variable Name																	Activity
Variable Description															Each volunteer performed six activities. The Activity variable captures these 6 activities in a factor variable with 6 levels; each level is labeled per the activity performed.
Variable Class in R																Factor
Units																			None (Adimensional)
Variable Range																	Six levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING






Variable Name																	TimeBodyAccMeanX
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	TimeBodyAccMeanY
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	TimeBodyAccMeanZ
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	TimeBodyAccStDevX
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	TimeBodyAccStDevY
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	TimeBodyAccStDevZ
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	TimeGravityAccMeanX
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										GRAVITATIONAL
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	TimeGravityAccMeanY
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										GRAVITATIONAL
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	TimeGravityAccMeanZ
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										GRAVITATIONAL
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	TimeGravityAccStDevX
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										GRAVITATIONAL
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	TimeGravityAccStDevY
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										GRAVITATIONAL
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	TimeGravityAccStDevZ
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										GRAVITATIONAL
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	TimeBodyAccJerkMeanX
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	TimeBodyAccJerkMeanY
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	TimeBodyAccJerkMeanZ
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	TimeBodyAccJerkStDevX
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	TimeBodyAccJerkStDevY
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	TimeBodyAccJerkStDevZ
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	TimeBodyGyroMeanX
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	TimeBodyGyroMeanY
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	TimeBodyGyroMeanZ
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	TimeBodyGyroStDevX
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	TimeBodyGyroStDevY
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	TimeBodyGyroStDevZ
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	TimeBodyGyroJerkMeanX
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					YES
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	TimeBodyGyroJerkMeanY
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					YES
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	TimeBodyGyroJerkMeanZ
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					YES
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	TimeBodyGyroJerkStDevX
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					YES
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	TimeBodyGyroJerkStDevY
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					YES
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	TimeBodyGyroJerkStDevZ
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					YES
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	TimeBodyAccMagMean
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	TimeBodyAccMagStDev
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	TimeGravityAccMagMean
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										GRAVITATIONAL
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	TimeGravityAccMagStDev
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										GRAVITATIONAL
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	TimeBodyAccJerkMagMean
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	TimeBodyAccJerkMagStDev
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	TimeBodyGyroMagMean
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	TimeBodyGyroMagStDev
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	TimeBodyGyroJerkMagMean
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					YES
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	TimeBodyGyroJerkMagStDev
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														TIME
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					YES
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	FrequencyBodyAccMeanX
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	FrequencyBodyAccMeanY
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	FrequencyBodyAccMeanZ
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	FrequencyBodyAccStDevX
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	FrequencyBodyAccStDevY
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	FrequencyBodyAccStDevZ
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	FrequencyBodyAccJerkMeanX
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	FrequencyBodyAccJerkMeanY
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	FrequencyBodyAccJerkMeanZ
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	FrequencyBodyAccJerkStDevX
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	FrequencyBodyAccJerkStDevY
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	FrequencyBodyAccJerkStDevZ
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	FrequencyBodyGyroMeanX
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	FrequencyBodyGyroMeanY
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	FrequencyBodyGyroMeanZ
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	FrequencyBodyGyroStDevX
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										NO
Axis																			X




Variable Name																	FrequencyBodyGyroStDevY
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										NO
Axis																			Y




Variable Name																	FrequencyBodyGyroStDevZ
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										NO
Axis																			Z




Variable Name																	FrequencyBodyAccMagMean
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	FrequencyBodyAccMagStDev
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		NO
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	FrequencyBodyAccJerkMagMean
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	FrequencyBodyAccJerkMagStDev
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								ACCELEROMETER
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		YES
For Gyroscope  signal only - Angular velocity derived (Jerk)					<NA>
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	FrequencyBodyGyroMagMean
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	FrequencyBodyGyroMagStDev
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					NO
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	FrequencyBodyGyroJerkMagMean
Variable Description															Normalized AVERAGE data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					YES
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>




Variable Name																	FrequencyBodyGyroJerkMagStDev
Variable Description															Normalized STANDARD DEVIATION data coming from the sensor and motion component indicated in the fields <Sensor signal origin (Accelerometer or Gyroscope)> and <Motion component (Gravitational or Body)>; the signal domain is indicated in the field <Domain (Time or Frequency)>. This signal may have been derived to obtain its Jerk; if the signal was derived, it will be indicated in the field <For Accelerometer signal only - Body linear acceleration derived (Jerk)?	> and <For Gyroscope  signal only - Angular velocity derived (Jerk)> (depending on the sensor the data came from). The axis for the signal is indicated in <Axis>. Note: <NA> values mean NOT APPLICABLE
Variable Class in R																Numeric
Units																			None (Adimensional)
Variable Range																	[-1,1]
Domain (Time or Frequency)														FREQUENCY
Sensor signal origin (Accelerometer or Gyroscope)								GYROSCOPE
Motion component (Gravitational or Body)										BODY
For Accelerometer signal only - Body linear acceleration derived (Jerk)?		<NA>
For Gyroscope  signal only - Angular velocity derived (Jerk)					YES
Magnitude using Euclidean norm calculated?										YES
Axis																			<NA>






















































