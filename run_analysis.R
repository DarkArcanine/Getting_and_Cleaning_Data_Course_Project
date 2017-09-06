run_analysis <- function() 
{
  ## if  local file of zip file does not exist in directory, it downloads file from the internet and stores as file "FUCI HAR Dataset.zip" in <R's workdirectory>
  localfile="FUCI HAR Dataset.zip"
  
  if (!file.exists(localfile))
  {
    print(paste("No local copy of ", localfile, "found in working directory. I will try to download file from the web, please wait"))
  	DatasetURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  	download.file(DatasetURL,destfile = localfile,mode = "wb")
  }

  ## unzips file into <R's workdirectory>\Dataset
  outDir<-"Dataset"  
  print(paste("Unzipping ", localfile, "in", outDir, "folder inside working directory"))
  outDir<-paste(".\\",outDir, sep="")
	unzip(localfile,exdir = outDir)

	
	## imports raw data from unzipped files into dataframes
	features_FILE<-c(outDir,"\\UCI HAR Dataset\\features.txt")
	features_FILE<-paste(outDir,"\\UCI HAR Dataset\\features.txt")
	activity_labels_FILE<-paste(outDir,"\\UCI HAR Dataset\\activity_labels.txt")
	features_FILE<-paste(outDir,"\\UCI HAR Dataset\\features.txt",sep="")
	activity_labels_FILE<-paste(outDir,"\\UCI HAR Dataset\\activity_labels.txt",sep="")
	x_test_FILE<-paste(outDir,"\\UCI HAR Dataset\\test\\X_test.txt",sep="")
	y_test_FILE<-paste(outDir,"\\UCI HAR Dataset\\test\\y_test.txt",sep="")
	subject_test_FILE<-paste(outDir,"\\UCI HAR Dataset\\test\\subject_test.txt",sep="")
	x_train_FILE<-paste(outDir,"\\UCI HAR Dataset\\train\\X_train.txt",sep="")
	x_train_FILE<-paste(outDir,"\\UCI HAR Dataset\\train\\X_train.txt",sep="")
	y_train_FILE<-paste(outDir,"\\UCI HAR Dataset\\train\\y_train.txt",sep="")
	subject_train_FILE<-paste(outDir,"\\UCI HAR Dataset\\train\\subject_train.txt",sep="")
	features_raw<-read.table(features_FILE)
	activity_labels_raw<-read.table(activity_labels_FILE)
	x_test_raw<-read.table(x_test_FILE)
	y_test_raw<-read.table(y_test_FILE)
	subject_test_raw<-read.table(subject_test_FILE)
	x_train_raw<-read.table(x_train_FILE)
	y_train_raw<-read.table(y_train_FILE)
	subject_train_raw<-read.table(subject_train_FILE)


	## imports x_train data to clean_dataset	
	## imports and transposes features data frame to name columns for dataset
	## adds x_test data to clean_dataset
		features_clean<-t(as.data.frame(features_raw[,2]))
	features_clean<-as.vector(features_clean)
	clean_dataset<-x_train_raw
	colnames(clean_dataset)<-features_clean
	colnames(x_test_raw)<-features_clean
	clean_dataset<-rbind(clean_dataset,x_test_raw)

	
	## merges y_train and y_test data and names this data "Activity"
	## then adds "Activity" data to the left of clean_dataset
	y_clean<-rbind(y_train_raw,y_test_raw)
	clean_dataset<-cbind(y_clean,clean_dataset)
	colnames(clean_dataset)[1]<-"Activity"

	
	## merges subject_train and subject_test data and names this data "Subject"
	## then adds "Subject" data to the left of clean_dataset
	subject_clean<-rbind(subject_train_raw,subject_test_raw)
	clean_dataset<-cbind(subject_clean,clean_dataset)
	colnames(clean_dataset)[1]<-"Subject"
	
	
	#transforms "Activity" column to factor using levels from activity_labels data
	levels<-as.vector(t(as.data.frame(activity_labels_raw[,1])))
	labels<-as.vector(t(as.data.frame(activity_labels_raw[,2])))
	clean_dataset$Activity<-factor(clean_dataset$Activity,levels=levels,labels=labels)
	
	
	##identifies column names that do not contain "mean(" nor "std(" (these columns will be dropped from clean_dataset)...
	dropcolumns<-which(!grepl("mean\\(|std\\(",colnames(clean_dataset)))
	
	
	##...exluding columns for "Subject" and "Activity"
	dropcolumns<-dropcolumns[-c(1,2)]
	
	##new dataset, named, clean_dataset_mean_std_only includes only data for mean and std dev
	clean_dataset_mean_std_only<-clean_dataset[, -dropcolumns]
	
	##manipulates column names to make them more descriptive
	colnames(clean_dataset_mean_std_only)<-sub("BodyBody","Body",names(clean_dataset_mean_std_only))
	colnames(clean_dataset_mean_std_only)<-sub("^t","Time",names(clean_dataset_mean_std_only))
	colnames(clean_dataset_mean_std_only)<-sub("^f","Frequency",names(clean_dataset_mean_std_only))
	colnames(clean_dataset_mean_std_only)<-sub("mean","Mean",names(clean_dataset_mean_std_only))
	colnames(clean_dataset_mean_std_only)<-sub("std","StDev",names(clean_dataset_mean_std_only))
	colnames(clean_dataset_mean_std_only)<-sub("-","",names(clean_dataset_mean_std_only))
	colnames(clean_dataset_mean_std_only)<-sub("\\(\\)","",names(clean_dataset_mean_std_only))
	colnames(clean_dataset_mean_std_only)<-sub("-","",names(clean_dataset_mean_std_only))

	
		## ** clean_dataset_mean_std_only ** is the first tidy dataset asked by assignment. It is stored as a global variable usable outside this function.	
	clean_dataset_mean_std_only<<-clean_dataset_mean_std_only

	
	
	## identifies column names that do not contain "Mean"  (these columns will be dropped from clean_dataset)...
	dropcolumns2<-which(!grepl("Mean",colnames(clean_dataset_mean_std_only)))
	
	##...exluding columns for "Subject" and "Activity"
	dropcolumns2<-dropcolumns2[-c(1,2)]
	

		##new dataset, named, clean_dataset_mean_only includes only data for mean 	
	clean_dataset_mean_only<-clean_dataset_mean_std_only[, -dropcolumns2]
	
	
	## ** clean_dataset_mean_only ** is the first tidy dataset asked by assignment. It is stored as a global variable usable outside this function.
	clean_dataset_mean_only<<-clean_dataset_mean_only	
  print("Data frame clean_dataset_mean_std_only and clean_dataset_mean_only created")
		
	## both datasets are saved in csv files
	output_file_1<-"clean_dataset_mean_std_only.csv"
	output_file_2<-"clean_dataset_mean_only.csv"
	
	print(paste("Creating CSV files, ",output_file_1," and ", output_file_1," in working directory. These files contain the clean_dataset_mean_std_only and clean_dataset_mean_only dataframes...",sep=""))
	if (!file.exists(output_file_1))
	{
    write.csv(clean_dataset_mean_std_only, file = output_file_1,row.names=FALSE)
	  print(paste("File ",output_file_1, " created in working directory", sep=""))
	}
	else
	{
	  print(paste("ERROR: File ",output_file_1, " already exists, please delete local file and run run_analysis() again", sep=""))
	}
	if (!file.exists(output_file_2))
	{	
	  write.csv(clean_dataset_mean_only, file = output_file_2,row.names=FALSE)
	  print(paste("File ",output_file_2, " created in working directory", sep=""))
	}
	else
	{
	  print(paste("ERROR: File ",output_file_2, " already exists, please delete local file and run run_analysis() again", sep=""))
	}
	
}
 