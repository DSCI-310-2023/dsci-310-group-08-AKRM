library(ggplot2)


source("R/EDA.R")


plot_scatter_graph <- function(data, plot_width, plot_height, x_axis_data, 
                               y_axis_data, x_axis_label, y_axis_label, title_label,
                               text_size) {
    
    
    options(repr.plot.width=plot_width, repr.plot.height=plot_height)
    
    return(ggplot(data, aes(x = {{x_axis_data}}, y = {{y_axis_data}})) + 
               geom_point() +
               labs(x = x_axis_label, y = y_axis_label, title = title_label ) +
               theme(text = element_text(size=text_size)))
}