# Test for Correlation Plot
source("R/correlation_plot.R")
library(testthat)

# Creating a dataframe for testing the function
data_test <- data.frame(
    revenue = c(1,2,3),
    budget = c(5,6,7)
)

# Running correlation_plot function for testing
correlation_plot = correlation_plot(data_test, "correlation")

# Test for expected outputs to check correlation_plot
testthat::expect_identical(correlation_plot$title, "correlation")
