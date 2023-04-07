# Predicting the revenue of the movies based on budget

### By - Rehan Mondal and Abheet Kansal 

##### Adapted from DSCI 100 Project by - Ming Zhang, Rehan Mondal, Caroline Lu and Jingwen Leng

### Summary

The entertainment industry has always been a profitable field, especially movies. However, with great profit comes great investment. Most modern-day movies require a budget of around 100 million dollars(1). It is crucial for investors/directors to have a general idea of how much profit they can make based on their investment. Thus, this project centers around studying the profitability of a movie before it is released, predicting revenues based on budget using Knn regression (since most movies fall under a general range of budget and there are rarely extreme outliers)

The question we will try to answer with our project is what is the revenue of a movie based on budget. The data set, which consists of 5000 movies from TMDB, will be separated into training and testing sets. Using budget as the predictor, the prediction of test set revenue will be made.

In the data set “TMDB 5000 Movie Dataset” (from "https://www.kaggle.com/datasets/tmdb/tmdb-movie-metadata"), revenues, budget, popularity are recorded for the 5000 movies listed in an excel format. Other columns are listed/included in the data set as well, however because they are written in json or not a significant predictor to the revenue, those columns will be filtered out. Revenues is defined as the total box income of the movie; budget is defined as the funding used for the production; Popularity numbers are built according to the TMDB model which consists of number of votes for the day, number of views for the day, number of users who marked it as a "favourite" for the day, Number of users who added it to their "watchlist" for the day, release date, number of total votes, and previous days score. We will discuss and analyze the correlation of each variable with revenue below.

### How to run container

 - To replicate the analysis, install
[Docker](https://www.docker.com/get-started). Then `clone` this GitHub repository

```
git clone https://github.com/rehan13/dsci-310-group-08-AKRM.git
```

- `cd` into the directory. Then run the following command at the command line/terminal
from the root directory of this project:

1. **Option A** (This takes longer time to build)
``` 
docker build --tag akrm-env .
```
2. **Option B**
```
docker pull rehan13/dsci-310-group-08-akrm:latest
```

-  Followed by the command below to open the container below.

``` 
docker run --rm -p 8787:8787 -v /${PWD}:/home/rstudio -e PASSWORD="apassword" akrm-env 
```

- To open Rstudio on the web browser copy the url `http://localhost:8787` and open it on web browser. Enter `rstudio` as username and `apassword` as password. 

  
### Makefile instruction

- Once the container is open go to the R terminal and type the following command
```
make clean
```
- Followed By 
```
make all
```

This will generate the analysis and all the necessary supporting files including downloading the raw data from the internet.

- Then navigate into the `Analysis` folder and open `Analysis.html` on your default browser or `Analysis.pdf` on your pdf reader.

- All the generated files will be located in `data` and `Results` folder.

### Dependencies

- Base Image:- rocker/verse:4.2.2

Packages -> Version
- testthat -> 3.1.6
- knitr  -> 1.42
- ggplot2 -> 3.4.1
- tidyverse  -> 2.0.0
- docopt -> 0.7.1
- GGally  -> 2.1.2
- tidymodels -> 1.0.0
- infer  -> 1.0.4
- cowplot -> 1.1.1
- rmarkdown  -> 2.20
- here -> 1.0.1
- markdown -> 1.5
- bookdown -> 0.33
- float -> 0.3-1 

### Licenses

Predicting the revenue of the movies based on budget © 2023 by Abheet Kansal, Rehan Mondal is licensed under Attribution 4.0 International. If
re-using or re-mixing please provide attribution and link to this webpage.

### Acknowledgement

Mondal, R., Zhang, M., Lu, C., &amp; Leng, J. (2022). Predicting the revenue of the movies based on budget. Retrieved 2023, from https://github.com/rehan13/DSCI-100-Project-Group25.git 

Permission were take from all members of the DSCI 100 group on email by Rehan Mondal for re using this project.
