read_dataset <- function(path){
    url <- "https://raw.githubusercontent.com/rehan13/DSCI-100-Project-Group25/master/tmdb_5000_movies.csv"
    download.file(url, destfile = "data/Revenue.csv")
    dataset <- read.csv("data/Revenue.csv")
    print(head(dataset))
}

read_dataset()


