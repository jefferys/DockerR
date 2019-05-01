FROM debian:9.8

ARG buildVersion
ARG imageCreated

ARG toolVersion="1.9"
ARG toolSource="https://github.com/samtools/samtools/releases/download/${toolVersion}/samtools-${toolVersion}.tar.bz2"
ARG tool="samtools"
ARG brief="${tool} - Tools in C for manipulating next-generation sequencing data (fastq, sam, bam, and cram files)"
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
LABEL org.opencontainers.image.description="A container for running samtools to manipulate fastq, sam, bam, and cram files."

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="debian:9.8"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL keywords="debian, ${tool}, sam, bam, alignment, genomics, bioinformatics"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"

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
    zlib1g-dev
    
RUN /usr/bin/curl -L "${toolSource}" \
                  -o "/usr/local/samtools-${toolVersion}.tar.bz2" && \
    cd "/usr/local" && \
    tar -jxvf "samtools-${toolVersion}.tar.bz2" && \
    rm "samtools-${toolVersion}.tar.bz2" && \
    cd "samtools-${toolVersion}" && \
    autoheader && \
    autoconf -Wno-syntax && \
    ./configure --prefix="/usr/local" && \
    make && \
    make install
