library(dplyr)
library(here)

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
#' This function takes in a dataframe and only selects the columns passed in as selects and filter the columns entered to filtered.
#'
#' @param data The dataframe which stores the dataset from where the required columns are selected and filtered for EDA
#'
#' @param select_cols Enter the columns that need to be selected from the data eg:- c(c("col1", "col2"))
#' 
#' @param ... It takes in all the columns that need to be filtered with its filtering technique as seperate arguments eg:- col1 > 1, col2 > 5
#' 
#' @return Returns the dataframe after selecting the required columns and filtering them based on the criteria given
#' 

EDA <- function(data, dest,  select_cols, ...) {
    library(dplyr)
    
    data <- select(data, all_of(select_cols))
    
    data <- filter(data, ...)
    
    write.csv(data, file = dest)
    
    return(data)
}


