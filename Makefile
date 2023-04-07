all: data/dataset.csv Results/clean_data.csv Results/test.csv Results/train.csv Results/revenue_results.csv Results/revenue_min.csv Results/revenue_preds.csv Results/revenue_summary.csv Results/initial_scatter_plot.png Results/cp.png Results/K-Value_plot.png Results/revenue_Budget_plot.png Analysis/Analysis.html Analysis/Analysis.pdf

# generate figures and objects for report
data/dataset.csv: R/download_dataset.R
	Rscript R/download_dataset.R --url=https://raw.githubusercontent.com/rehan13/Movie-Revenue-Predictor/main/tmdb_5000_movies.csv --out_dir=data/dataset.csv 
	
Results/clean_data.csv Results/train.csv Results/test.csv: R/Preprocessing.R	data/dataset.csv
	Rscript R/Preprocessing.R --raw=data/dataset.csv --out_dir=Results/

Results/revenue_results.csv Results/revenue_min.csv Results/revenue_summary.csv Results/revenue_preds.csv: R/modelling.R
	Rscript R/modelling.R --in_dir1=Results/train.csv --in_dir2=Results/test.csv --out_dir=Results/

Results/revenue_Budget_plot.png Results/K-Value_plot.png Results/cp.png Results/initial_scatter_plot.png: R/visualization.R	
	Rscript R/visualization.R --train=Results/train.csv --test=Results/test.csv --results=Results/revenue_results.csv --preds=Results/revenue_preds.csv --out_dir=Results/
	
# render R Markdown report in HTML and PDF
Analysis/Analysis.html Analysis/Analysis.pdf: Analysis/Analysis.Rmd
	Rscript -e "rmarkdown::render('Analysis/Analysis.Rmd', c('bookdown::html_document2', 'bookdown::pdf_document2'))"

# clean
clean:
	rm -rf data
	rm -rf Results
	rm -rf Analysis/Analysis.html Analysis/Analysis.pdf