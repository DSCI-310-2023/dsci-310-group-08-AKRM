# Predicting the revenue of the movies based on budget

### By - Rehan Mondal and Abheet Kansal 

##### Adapted from DSCI 100 Project by - Ming Zhang, Rehan Mondal, Caroline Lu and Jingwen Leng

### Summary

The entertainment industry has always been a profitable field, especially movies. However, with great profit comes great investment. Most modern-day movies require a budget of around 100 million dollars(1). It is crucial for investors/directors to have a general idea of how much profit they can make based on their investment. Thus, this project centers around studying the profitability of a movie before it is released, predicting revenues based on budget using Knn regression (since most movies fall under a general range of budget and there are rarely extreme outliers)

The question we will try to answer with our project is what is the revenue of a movie based on budget. The data set, which consists of 5000 movies from TMDB, will be separated into training and testing sets. Using budget as the predictor, the prediction of test set revenue will be made.

In the data set “TMDB 5000 Movie Dataset” (from "https://www.kaggle.com/datasets/tmdb/tmdb-movie-metadata"), revenues, budget, popularity are recorded for the 5000 movies listed in an excel format. Other columns are listed/included in the data set as well, however because they are written in json or not a significant predictor to the revenue, those columns will be filtered out. Revenues is defined as the total box income of the movie; budget is defined as the funding used for the production; Popularity numbers are built according to the TMDB model which consists of number of votes for the day, number of views for the day, number of users who marked it as a "favourite" for the day, Number of users who added it to their "watchlist" for the day, release date, number of total votes, and previous days score. We will discuss and analyze the correlation of each variable with revenue below.

### How to run

 - To replicate the analysis, install
[Docker](https://www.docker.com/get-started). Then `clone` this GitHub
repository and `cd` into the directory. Then run the following command at the command line/terminal
from the root directory of this project:

- `docker build --tag akrm-env .`

Followed by:
- `docker run --rm -p 8787:8787 -v "${PWD}":/home/rstudio -e PASSWORD="apassword" akrm-env`

- To open Rstudio on the web browser `http://localhost:8787` and enter the username as `rstudio` and password as `apassword` 

- Navigate to the Analysis folder and then knit Analysis.Rmd

### Dependencies
- Base Image:- rocker/rstudio:4.2.2

Packages          Version
- DBI             [* -> 1.1.3]
- DiceDesign      [* -> 1.9]
- GGally          [* -> 2.1.2]
- GPfit           [* -> 1.0-8]
- KernSmooth      [* -> 2.23-20]
- R6              [* -> 2.5.1]
- RColorBrewer    [* -> 1.1-3]
- Rcpp            [* -> 1.0.10]
- SQUAREM         [* -> 2021.1]
- askpass         [* -> 1.1]
- backports       [* -> 1.4.1]
- base64enc       [* -> 0.1-3]
- bit             [* -> 4.0.5]
- bit64           [* -> 4.0.5]
- blob            [* -> 1.2.3]
- broom           [* -> 1.0.4]
- bslib           [* -> 0.4.2]
- cachem          [* -> 1.0.7]
- callr           [* -> 3.7.3]
- cellranger      [* -> 1.1.0]
- class           [* -> 7.3-20]
- cli             [* -> 3.6.0]
- clipr           [* -> 0.8.0]
- clock           [* -> 0.6.1]
- codetools       [* -> 0.2-18]
- colorspace      [* -> 2.1-0]
- conflicted      [* -> 1.2.0]
- cowplot         [* -> 1.1.1]
- cpp11           [* -> 0.4.3]
- crayon          [* -> 1.5.2]
- curl            [* -> 5.0.0]
- data.table      [* -> 1.14.8]
- dbplyr          [* -> 2.3.1]
- dials           [* -> 1.1.0]
- digest          [* -> 0.6.31]
- dplyr           [* -> 1.1.0]
- dtplyr          [* -> 1.3.0]
- ellipsis        [* -> 0.3.2]
- evaluate        [* -> 0.20]
- fansi           [* -> 1.0.4]
- farver          [* -> 2.1.1]
- fastmap         [* -> 1.1.1]
- forcats         [* -> 1.0.0]
- foreach         [* -> 1.5.2]
- fs              [* -> 1.6.1]
- furrr           [* -> 0.3.1]
- future          [* -> 1.32.0]
- future.apply    [* -> 1.10.0]
- gargle          [* -> 1.3.0]
- generics        [* -> 0.1.3]
- ggplot2         [* -> 3.4.1]
- globals         [* -> 0.16.2]
- glue            [* -> 1.6.2]
- googledrive     [* -> 2.0.0]
- googlesheets4   [* -> 1.0.1]
- gower           [* -> 1.0.1]
- gtable          [* -> 0.3.1]
- hardhat         [* -> 1.2.0]
- haven           [* -> 2.5.2]
- highr           [* -> 0.10]
- hms             [* -> 1.1.2]
- htmltools       [* -> 0.5.4]
- httr            [* -> 1.4.5]
- ids             [* -> 1.0.1]
- infer           [* -> 1.0.4]
- ipred           [* -> 0.9-14]
- isoband         [* -> 0.2.7]
- iterators       [* -> 1.0.14]
- jquerylib       [* -> 0.1.4]
- jsonlite        [* -> 1.8.4]
- knitr           [* -> 1.42]
- labeling        [* -> 0.4.2]
- lattice         [* -> 0.20-45]
- lava            [* -> 1.7.2.1]
- lhs             [* -> 1.1.6]
- lifecycle       [* -> 1.0.3]
- listenv         [* -> 0.9.0]
- lubridate       [* -> 1.9.2]
- MASS            [* -> 7.3-58.1]
- Matrix          [* -> 1.5-1]
- magrittr        [* -> 2.0.3]
- memoise         [* -> 2.0.1]
- mgcv            [* -> 1.8-41]
- mime            [* -> 0.12]
- modeldata       [* -> 1.1.0]
- modelenv        [* -> 0.1.1]
- modelr          [* -> 0.1.10]
- munsell         [* -> 0.5.0]
- nlme            [* -> 3.1-160]
- nnet            [* -> 7.3-18]
- numDeriv        [* -> 2016.8-1.1]
- openssl         [* -> 2.0.6]
- parallelly      [* -> 1.34.0]
- parsnip         [* -> 1.0.4]
- patchwork       [* -> 1.1.2]
- pillar          [* -> 1.8.1]
- pkgconfig       [* -> 2.0.3]
- plyr            [* -> 1.8.8]
- prettyunits     [* -> 1.1.1]
- processx        [* -> 3.8.0]
- prodlim         [* -> 2019.11.13]
- progress        [* -> 1.2.2]
- progressr       [* -> 0.13.0]
- ps              [* -> 1.7.2]
- purrr           [* -> 1.0.1]
- ragg            [* -> 1.2.5]
- rappdirs        [* -> 0.3.3]
- readr           [* -> 2.1.4]
- readxl          [* -> 1.4.2]
- recipes         [* -> 1.0.5]
- rematch         [* -> 1.0.1]
- rematch2        [* -> 2.1.2]
- renv            [* -> 0.16.0]
- repr            [* -> 1.1.6]
- reprex          [* -> 2.0.2]
- reshape         [* -> 0.8.9]
- rlang           [* -> 1.0.6]
- rmarkdown       [* -> 2.20]
- rpart           [* -> 4.1.19]
- rsample         [* -> 1.1.1]
- rstudioapi      [* -> 0.14]
- rvest           [* -> 1.0.3]
- sass            [* -> 0.4.5]
- scales          [* -> 1.2.1]
- selectr         [* -> 0.4-2]
- slider          [* -> 0.3.0]
- stringi         [* -> 1.7.12]
- stringr         [* -> 1.5.0]
- survival        [* -> 3.4-0]
- sys             [* -> 3.4.1]
- systemfonts     [* -> 1.0.4]
- textshaping     [* -> 0.3.6]
- tibble          [* -> 3.2.0]
- tidymodels      [* -> 1.0.0]
- tidyr           [* -> 1.3.0]
- tidyselect      [* -> 1.2.0]
- tidyverse       [* -> 2.0.0]
- timeDate        [* -> 4022.108]
- timechange      [* -> 0.2.0]
- tinytex         [* -> 0.44]
- tune            [* -> 1.0.1]
- tzdb            [* -> 0.3.0]
- utf8            [* -> 1.2.3]
- uuid            [* -> 1.1-0]
- vctrs           [* -> 0.5.2]
- viridisLite     [* -> 0.4.1]
- vroom           [* -> 1.6.1]
- warp            [* -> 0.2.0]
- withr           [* -> 2.5.0]
- workflows       [* -> 1.1.3]
- workflowsets    [* -> 1.0.0]
- xfun            [* -> 0.37]
- xml2            [* -> 1.3.3]
- yaml            [* -> 2.3.7]
- yardstick       [* -> 1.1.0]


### Licenses

Predicting the revenue of the movies based on budget © 2023 by Abheet Kansal, Rehan Mondal is licensed under Attribution 4.0 International. If
re-using or re-mixing please provide attribution and link to this webpage.

### Acknowledgement

Mondal, R., Zhang, M., Lu, C., &amp; Leng, J. (2022). Predicting the revenue of the movies based on budget. Retrieved 2023, from https://github.com/rehan13/DSCI-100-Project-Group25.git 

Permission were take from all members of the DSCI 100 group on email by Rehan Mondal for re using this project.
