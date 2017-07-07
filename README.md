
# Getting-and-Cleaning-Data-Course-Project
This is a project is to demonstrate my ability to collect, work with, and clean a data set. A tidy data set has been prepared from an original dataset that was poorly documented, with a somewhat confusing structure of the data across multiple files. The stated goal is "to prepare tidy data that can be used for later analysis." 
Project objectives:
Submit the following to a Github repository: 
	1. a tidy data set as described below, 
	2. a link to a Github repository with your script for performing the analysis, and 
	3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
	4. This README.md explaining how all of the scripts work and how they are connected.

R-script: run_analysis.R
		
		a. Read test subject activity and id files
		b. Transpose a data frame of 561 feature row descriptors to 561 column descriptors 
		c. Poplute data frame with data values
		d. Strip out only the mean and standard deviation feature data
		e. Merge activity and subject id data with feature data
		f. Exchange activity id for descriptive term, e.g 2 for "Walking Upstairs"
		g. Repeat a-f for the training subject data
		h. Merge the tidy Test and Training datasets
		i. Sort the tidy merged dataset and take the average of each feature for each "activity" and "subject"
		j. Write out the datasets from steps h. and j.
			--tidydat_mrgbyactivity.txt
			--tidydat_mrgbyactmean.txt
