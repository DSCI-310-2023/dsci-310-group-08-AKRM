library(dplyr)
library(purrr)

movie_training_fn <- function(rev, pr) {
    movie_training <- movie_train %>%
        filter(revenue_data == rev) %>%
        select(vote_average:FWI) %>%
        map_df(pr)
    return(movie_training)
}