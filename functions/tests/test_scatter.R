source("functions/grapher.R")
library(testthat)

data_test <- data.frame(
    revenue = c(1,2,3),
    budget = c(5,6,7)
)

scatter_plot = plot_scatter_graph(data=data_test, 
                                  plot_width=10, plot_height=10, x_axis_data=revenue, 
                                  y_axis_data=budget, x_axis_label="Revenue", 
                                  y_axis_label="Budget", text_size=20)

testthat::expect_identical(scatter_plot$labels$y, "Budget")
testthat::expect_identical(scatter_plot$labels$x, "Revenue")
testthat::expect_error(print(scatter_plot), NA)


