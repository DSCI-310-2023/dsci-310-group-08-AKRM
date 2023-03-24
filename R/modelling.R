"
Reads data from input directories, fits a model, runs the analysis and creates summary tables. 
Usage: R/modelling.R --in_dir1=<in_dir1> --in_dir2=<in_dir2> --out_dir=<out_dir>
Options:
--in_dir1=<in_dir1>          Path to train.csv
--in_dir2=<in_dir2>          Path to test.csv
--out_dir=<out_dir>     Path to directory where the results should be save
" -> doc


library(docopt)
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


opt <- docopt(doc)

main <- function(in_dir1,
                 in_dir2,
                 out_dir) {
  
  if (!dir.exists(out_dir)) {
    dir.create(out_dir)
  }
  
  revenue_train <- read.csv(in_dir1)
  revenue_test <- read.csv(in_dir2)
  
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

  # Exact K value
  revenue_min <- revenue_results %>%
    filter(mean == min(mean))

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
  
  
  # Regression Plot
  revenue_preds <- revenue_best_fit %>%
    predict(revenue_train)%>%
    bind_cols(revenue_train)%>%
    select(.pred, revenue, budget)

  revenue_results_file_path = paste(out_dir, "revenue_results.csv",sep = "", collapse = NULL)
  revenue_min_file_path = paste(out_dir, "revenue_min.csv",sep = "", collapse = NULL)
  revenue_summary_file_path = paste(out_dir, "revenue_summary.csv",sep = "", collapse = NULL)
  revenue_preds_file_path = paste(out_dir, "revenue_preds.csv",sep = "", collapse = NULL)
  
  
  write.csv(revenue_results,revenue_results_file_path, row.names = FALSE)
  write.csv(revenue_min,revenue_min_file_path, row.names = FALSE)
  write.csv(revenue_summary,revenue_summary_file_path, row.names = FALSE)
  write.csv(revenue_preds,revenue_preds_file_path, row.names = FALSE)

}

main(opt[["--in_dir1"]], opt[["--in_dir2"]], opt[["--out_dir"]])
