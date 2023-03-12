library(ggplot2)

source("R/EDA.R")

#' Scatter plot function
#'
#' This function plots a scatter graph given the data and the column names to 
#' visualize and also allows to edit the graphs axis labels and plot dimensions
#'
#' @param data The data which should be visualized passed as a dataframe
#' @param plot_width The width of the plot passed as a numeric value
#' @param plot_height The height of the plot passed as a numeric value
#' @param x_axis_data The column name of the passed data which should be displayed on the x axis passed as a dataframe which is the name of the column
#' @param y_axis_data The column name of the passed data which should be displayed on the y axis passed as a dataframe which is the name of the column
#' @param x_axis_label Label which will be displayed in the plot for the x axis passed as a string
#' @param y_axis_label Label which will be displayed in the plot for the y axis passed as a string
#' @param text_size Text size applied for all text in the plot passed as a numeric value
#'
#' @return The generated plot with the applied parameters


plot_scatter_graph <- function(data, plot_width, plot_height, x_axis_data, 
                               y_axis_data, x_axis_label, y_axis_label, title_label,
                               text_size) {
    
    
    options(repr.plot.width=plot_width, repr.plot.height=plot_height)
    
    return(ggplot(data, aes(x = {{x_axis_data}}, y = {{y_axis_data}})) + 
               geom_point() +
               labs(x = x_axis_label, y = y_axis_label, title = title_label ) +
               theme(text = element_text(size=text_size)))
}