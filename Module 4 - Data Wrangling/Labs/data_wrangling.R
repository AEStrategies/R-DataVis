# Wrangling data

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
# First, let's get the data. We should be old pros at this by now. 
# We've saved it in a folder in this directory, as before. These data
# come from cases of COVID-19 as reported to Johns-Hopkins University, just
# like we worked with in the live code. In fact, let's use that as a 
# template. See if you can manipulate the data below in new ways.

data_wrangling_example = read_csv("./data_examples/data_wrangling_example.csv")

# Work your way through each step of the `dplyr` data wrangling scenarios
# we covered and try maniuplating the data according to your own ideas.

data_wrangling_example %>%
  # Rename columns for more informative/pertinent reference
  dplyr::rename(new_column_name = "old_column_name") %>% 
  
  # Reorganize the table to "long" version for merging later, using cases by day
  pivot_longer(columns_to_include_or_exclude, 
               names_to = "name_for_melted_variable_column", 
               values_to = "name_for_melted_value_column") %>%
  
  # Add a new column summarizing another column, whichever you choose
  mutate(new_column_name = some_permutation_or_calculation(existing_column_name)) %>% 
  
  # Filter the data so only some subet remains, according to logical
  # operators we learned yesterday!
  filter(column_for_filtering **some_logical_argument** "criteria") %>% 
  
  # Sort the data anyway you choose.
  arrange(column_to_arrange_by, optionally_more_columns_to_arrange_by) %>% 
  
  # Group the data in some new manner
  group_by(grouping_column) %>% 
  
  # Select only columns of interest
  dplyr::select(c(vector_of_target_columns))

  
#