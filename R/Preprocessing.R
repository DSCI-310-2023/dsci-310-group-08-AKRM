library(here)
source(here("R/eda.R"))
source(here("R/cp.R"))
source(here("R/grapher.R"))
source(here("R/split.R"))

# EDA on the raw data 

data <- read.csv("data/dataset.csv")
clean_data <- EDA(data, "Results/clean_dataset.csv", c("budget", "revenue", "vote_average", "runtime", "popularity"), "budget" > 0 & "revenue" > 0)

# Train / Test Data
set.seed(15)

tt_split(clean_data, "Results/train.csv", "Results/test.csv")

