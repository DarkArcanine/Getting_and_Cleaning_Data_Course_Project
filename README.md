	*** PLEASE DOWNLOAD THIS FILE TO YOUR COMPUTER AS IT DOES NOT DISPLAY WELL IN GITHUB'S PREVIEW. USE NOTEPAD++ TO VIEW FILE ***

	This README file explains the files included in this repo:
	CodeBook.md 				- This file describes the variable, the data, and every transformation performed to clean up the data. 

	FUCI HAR Dataset.zip 			- This zip file includes all of the raw data used to generate the TXT files (tidy data) that were generated by the script included in run_analysis.R.

	run_analysis.R 				- This R script file takes the FUCI HAR Dataset.zip, unzips it and processes it to generate the TXT files and dataframes inside R with the tidy data. Note: if the FUCI HAR Dataset.zip is not found in the working directory, the script will try to download a copy from the internet.

	clean_dataset_mean_std_only.TXT 	- This is the tidy data output from the R script. This tidy data includes the measurements on the mean and standard deviation for each of the measurements in the files compressed in the zip file. A dataframe with the same name is also generated within R that contains the same information as this file. If running the script, do not copy this file in R's working directory; R will generate a new local copy. 

	clean_dataset_mean_only.TXT 		- This is the tidy data output from the R script. This tidy data includes the measurements only on the mean  for each of the measurements in the files compressed in the zip file. A dataframe with the same name is also generated within R that contains the same information as this file. If running the script, do not copy this file in R's working directory; R will generate a new local copy. 


	Below you can find an explanation of the inner workings of the R script file (this information is also included in the file CodeBook.md: 

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
