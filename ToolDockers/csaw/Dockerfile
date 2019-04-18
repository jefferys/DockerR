FROM jefferys/bioconductor:3.8_latest

ARG buildVersion
ARG imageCreated

ARG toolVersion="3.8"
ARG toolSource="https://bioconductor.org/packages/release/bioc/html/csaw.html"
ARG tool="csaw"
ARG brief="${tool} - ChIP-seq analysis with windows"
ARG toolLicense="GPL-3.0-only"

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
LABEL org.opencontainers.image.description="Detection of differentially bound regions in ChIP-seq data with sliding windows, with methods for normalization and proper FDR control."

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="jefferys/bioconductor:3.8_latest"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL about.tags="debian, bioconductor, csaw, chip-seq, fdr"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"

RUN R -e 'BiocManager::install( "csaw", \
    update= FALSE, \
    ask= FALSE, \
    version= "3.8" \
)'