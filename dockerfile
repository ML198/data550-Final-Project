FROM --platform=linux/amd64 rocker/tidyverse:latest AS base

RUN mkdir -p /home/rstudio/project
WORKDIR /home/rstudio/project

RUN mkdir -p renv
COPY insurance.Rmd ./
COPY Makefile ./
COPY scripts ./scripts
COPY data ./data
COPY renv.lock ./
COPY renv/activate.R ./renv/activate.R
COPY renv/settings.json ./renv/settings.json


ENV RENV_CONFIG_REPOS_OVERRIDE=https://packagemanager.posit.co/cran/latest
ENV RENV_PATHS_CACHE=renv/.cache

RUN mkdir -p renv/.cache

# RUN echo "options(pkgType = 'binary')" >> ~/.Rprofile

RUN apt-get update && apt-get install -y \
    pandoc \
    build-essential \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev

RUN Rscript -e "install.packages('renv')"
RUN Rscript -e "renv::restore(prompt = FALSE)"

CMD ["make", "report"]

