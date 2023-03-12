# Test for the grapher fuction
source("R/grapher.R")
library(testthat)

# Creating a dataframe for testing the grapher function
data_test <- data.frame(
    revenue = c(1,2,3),
    budget = c(5,6,7)
)

# Running the plot_scatter_graph function from grapher to test the outputs
scatter_plot = plot_scatter_graph(data=data_test, 
                                  plot_width=10, plot_height=10, x_axis_data=revenue, 
                                  y_axis_data=budget, x_axis_label="Revenue", 
                                  y_axis_label="Budget", title_label = "Plot", text_size=20)

# Tests for grapher with the expected outputs
testthat::expect_identical(scatter_plot$labels$y, "Budget")
testthat::expect_identical(scatter_plot$labels$x, "Revenue")
testthat::expect_identical(scatter_plot$labels$title, "Plot")
testthat::expect_error(print(scatter_plot), NA) 

