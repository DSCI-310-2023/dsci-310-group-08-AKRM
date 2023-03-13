FROM jupyter/r-notebook:latest


RUN Rscript -e "install.packages('remotes', repos='http://cran.rstudio.com/')"
RUN Rscript -e "remotes::install_version('testthat',version='3.1.6', repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('tidyverse',version='2.0.0', repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('dplyr',version='1.1.0', repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('GGally',version='2.1.2' , repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('tidymodels',version='1.0.0', repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('infer',version='1.0.4', repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('cowplot', version='1.1.1', repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('knitr',version='1.42', repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('rmarkdown', , version='2.20', repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('repr', version='1.1.6', repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('kknn', '1.3.1', repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "remotes::install_version('here', version='1.0.1', repos = 'http://cran.us.r-project.org')"
