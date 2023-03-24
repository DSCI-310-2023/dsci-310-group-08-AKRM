"Genereates all the plots using data stored from Preprocessing.R modelling.R, 
Usage: R/visualization.R --train=<train> --test=<test> --results=<results> --preds=<preds> --out_dir=<out_dir>
Options:
--train=<train>       Path (including filename) to training data (csv file)
--test=<test>         Path (including filename) to testing data (csv file)
--results=<results>   Path (including filename) to revenue results data (csv file)
--preds=<preds>.      Path (including filename) to revenue preds data (csv file)
--out_dir=<out_dir>   Path to directory where the plots will be stored
" -> doc

library(here)
library(tidymodels)
library(GGally)
library(docopt)
source(here("R/eda.R"))
source(here("R/cp.R"))
source(here("R/grapher.R"))

opt <- docopt(doc)

main <- function(train, test, results, preds, out_dir){
  
  revenue_train <- read.csv(train)
  revenue_test <- read.csv(test)
  
  
  # Graph for train data
  revenue_train_diagram <-plot_scatter_graph(data=revenue_train, 
                                             x_axis_data=budget, 
                                             y_axis_data=revenue, x_axis_label="Budget", 
                                             y_axis_label="Revenue",title_label = "Train Data Plot", text_size=20)
  ggsave(plot = revenue_train_diagram, filename = "initial_scatter_plot.png", device = "png", path = out_dir, width = 10, height = 10)
  
  # Generate Correlation Plot
  relationship_revenue <- correlation_plot(data=revenue_train, title="Relationship between each variable")
  ggsave(plot=relationship_revenue, filename = "cp.png", device = "png", path = out_dir, width = 10, height = 10)
  
  revenue_results <- read.csv(results)
  
  # Plot K Values
  revenue_results_graph <-plot_scatter_graph(data=revenue_results, 
                                             x_axis_data=neighbors, 
                                             y_axis_data=mean, x_axis_label="K Value", 
                                             y_axis_label="RMSE",title_label = "Best K value Plot", text_size=20)
  ggsave(plot = revenue_results_graph, filename = "K-Value_plot.png", device = "png", path = out_dir, width = 10, height = 10)
  
  
  revenue_preds<- read.csv("Results/revenue_preds.csv")

# Regression results plot
revenue_Budget_plot <- ggplot(revenue_preds, aes(x = budget, y = revenue)) +
  geom_point() +
  geom_line (data = revenue_preds, mapping = aes (x = budget, y = .pred), color = "red")+
  xlab ("Budget")+
  ylab("Revenue")+
  ggtitle("Relation between Budget and Revenue")+
  theme(text = element_text(size = 15), plot.title = element_text(hjust = 0.5))

ggsave(plot=revenue_Budget_plot, filename = "revenue_Budget_plot.png", device = "png", path = "Results", width = 10, height = 10)

}

main(opt[["--train"]], opt[["--test"]], opt[["--results"]], opt[["--predst"]], opt[["--out_dir"]])
