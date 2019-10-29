FROM jefferys/bioconductor-reports:3.8_latest

RUN R -e 'BiocManager::install( "annotatr", \
    update= FALSE, \
    ask= FALSE, \
    version= "3.8" \
)'

RUN R -e 'BiocManager::install( \
    c( "TxDb.Hsapiens.UCSC.hg38.knownGene", "org.Hs.eg.db" ), \
    update= FALSE, \
    ask= FALSE, \
    version= "3.8" \
)'

# At end as args breaks all following caching. Timestamp changesd every time...

ARG buildVersion
ARG imageCreated

ARG toolVersion="3.8"
ARG toolSource="https://www.bioconductor.org/packages/release/bioc/html/annotatr.html"
ARG tool="annotatr-hg38"
ARG brief="${tool} - Annotation of genomic regions"
ARG toolLicense="GPL-3.0-or-later"

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
LABEL org.opencontainers.image.description="The Bioconductor annotatr packages plus genomic annotations for the hg38 human genome. Requires web access to download additional annotations."

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="jefferys/bioconductor-reports:3.8_latest"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL about.tags="debian, bioconductor, annotatr, annotqation, hg38"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"