library(here)
library(tidymodels)
library(GGally)
source(here("R/eda.R"))
source(here("R/cp.R"))
source(here("R/grapher.R"))

revenue_train <- read.csv("Results/train.csv")
revenue_test <- read.csv("Results/test.csv")


# Graph for train data
revenue_train_diagram <-plot_scatter_graph(data=revenue_train, 
                                           plot_width=10, plot_height=10, x_axis_data=budget, 
                                           y_axis_data=revenue, x_axis_label="Budget", 
                                           y_axis_label="Revenue",title_label = "Train Data Plot", text_size=20, psname = "initial_scatter_plot.png", path = "Results")

# Generate Correlation Plot
relationship_revenue <- correlation_plot(data=revenue_train, title="Relationship between each variable", plot_width=15, plot_height=15, cpname = "cp.png", path = "Results")


revenue_results <- read.csv("Results/revenue_results.csv")
  
# Plot K Values
revenue_results_graph <-plot_scatter_graph(data=revenue_results, 
                                           plot_width=5, plot_height=5, x_axis_data=neighbors, 
                                           y_axis_data=mean, x_axis_label="K Value", 
                                           y_axis_label="RMSE",title_label = "Best K value Plot", text_size=20, "K-Value_plot.png", "Results")


revenue_preds<- read.csv("Results/revenue_preds.csv")

# Regression results plot
revenue_Budget_plot <- ggplot(revenue_preds, aes(x = budget, y = revenue)) +
  geom_point() +
  geom_line (data = revenue_preds, mapping = aes (x = budget, y = .pred), color = "red")+
  xlab ("Budget")+
  ylab("Revenue")+
  ggtitle("Relation between Budget and Revenue")+
  theme(text = element_text(size = 15), plot.title = element_text(hjust = 0.5))
revenue_Budget_plot

ggsave(filename = "revenue_Budget_plot.png", device = "png", path = "Results", width = 5, height = 5)
