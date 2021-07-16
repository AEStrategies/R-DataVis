# Importing new data of various types

# Set up environment ------------------------------------------------------

#Clear the workspace
rm(list=ls())

#Clear the console
cat("\014")

#Include necessary libraries
x = c('rstudioapi',
      'tidyverse')

# # If you don't know if you've installed the packages for some of these
# # libraries, run this:
# install.packages(x)

lapply(x, library, character.only=TRUE)
rm(x)

#Set working directory (should be universal)
setwd(
  dirname(
    rstudioapi::callFun(
      'getActiveDocumentContext'
    )$path
  )
)


#
# Locate and import data --------------------------------------------------

# Navigate to the folder in the Labs that contains the examples of data
# types to import ("data_import_examples"). Inside are several different 
# data types we're going to practice reading in. See how you do!

# First, let's start with .csv. This is one of the most common data file
# types we work with in R. See if you can replace the pseudo-code below
# with the proper data file reading function. And you have to change
# the file name, too!

csv_data = CSV_DATA_READER_FUNCTION("Name_of_file.don't_forget_proper_extension")

# The issue here is  that your working directory is in "Labs", but the 
# data are in a sub-folder in this directory. You have to specify the
# path to that sub-folder to get the data to read in. 

# Let's try another super common data file type: text files.

txt_data = TXT_DATA_READER_FUNCTION("Name_of_file.don't_forget_proper_extension")

# With the things you learned bring in the .csv file, the .txt file was 
# probably a breeze. let's try two more files, each with slightly more
# complicated processes to read in. Only slightly.

excel_data = EXCEL_DATA_READER_FUNCTION("Name_of_file.don't_forget_proper_extension")

sas_data = SAS_DATA_READER_FUNCTION("Name_of_file.don't_forget_proper_extension")

# The tricky part here is that Excel and SAS data both require non-base-R
# libraries to access the packages necessary to read in the data. Excel
# needs `xlsx` and SAS needs `haven`. Once you have those, it's a cinch.

# Now that you've read in all of those data file types, see if you can 
# crack them open a little bit. Try the `str` command on each, and see
# what types of objects they are in R.

str(EACH_DATASET_HERE_BY_OBJECT_NAME)

# Great! Now that we can read in different kinds of data file types 
# we're ready to manipulate the data. Not in a bad way, in a helpful way.