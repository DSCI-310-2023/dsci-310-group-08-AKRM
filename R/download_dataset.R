library(here)
source(here("R/eda.R"))

# download and read raw dataset
data <- read_dataset("https://raw.githubusercontent.com/rehan13/Movie-Revenue-Predictor/main/tmdb_5000_movies.csv", "data/dataset.csv")
