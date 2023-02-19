# Predicting the revenue of the movies based on budget

### By - Rehan Mondal and Abheet Kansal 

##### Adapted from DSCI 100 Project by - Ming Zhang, Rehan Mondal, Caroline Lu and Jingwen Leng

### Summary

The entertainment industry has always been a profitable field, especially movies. However, with great profit comes great investment. Most modern-day movies require a budget of around 100 million dollars(1). It is crucial for investors/directors to have a general idea of how much profit they can make based on their investment. Thus, this project centers around studying the profitability of a movie before it is released, predicting revenues based on budget using Knn regression (since most movies fall under a general range of budget and there are rarely extreme outliers)

The question we will try to answer with our project is what is the revenue of a movie based on budget. The data set, which consists of 5000 movies from TMDB, will be separated into training and testing sets. Using budget as the predictor, the prediction of test set revenue will be made. 

In the data set “TMDB 5000 Movie Dataset” (from "https://www.kaggle.com/datasets/tmdb/tmdb-movie-metadata"), revenues, budget, popularity are recorded for the 5000 movies listed in an excel format. Other columns are listed/included in the data set as well, however because they are written in json or not a significant predictor to the revenue, those columns will be filtered out. Revenues is defined as the total box income of the movie; budget is defined as the funding used for the production; Popularity numbers are built according to the TMDB model which consists of number of votes for the day, number of views for the day, number of users who marked it as a "favourite" for the day, Number of users who added it to their "watchlist" for the day, release date, number of total votes, and previous days score. We will discuss and analyze the correlation of each variable with revenue below.

### How to run

### Licenses
