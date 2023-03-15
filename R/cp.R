library(GGally)
library(ggplot2)

#' Correlation Plot Function
#'
#' This function gives a correlation plot by running ggpairs when a dataframe (data) is passed and a title for it
#'
#' @param data The dataframe that contains the dataset which needs to be plotted by ggpairs
#'
#' @param title The title that the correlation plot should contain passed as a string to the function
#' 
#' @return Returns the generated plot
#' 
correlation_plot <- function(data, title){
    ggpairs(data)+
        ggtitle(title)+
        theme(text = element_text(size = 5), plot.title = element_text(size = 15, hjust = 0.5))
}

