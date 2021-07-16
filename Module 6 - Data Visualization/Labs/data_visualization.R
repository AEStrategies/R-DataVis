# Visualizing data

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
# Alright, enough practice getting data. You all have that down. Let's just
# work with Theoph directly.

Theoph

# See if you can plot a line plot of concentration over time. We'll give
# you the skeleton of ggplot syntax for you to flesh out.

ggplot(your_data_here,
       set_your_aesthetics_next) +
  function_for_point_geometry()

# How was that? Hopefully you feel like you can get the hang of this. 
# Let's try some more. See if you can do a histogram all on your own.

historgram_plot_code

# Okay, let's add some layers. Change the theme to something else. You
# may need to search for options, or ask the instructors for help :).

ggplot(your_data_here,
       set_your_aesthetics_next) +
  function_for_point_geometry() +
  function_to_set_theme()

# This is great! If you're already done, play around however you wish.
# ggplot is one of the best parts of R, and can make some really
# beautiful and powerful graphics and visuals. This is a great skill
# to master.


#