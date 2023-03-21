library(tidymodels)

tt_split<-function(data, dest_train, dest_test) {
  revenue_split <- initial_split(data, prop = 0.75, strata = revenue)
  revenue_train <- training(revenue_split)
  write.csv(revenue_train, file = dest_train)
  revenue_test <- testing(revenue_split)
  write.csv(revenue_test, file = dest_test)
}