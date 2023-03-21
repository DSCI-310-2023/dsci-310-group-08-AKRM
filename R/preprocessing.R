source("R/eda.R")
source("R/split.R")


# EDA on the raw data 

clean_data <- EDA(data, "data/clean_dataset.csv", c("budget", "revenue", "vote_average", "runtime", "popularity"), "budget" > 0 & "revenue" > 0)

# Train / Test Data
set.seed(15)

tt_split(clean_data, "data/train.csv", "data/test.csv")

revenue_train <- read.csv("data/train.csv")
revenue_test <- read.csv("data/test.csv")
