# Introduction to data.table

# Set up environment ------------------------------------------------------

#Clear the workspace
rm(list=ls())

#Clear the console
cat("\014")

#Include necessary libraries
x = c('rstudioapi',
      'data.table')

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
# Get and manipulate data -------------------------------------------------
# Let's start right up with Theoph again.

Theoph

# Convert this data.frame into a data.table. 

theoph_dt = function_to_convert_to_data.table(Theoph)

# Okay, not too bad! Now we can start to use data.table syntax. Subset 
# theoph_dt by only selecting Subjects 1 through 6.

subset_attempt_here

# Okay, try again after setting a key. Set the key for theoph_dt to be 
# "Subject"

setkey_attempt_here

# This is great! Now try getting all Subjects 1 through 6 without using
# the Subject column name this time.

keyed_subset_attempt_here

# Now, let's try some functions. Calculate the sum of the Doses given out.

sum_function_attempt

# Awesome! Now, calculate the Dose sum again, but this time Subject. This
# isn't super meaningful, since the Dose was given once but is reported 
# down the column, but it helps us learn data.table.

grouped_sum_function_attempt

# Wonderful. See if you can order theoph_dt by Wt. Hint, it might be
# easier if you reset the key!

ordering_attempt

# This is moving along smoothly! Create a summarized table of rows per
# Subject.

rows_per_Subject_attempt

# Okay, let's wrap up by chaining some functions. See if you can subset 
# the data to only select Subject == 1, then calculate the mean `conc`.

mean_conc_Subject1_chain_attempt

# Great job! You're unlocking the power of data.table. This is a faster way
# to do a lot of what dplyr does, thought it is not as immediately readable.
# I highly recommend you keep working with this, as you can perform all 
# dplyr functions on data.tables, but you can't do all data.table stuff on 
# data.frames.



#