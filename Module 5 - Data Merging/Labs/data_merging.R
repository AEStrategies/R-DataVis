# Merging data

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
# Get and manipulate data -------------------------------------------------
# Again, let's get the data. Easy-peasy! 

data_merging_example1 = read_csv("./data_examples/data_merging_example1.csv")
data_merging_example2 = read_csv("./data_examples/data_merging_example2.csv")

# These data come from the Theophylline dataset
data_merging_example1
data_merging_example2

# Let's practice a left-join. That's where we join the right-data (the second, 
# or y, data) to the left-data (the first, or x, data), keeping all 
# matches in the left-data.

# Left-join: join matching values from y, to x.
left_join_df = left_join(x = SET_LEFT_DATASET,
                         y = SET_RIGHT_DATASET)

# Now, look at it's structure. That's the `str()` function.

LOOK_AT_STRUCTURE

# Great! Okay, let's step through the other types of joins, like
# with the right-join.

# Right-join: join matching values from x, to y.
right_join_df = right_join(x = SET_LEFT_DATASET,
                           y = SET_RIGHT_DATASET)

# Let's look at it's structure again.

LOOK_AT_STRUCTURE

# Excellent! Keep going with inner-join!

# Inner-join: only retain rows with matches from x and y.
inner_join_df = inner_join(x = SET_LEFT_DATASET,
                           y = SET_RIGHT_DATASET)

# And look at it's structure again:

LOOK_AT_STRUCTURE

# Okay, almost home. The full-join is that last one

# Full-join: retain all rows from x and y.
full_join_df = full_join(x = SET_LEFT_DATASET,
                         y = SET_RIGHT_DATASET)

# One more look at the structure again.

LOOK_AT_STRUCTURE

# Very nice!
  
#