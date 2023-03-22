library(here)
library(tidyverse)
library(repr)
library(tidymodels)
library(GGally)
library(infer)
library(cowplot)
source(here("R/eda.R"))
source(here("R/cp.R"))
source(here("R/grapher.R"))


revenue_train <- read.csv("Results/train.csv")

revenue_test <- read.csv("Results/test.csv")

# Create recipe
revenue_recipe <- recipe(revenue ~ budget, data = revenue_train)

# 5 fold cross-validation 
revenue_vfold <- vfold_cv(revenue_train, v = 5, strata = revenue)

# Create KNN model
revenue_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) %>%
  set_engine("kknn") %>%
  set_mode("regression")

# Fitting the data in knn model
revenue_wkflw <- workflow() %>%
  add_recipe(revenue_recipe) %>%
  add_model(revenue_spec)

# Setting the gridvals.
gridvals <- tibble(neighbors = seq(from = 1, to = 500, by = 2))

# Results of KNN
revenue_results <- revenue_wkflw %>%
  tune_grid(resamples = revenue_vfold, grid = gridvals) %>%
  collect_metrics() %>%
  filter(.metric == "rmse")

write.csv(revenue_results, file = "Results/revenue_results.csv")


# Exact K value
revenue_min <- revenue_results %>%
  filter(mean == min(mean))

write.csv(revenue_min, file = "Results/minK.csv")

# Getting the best fit for the model
k_min <- revenue_min %>%
  pull(neighbors)

revenue_best_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = k_min) %>%
  set_engine("kknn") %>%
  set_mode("regression")

revenue_best_fit <- workflow() %>%
  add_recipe(revenue_recipe) %>%
  add_model(revenue_best_spec) %>%
  fit(data = revenue_train)

# Summary data
revenue_summary <- revenue_best_fit %>%
  predict(revenue_test) %>%
  bind_cols(revenue_test) %>%
  metrics(truth = revenue, estimate = .pred)
write.csv(revenue_summary, file = "Results/revenue_summary.csv")

# Regression Plot
revenue_preds <- revenue_best_fit %>%
  predict(revenue_train)%>%
  bind_cols(revenue_train)%>%
  select(.pred, revenue, budget)

write.csv(revenue_preds, file = "Results/revenue_preds.csv")
