library(dplyr)

#' Read Dataset Function
#'
#' This function reads the dataset when a path is entered for the dataset and saves it at the destination entered
#'
#' @param path The path where the dataset is which needs to be stored in the given path
#'
#' @param dest The destination where the entered path for the dataset needs to be saved
#' 
#' @return Returns the dataset as a datframe
#' 

read_dataset <- function(path, dest){
    download.file(path, destfile = dest)
    dataset <- read.csv(dest)
    return(dataset)
}

#' Exploratory Data Analysis Function
#'
#' This function reads the dataset when a path is entered for the dataset and saves it at the destination entered
#'
#' @param path The path where the dataset is which needs to be stored in the given path
#'
#' @param dest The destination where the entered path for the dataset needs to be saved
#' 
#' @return Returns the dataset as a datframe
#' 

EDA <- function(data, select_cols, ...) {
    library(dplyr)
    
    data <- select(data, all_of(select_cols))
    
    data <- filter(data, ...)
    
    return(data)
}




