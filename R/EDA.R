library(dplyr)

read_dataset <- function(path, dest){
    download.file(path, destfile = dest)
    dataset <- read.csv(dest)
    return(dataset)
}

EDA <- function(data, select_cols, ...) {
    library(dplyr)
    
    data <- select(data, all_of(select_cols))
    
    data <- filter(data, ...)
    
    return(data)
}




