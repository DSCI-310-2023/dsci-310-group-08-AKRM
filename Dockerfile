FROM rocker/rstudio

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio renv.lock .
COPY --chown=rstudio:rstudio renv renv
COPY --chown=rstudio:rstudio .Rprofile .

RUN ls -alh

USER rstudio
RUN Rscript -e "renv::repair()"
RUN Rscript -e "renv::restore()"
USER root


EXPOSE 8787
EXPOSE 8888
