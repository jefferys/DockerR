FROM jefferys/bioconductor:3.8_latest

RUN R -e 'BiocManager::install( \
    pkgs= c("limma"), \
    update= FALSE, \
    ask= FALSE, \
    version= "3.8" \
)'

# At end as args breaks all following caching. Timestamp changes every time...

ARG buildVersion
ARG imageCreated

ARG toolVersion="3.8"
ARG toolSource="https://bioconductor.org/packages/release/bioc/html/limma.html"
ARG tool="limma"
ARG brief="${tool} - Linear models for microarray data"
# License abbreviation from spdx.org version 2.1 specification
ARG toolLicense="GPL-2.0-or-later"

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
LABEL org.opencontainers.image.description="Limma is a Biocunductor (R) package library for analyzing gene expression microarray data, especially the use of linear models for analysing designed experiments and the assessment of differential expression. With the limma-voom transform and edgeR, it can be used to analyze RNASeq data."

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="jefferys/bioconductor:3.8_latest"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL about.tags="debian, bioconductor, limma, microarray, linear-model, differential-expression"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"
