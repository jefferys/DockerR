FROM jefferys/bioconductor:3.8_latest

RUN R -e 'BiocManager::install( \
    pkgs= c("reshape2"), \
    update= FALSE, \
    ask= FALSE, \
    version= "3.8" \
)'

COPY core-gsea.Rscript /usr/local/bin
COPY core-gsea /usr/local/bin

# At end as args breaks all following caching. Timestamp changes every time...

ARG buildVersion
ARG imageCreated

ARG toolVersion="3.8"
ARG tool="core-gsea"
ARG toolSource="https://github.com/jefferys/Dockers/ToolDockers/${tool}"
ARG brief="${tool} - Gene set enrichment analysis from the Lineberger Bioinformatics Core"
# License abbreviation from spdx.org version 2.1 specification
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
LABEL org.opencontainers.image.description="A simple implementation of gene set enrichment analysis in R."

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="jefferys/bioconductor:3.8_latest"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL about.tags="debian, bioconductor, gsea"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"
