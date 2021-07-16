# Fun and games with the Twelvetide

# The Twelve Days of Christmas, also known as Twelvetide. In some Western ecclesiastical traditions, "Christmas Day" is
# considered the "First Day of Christmas" and the Twelve Days are 25 December to 5 January, inclusive.

# In some traditions, 6 January is a "thirteenth day".

# In this R script we're going to learn how to create vectors and a data frame and perform several vector operations and
# data frame filtering.  We'll then go back and add a gift for the thirteenth day and examine the changes as we re-run
# the code.  Note that this is an R script, rather than an R notebook.  R scripts have .R as the file extension whereas
# R notebooks have .Rmd as the file extension.  R scripts do not have code chunks and do no use rmarkdown.

# first, lets tidy up our global environment
rm(list=ls())

# combine gifts into a vector
gift <- c(
  "partridge in a pear tree",
  "turtle dove",
  "french hen",
  "calling bird",
  "gold ring",
  "goose a-laying",
  "swan a-swimming",
  "maid a-milking",
  "lady dancing",
  "lord a-leaping",
  "piper piping",
  "drummer drumming"
)

# organize vectors into a data frame, and think about how to organize the vectors so that we know the day that a kind of
# gift is given and the amount of that gift given per day, then examine the data frame in the environment pane
df <- data.frame(
  gift=gift,
  gift_per_day=1:length(gift),
  days_gift_given=rev(1:length(gift))
)

# compute the number of gifts given on each day, double-click df in the environment pane to examine the data frame
df$amount <- df$gift_per_day * df$days_gift_given

# compute how many gifts were given total
total_gifts <- sum(df$amount)

# what is the average number of gifts per day
average_gifts_per_day <- mean(df$amount)

# what is the standard deviation of gifts from day to day
standard_deviation_of_gifts_per_day <- sd(df$amount)

# determine the gift with the highest and lowest amounts given
largest_number_of_gifts_of_a_kind <- max(df$amount)
most_common_gifts <- df$gift[which(max(df$amount)==df$amount)]

smallest_number_of_gifts_of_a_kind <- min(df$amount)
least_common_gifts <- df$gift[which(min(df$amount)==df$amount)]

# gift indices for the least and most common gifts
which(df$amount %in% c(min(df$amount), max(df$amount)))

# in a single statement, list the least and most common gifts
df$gift[which(df$amount %in% c(min(df$amount), max(df$amount)))]

# plot the gift and the amount given
library(ggplot2)

# a quick plot using qplot
?qplot
qplot(amount, gift, data=df)

# the same plot, but using ggplot and being more explicit
ggplot(df, aes(amount, gift)) + geom_point()

# the same, but using a bar chart
ggplot(df, aes(amount, gift)) + geom_col()
# Try swapping gift and amount in the aes() function and re-running the line. What happened?

# Add a gift of your choice for the 13th day and re-run all the code.  Note the differences in the calculations and in
# the graphs.

