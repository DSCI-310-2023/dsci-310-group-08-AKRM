library(dplyr)

EDA <- function(dataframe){
    post_eda <- select(dataframe, vote_average, budget, runtime, popularity, revenue) |>
                filter(budget > 0, revenue > 0)
    print(head(post_eda))
}