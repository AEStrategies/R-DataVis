# Cleaning new data

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
# First, let's get the data. This should be easy after the last module. 
# We've saved it in a folder in this directory, as before. These data
# come from cases of Tuberculosis reported to the WHO, and are used
# in the `tidyr` tutorial by Hadley Wickham. 

messy_data = read.csv("./example_data/who_tuberculosis_data.csv")

# Now, let's see what it looks like, and how we can clean it up a bit.

str(messy_data)

# Okay. `country`, `iso2`, and `iso3` all specify the country of origin
# in different formats. `year` is self-evident. Every other column has a
# common structure: "new", a two- or three-letter code of some sort, and
# some unique identifier of something or other. Let's clean these up 
# using `tidyr`, as mentioned above, which is from the `tidyverse`.

# First, we want to condense all of the columns that clearly represent
# values, not variables. That's everything but `country`, `iso2`, `iso3`, 
# and `year`. They appear to contain counts of cases of tuberculosis, 
# everything from "new_sp_m014" to "newrel_f65". Don't worry about these
# functions and the syntax, we'll get in to `dplyr` later. For now,
# just focus on what and why we're doing what we are.

messy_data = messy_data %>%
  pivot_longer(cols = new_sp_m014:newrel_f65,
               names_to = "key",
               values_to = "cases",
               values_drop_na = TRUE)

messy_data

# Cool! Now, try changing "key" and "cases" to other names, something
# you think is more informative to useful, like "strain" and 
# "incident_cases", or something similar. Take a look at the data 
# and see what changed! Change things back to "key" and "cases" when
# you're done for consistency throughout the rest of the lab.

# We need to rename some of the "keys" so they make more sense. They all 
# have the same structure except the ones that start with "newrel", 
# there's no underscore after the "new" here. We can add it!

messy_data = 
  messy_data %>%
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))

# Now we can split the key by character ("_").

messy_data = 
  messy_data %>%
  separate(key, c("case_status", "case_type", "sex_agegroup"), sep = "_")

# Alright, I had a bit of advanced warning about these data. The first
# three letters of the key told us if the cases were new or old. There
# are only new cases in this data. Next, the middle characters told us if
# the case was diagnosed by a smear (smear positive, "sp") or not (smear
# negative, "sn"), if it was extrapulmonary ("ep"), or a relapse ("rel"). 
# Finally, we're told the patient's reported sex and what age-group they
# fall into. Since "case_status" is all "new", we can drop it. 

messy_data %>% count(case_status)

# We might as well drop the redundant country identifiers, too.

messy_data %>%
  select(-c(case_status, iso2, iso3))

# And, why not split sex and age-group, since we know what those are.
# Let's see if you can get this one youself. The hint is that you
# have to separate (like the function we used for "key" above) after
# the first (1) character.

messy_data %>%
  separate(FILL_IN_THE_ARGUMENTS_HERE)

# This is great. Really nice job! We're making excellent progress.


#