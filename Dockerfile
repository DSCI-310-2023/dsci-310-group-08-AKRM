FROM rocker/rstudio:4.2.2

WORKDIR /home/rstudio

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/rocker-org/rocker-versioned2" \
      org.opencontainers.image.vendor="Rocker Project" \
      org.opencontainers.image.authors="Carl Boettiger <cboettig@ropensci.org>"

ENV S6_VERSION=v2.1.0.2
ENV RSTUDIO_VERSION=2022.02.2+485
ENV DEFAULT_USER=rstudio
ENV PANDOC_VERSION=default

RUN ls -alh

USER rstudio
RUN R -e "install.packages('remotes', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "remotes::install_version('ggplot2',version='3.4.1')"
RUN R -e "remotes::install_version('testthat',version='3.1.6')"
RUN R -e "remotes::install_version('tidyverse',version='2.0.0')"
RUN R -e "remotes::install_version('dplyr',version='1.1.0')"
RUN R -e "remotes::install_version('GGally', dependencies = TRUE ,version='2.1.2')"
RUN R -e "remotes::install_version('tidymodels',version='1.0.0')"
RUN R -e "remotes::install_version('infer',version='1.0.4')"
RUN R -e "remotes::install_version('cowplot', dependencies = TRUE, version='1.1.1')"
RUN R -e "remotes::install_version('knitr',version='1.42')"
RUN R -e "remotes::install_version('rmarkdown', dependencies = TRUE, version='2.20')"
RUN R -e "remotes::install_version('repr', dependencies = TRUE, version='1.1.6')"

USER root

EXPOSE 8787

CMD ["/init"]