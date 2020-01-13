FROM rocker/r-ver:3.6.2

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    bzip2 \
    ca-certificates \
    curl \
    libbz2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    liblzma-dev \
    openssl \
    pkg-config \
    zlib1g-dev

RUN R -e 'install.packages("BiocManager")' \
 && R -e 'BiocManager::install( \
    update= FALSE, \
    ask= FALSE, \
    version= "3.10" \
)'

ARG buildVersion
ARG imageCreated

ARG toolVersion="3.10"
ARG toolSource="https://www.bioconductor.org"
ARG tool="bioconductor"
ARG brief="${tool} - Base image for Bioconductor packages"
ARG toolLicense="Artistic-2.0"

# From https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.created="${imageCreated}"
LABEL org.opencontainers.image.authors="Stuart R. Jefferys <srj@unc.edu>"
LABEL org.opencontainers.image.url="https://hub.docker.com/r/jefferys/${tool}"
LABEL org.opencontainers.image.source="https://github.com/jefferys/Dockers/BaseDockers/${tool}"
LABEL org.opencontainers.image.version="${toolVersion}"
LABEL org.opencontainers.image.vendor="UNC - Lineberger"
LABEL org.opencontainers.image.licenses="${toolLicense}"
LABEL org.opencontainers.image.ref.name="${tool}:${toolVersion}_${buildVersion}"
LABEL org.opencontainers.image.title="${brief}"
LABEL org.opencontainers.image.description="Builds on a base R image (https://hub.docker.com/r/rocker/r-ver/) and adds the BiocManager installer, as well as some important OS libraries. Packages can be installed by shelling into the container and running, e.g. R -e 'BiocManager::install( pkgs= c(\"GenomicRanges\", \"SummarizedExperiment\"), version= \"${toolVersion}\" )`. Different packages have different licenses."

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="rocker/r-ver:3.6.2"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL about.tags="debian, bioconductor, statisitics, genomics, bioinformatics"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"
