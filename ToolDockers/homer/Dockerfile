FROM jefferys/bioconductor-reports:3.8_latest

RUN R -e 'BiocManager::install( \
    c("DESeq2","edgeR"), \
    update= FALSE, \
    ask= FALSE, \
    version= "3.8" \
)'


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    autoconf \
    build-essential \
    bzip2 \
    ca-certificates \
    curl \
    libbz2-dev \
    liblzma-dev \
    libncurses5-dev \
    perl \
    wget \
    zlib1g-dev

# Samtools
RUN /usr/bin/curl -L "https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2" \
                  -o "/usr/local/samtools-1.9.tar.bz2" && \
    cd "/usr/local" && \
    tar -jxvf "samtools-1.9.tar.bz2" && \
    rm "samtools-1.9.tar.bz2" && \
    cd "samtools-1.9" && \
    autoheader && \
    autoconf -Wno-syntax && \
    ./configure --prefix="/usr/local" && \
    make && \
    make install

RUN mkdir /usr/local/homer && \
    cd "/usr/local/homer" && \
    /usr/bin/curl -L "http://homer.ucsd.edu/homer/configureHomer.pl" \
                  -o "configureHomer.pl" && \
    perl configureHomer.pl -install
    
RUN cd "/usr/local/homer" && \
    perl configureHomer.pl -install human-o && \
    perl configureHomer.pl -install human-p


ENV PATH "$PATH:/usr/local/homer/bin"

# At end as args breaks all following caching. Timestamp changesd every time...

ARG buildVersion
ARG imageCreated

ARG toolVersion="4.11"
ARG toolSource="http://homer.ucsd.edu/homer/introduction/install.html"
ARG tool="homer"
ARG brief="${tool} - Software for motif discovery and next-gen sequencing analysis"
ARG toolLicense=" GPL-3.0-or-later"

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
LABEL org.opencontainers.image.description="A container containing the homer tool suite, plus its dependencies"

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="jefferys/bioconductor-reports:3.8_latest"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL about.tags="debian, bioconductor, homer, motif, chip-seq"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"