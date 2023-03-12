library(ggplot2)


source("functions/EDA.R")


plot_scatter_graph <- function(data, plot_width, plot_height, x_axis_data, 
                               y_axis_data, x_axis_label, y_axis_label,
                               text_size) {
    
    
    options(repr.plot.width=plot_width, repr.plot.height=plot_height)
    
    return(ggplot(data, aes(x = {{x_axis_data}}, y = {{y_axis_data}})) + 
               geom_point() +
               labs(x = x_axis_label, y = y_axis_label) +
               theme(text = element_text(size=text_size)))
}

scatter <- plot_scatter_graph(data=y, 
                              plot_width=10, plot_height=10, x_axis_data=budget, 
                              y_axis_data=revenue, x_axis_label="Budget", 
                              y_axis_label="Revenue", text_size=20)

