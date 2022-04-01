FROM rocker/r-ver:4.1.3
RUN apt-get update && apt-get install -y  git-core libcurl4-openssl-dev libgit2-dev libicu-dev libssl-dev libxml2-dev make pandoc pandoc-citeproc zlib1g-dev && rm -rf /var/lib/apt/lists/*
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" >> /usr/local/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN Rscript -e 'remotes::install_version("pkgload",upgrade="never", version = "1.2.4")'
RUN Rscript -e 'remotes::install_version("knitr",upgrade="never", version = "1.38")'
RUN Rscript -e 'remotes::install_version("shiny",upgrade="never", version = "1.7.1")'
RUN Rscript -e 'remotes::install_version("rmarkdown",upgrade="never", version = "2.13")'
RUN Rscript -e 'remotes::install_version("reshape2",upgrade="never", version = "1.4.4")'
RUN Rscript -e 'remotes::install_version("readr",upgrade="never", version = "2.1.2")'
RUN Rscript -e 'remotes::install_version("plotly",upgrade="never", version = "4.10.0")'
RUN Rscript -e 'remotes::install_version("golem",upgrade="never", version = "0.3.2")'
RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone
RUN R -e 'remotes::install_local(upgrade="never")'
RUN rm -rf /build_zone
CMD R -e "options('shiny.port'=$PORT,shiny.host='0.0.0.0');Rgitsimran::run_app()"
