library(GGally)
library(ggplot2)

correlation_plot <- function(data, title){
    ggpairs(data)+
        ggtitle(title)+
        theme(text = element_text(size = 5), plot.title = element_text(size = 15, hjust = 0.5))
}

