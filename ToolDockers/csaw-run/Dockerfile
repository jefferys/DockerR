FROM jefferys/bioconductor-reports:3.8_latest

RUN R -e 'BiocManager::install( "csaw", \
    update= FALSE, \
    ask= FALSE, \
    version= "3.8" \
)'

RUN R -e 'BiocManager::install( \
    c( "checkmate", "openssl", "optparse", "statmod" ), \
    update= FALSE, \
    ask= FALSE, \
    version= "3.8" \
)'

RUN R -e 'BiocManager::install( \
    c( "annotatr", "TxDb.Hsapiens.UCSC.hg38.knownGene", "org.Hs.eg.db" ), \
    update= FALSE, \
    ask= FALSE, \
    version= "3.8" \
)'

RUN R -e 'BiocManager::install( \
    c( "EnhancedVolcano", "rtracklayer" ), \
    update= FALSE, \
    ask= FALSE, \
    version= "3.8" \
)'

RUN R -e 'BiocManager::install( \
    c( "ChIPseeker" ), \
    update= FALSE, \
    ask= FALSE, \
    version= "3.8" \
)'

ADD csaw.Rscript /usr/local/bin/

# At end as args breaks all following caching. Timestamp changesd every time...

ARG buildVersion
ARG imageCreated

ARG toolVersion="0.0.2"
ARG toolSource="https://bioconductor.org/packages/release/bioc/html/csaw.html"
ARG tool="csaw-run"
ARG brief="${tool} - Running csaw from a command line script"
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
LABEL org.opencontainers.image.description="The Bioconductor csaw packages, executed via a wrapper script to run as a command line program, /usr/local/bin/csaw.Rscript"

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="jefferys/bioconductor-reports:3.8_latest"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL about.tags="debian, bioconductor, csaw, chip-seq, fdr"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"