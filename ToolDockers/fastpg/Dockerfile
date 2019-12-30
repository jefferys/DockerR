FROM jefferys/bioconductor:3.8_latest

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      python \
      python-dev \
      python-setuptools \
      python-pip

RUN pip install wheel \
 && pip install psutil \
 && pip install nmslib==2.0.5 \
                  leidenalg \
                  igraph
 
RUN R -e 'BiocManager::install( \
    c( "flowCore", "data.table", "RANN", "Rcpp", "RcppParallel", \
       "igraph", "nmslibR", "mclust", "MLmetrics" ), \
    update= FALSE, \
    ask= FALSE, \
    version= "3.8" \
)'

ADD fastPG.R SaraToyRun.R parallel_jc2.cpp  /usr/local/fastpg/
ENV PATH "$PATH:/usr/local/fastpg"

# At end as args breaks all following caching. Timestamp changesd every time...

ARG buildVersion
ARG imageCreated

ARG toolVersion="0.0.1"
ARG toolSource="https://github.com/sararselitsky/FastPG/tree/dev"
ARG tool="fastpg"
ARG brief="${tool} - Running fastpg from a command line script"
ARG toolLicense="MIT"

# From https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.created="${imageCreated}"
LABEL org.opencontainers.image.authors="Stuart R. Jefferys <srj@unc.edu>"
LABEL org.opencontainers.image.url="https://hub.docker.com/r/jefferys/${tool}"
LABEL org.opencontainers.image.source="https://github.com/jefferys/Dockers/ToolDockers/${tool}"
LABEL org.opencontainers.image.version="${toolVersion}"
LABEL org.opencontainers.image.vendor="UNC - Lineberger"
LABEL org.opencontainers.image.licenses="${toolLicense}"
LABEL org.opencontainers.image.ref.name="${tool}:${toolVersion}_${buildVersion}"
LABEL org.opencontainers.image.title="${brief}"
LABEL org.opencontainers.image.description="The fastpg R package, executed via a wrapper script to run as a self-executing R script, /usr/local/fastpg/fastPG.R"

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="jefferys/bioconductor-reports:3.8_latest"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL about.tags="debian, bioconductor, fastpg, nlmlib"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"

ENTRYPOINT ["bash"]