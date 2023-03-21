library(here)
library(tidyverse)
library(repr)
library(tidymodels)
library(GGally)
library(infer)
library(cowplot)
source(here("R/reading.R"))
source(here("R/cp.R"))
source(here("R/grapher.R"))
source(here("R/preprocessing.R"))




# Graph for train data

revenue_train_diagram <-plot_scatter_graph(data=revenue_train, 
                                           plot_width=10, plot_height=10, x_axis_data=budget, 
                                           y_axis_data=revenue, x_axis_label="Budget", 
                                           y_axis_label="Revenue",title_label = "Train Data Plot", text_size=20, psname = "initial_scatter_plot.png", path = "data")

# Generate Correlation Plot
relationship_revenue <- correlation_plot(data=revenue_train, title="Relationship between each variable", plot_width=15, plot_height=15, cpname = "cp.png", path = "data")

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

# Plot K Values
revenue_results_graph <-plot_scatter_graph(data=revenue_results, 
                                           plot_width=5, plot_height=5, x_axis_data=neighbors, 
                                           y_axis_data=mean, x_axis_label="K Value", 
                                           y_axis_label="RMSE",title_label = "Best K value Plot", text_size=20, "K-Value_plot.png", "data/")

# Exact K value
revenue_min <- revenue_results %>%
  filter(mean == min(mean))

revenue_min
write.csv(revenue_min, file = "data/minK.csv")

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
revenue_summary
write.csv(revenue_summary, file = "data/revenue_summary.csv")

# Regression Plot
revenue_preds <- revenue_best_fit %>%
  predict(revenue_train)%>%
  bind_cols(revenue_train)%>%
  select(.pred, revenue, budget)
revenue_Budget_plot <- ggplot(revenue_preds, aes(x = budget, y = revenue)) +
  geom_point() +
  geom_line (data = revenue_preds, mapping = aes (x = budget, y = .pred), color = "red")+
  xlab ("Budget")+
  ylab("Revenue")+
  ggtitle("Relation between Budget and Revenue")+
  theme(text = element_text(size = 15), plot.title = element_text(hjust = 0.5))
revenue_Budget_plot

ggsave(filename = "revenue_Budget_plot.png", device = "png", path = "data", width = 5, height = 5)
