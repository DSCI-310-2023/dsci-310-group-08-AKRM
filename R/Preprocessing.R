"Cleans and prepocesses data csv data from the web to a local filepath a csv
Writes the train and test data to separate files in Results.
Usage: R/Preprocessing.R --raw=<raw> --out_dir=<out_dir>
Options:
--raw=<raw>       Path (including filename) to raw data (csv file)
--out_dir=<out_dir>   Path to directory where the processed data should be written
" -> doc

library(here)
library(docopt)
library(tidymodels)
library(Movie)

set.seed(15)

# EDA on the raw data 
opt <- docopt(doc)
main <- function(raw, out_dir){
  
  data <- read.csv(raw)
  clean_data <- EDA(data, c("budget", "revenue", "vote_average", "runtime", "popularity"), "budget" > 0 & "revenue" > 0)
  
  
  # Train / Test Data

  revenue_split <- initial_split(clean_data, prop = 0.75, strata = revenue)
  revenue_train <- training(revenue_split)
  revenue_test <- testing(revenue_split)

  
  # Create out_dir if it does not exist
  if (!dir.exists(out_dir)) {
    dir.create(out_dir, recursive = TRUE)
  }
  
  clean_data_file_path = paste(out_dir, "clean_data.csv",sep = "", collapse = NULL)
  train_file_path = paste(out_dir, "train.csv",sep = "", collapse = NULL)
  test_file_path = paste(out_dir, "test.csv",sep = "", collapse = NULL)
  
  
 
  write.csv(clean_data,clean_data_file_path, row.names = FALSE)
  write.csv(revenue_train,train_file_path, row.names = FALSE)
  write.csv(revenue_test,test_file_path, row.names = FALSE)
  
}
main(opt[["--raw"]], opt[["--out_dir"]])

