# author: Jordan Bourak
# date: 2021-11-22

rmd: results/horse_pop_plot_largest_sd.png results/horse_pops_plot.png results/horses_spread.csv doc/rmd_example/rmd_example.html doc/rmd_example/rmd_example.pdf

# generate figures and objects for report
results/horse_pop_plot_largest_sd.png results/horse_pops_plot.png results/horses_spread.csv: source/generate_figures.R
	Rscript source/generate_figures.R --input_dir="data/00030067-eng.csv" --out_dir="results"

# render R Markdown report in HTML and PDF
doc/rmd_example/rmd_example.html doc/rmd_example/rmd_example.pdf: doc/rmd_example/rmd_example.Rmd doc/rmd_example/references.bib
	Rscript -e "rmarkdown::render('doc/rmd_example/rmd_example.Rmd', c('bookdown::html_document2', 'bookdown::pdf_document2'))"

# clean
clean:
	rm -rf results
	rm -rf doc/rmd_example/rmd_example.html doc/rmd_example/rmd_example.pdf
	rm -rf doc/jbook_example/_build