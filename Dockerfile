# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/scipy-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

# Fix: https://github.com/hadolint/hadolint/wiki/DL4006
# Fix: https://github.com/koalaman/shellcheck/wiki/SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# R pre-requisites
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    fonts-dejavu \
    gfortran \
    gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# WORKDIR /tmp


# USER ${NB_UID}

# R packages including IRKernel which gets installed globally.
# r-e1071: dependency of the caret R package
RUN mamba install --quiet --yes \
    'r-base' \
    'r-caret' \
    'r-crayon' \
    'r-devtools' \
    'r-e1071' \
    'r-forecast' \
    'r-hexbin' \
    'r-htmltools' \
    'r-htmlwidgets' \
    'r-irkernel' \
    'r-nycflights13' \
    'r-randomforest' \
    'r-rcurl' \
    'r-rmarkdown' \
    'r-rodbc' \
    'r-rsqlite' \
    'r-shiny' \
    'r-tidymodels' \
    'r-tidyverse' \
    'r-kknn' \
    'r-GGally' \
    'r-infer' \
    'r-cowplot' \
    'rpy2' \
    'unixodbc' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"


# # to the system share location. Avoids problems with runtime UID change not
# # taking effect properly on the .local folder in the jovyan home dir.
# RUN julia -e 'import Pkg; Pkg.update()' && \
#     julia -e 'import Pkg; Pkg.add("HDF5")' && \
#     julia -e 'using Pkg; pkg"add IJulia"; pkg"precompile"' && \
#     # move kernelspec out of home \
#     mv "${HOME}/.local/share/jupyter/kernels/julia"* "${CONDA_DIR}/share/jupyter/kernels/" && \
#     chmod -R go+rx "${CONDA_DIR}/share/jupyter" && \
#     rm -rf "${HOME}/.local" && \
#     fix-permissions "${JULIA_PKGDIR}" "${CONDA_DIR}/share/jupyter"

WORKDIR "${HOME}"
