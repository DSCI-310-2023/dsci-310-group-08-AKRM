FROM rocker/verse:4.2.2


WORKDIR /home/rstudio


# Install R and tidyverse
RUN apt-get update && \
    apt-get install -y r-base && \
    R -e "install.packages('tidyverse', repos = 'http://cran.us.r-project.org')"



RUN R -e "install.packages('remotes', repos='http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('testthat',version='3.1.6', repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('GGally',version='2.1.2' , repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('tidymodels',version='1.0.0', repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('infer',version='1.0.4', repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('cowplot', version='1.1.1', repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('knitr',version='1.42', repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('rmarkdown', , version='2.20', repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('repr', version='1.1.6', repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('kknn', '1.3.1', repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('here', version='1.0.1', repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('markdown', version='1.5', repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('bookdown', version='0.33', repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('docopt', version='0.7.1', repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('float', version='0.3-1', repos = 'http://cran.rstudio.com/')"
RUN R -e "remotes::install_github('DSCI-310/dsci-310-group-08-pkg')"
EXPOSE 8787
