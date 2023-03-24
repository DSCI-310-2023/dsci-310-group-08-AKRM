rmd:Results/clean_dataset.csv Results/minK.csv Results/revenue_preds.csv Results/revenue_results.csv Results/revenue_summary.csv Results/test.csv Results/train.csv Results/cp.png Results/initial_scatter_plot.png Results/K-Value_plot.png Results/revenue_budget_plot.png data/dataset.csv Analysis/Analysis.html Analysis/Analysis.pdf

# generate figures and objects for report
data/dataset.csv: R/download_dataset.R
	Rscript R/download_dataset.R 
	
Results/clean_dataset.csv Results/train.csv Results/test.csv: R/Preprocessing.R	
	Rscript R/Preprocessing.R 

Results/revenue_results.csv Results/minK.csv Results/revenue_summary.csv Results/revenue_preds.csv: R/modelling.R
	Rscript R/modelling.R 

Results/revenue_Budget_plot.png Results/K-Value_plot.png Results/cp.png Results/initial_scatter_plot.png: R/visualization.R	
	Rscript R/visualization.R 
	
# render R Markdown report in HTML and PDF
Analysis/Analysis.html Analysis/Analysis.pdf: Analysis/Analysis.Rmd
	Rscript -e "rmarkdown::render('Analysis/Analysis.Rmd', c('bookdown::html_document2', 'bookdown::pdf_document2'))"

# clean
clean:
	rm -rf Results
	rm -rf Analysis/Analysis.html Analysis/Analysis.pdf