source("R/correlation_plot .R")
library(testthat)

data_test <- data.frame(
    revenue = c(1,2,3),
    budget = c(5,6,7)
)

correlation_plot = correlation_plot(data_test, "correlation")

testthat::expect_identical(correlation_plot$title, "correlation")
