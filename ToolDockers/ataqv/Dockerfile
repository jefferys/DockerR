FROM debian:9.8

ARG buildVersion
ARG imageCreated

ARG tool="ataqv"
ARG toolVersion="1.0.0"
ARG toolSource="https://github.com/ParkerLab/ataqv/archive/${toolVersion}.tar.gz"
ARG brief="${tool} - ATAC-seq QC and visualization"
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
LABEL org.opencontainers.image.description="A container for running ataqv for quality control results on atac sequencing data. Includes dependencies"

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="debian:9.8"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL keywords="debian, ${tool}, atac, qc, quality, genomics, bioinformatics, access, transposon"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    autoconf \
    build-essential \
    bzip2 \
    ca-certificates \
    curl \
    libboost-all-dev \
    libbz2-dev \
    liblzma-dev \
    libncurses5-dev \
    zlib1g-dev

# boost dependency from debian package libboost-all-dev

# htslib dependency from source. Debian libhts-dev package is old :(
RUN htslibVer="1.9" && \
    /usr/bin/curl \
      -L https://github.com/samtools/htslib/releases/download/${htslibVer}/htslib-${htslibVer}.tar.bz2 \
      -o "/usr/local/htslib-${htslibVer}.tar.bz2" && \
    cd "/usr/local" && \
    tar -jxvf "htslib-${htslibVer}.tar.bz2" && \
    rm "htslib-${htslibVer}.tar.bz2" && \
    cd "htslib-${htslibVer}" && \
    autoheader && \
    autoconf -Wno-syntax && \
    ./configure --prefix="/usr/local" && \
    make && \
    make install

# makefile not standard, have to specify standard lib location to use htslib
RUN /usr/bin/curl -L "${toolSource}" \
                  -o "/usr/local/ataqv-${toolVersion}.tar.gz" && \
    cd "/usr/local" && \
    tar -xvzf "ataqv-${toolVersion}.tar.gz" && \
    rm "ataqv-${toolVersion}.tar.gz" && \
    cd "ataqv-${toolVersion}" && \
    make HTSLIB_ROOT=/usr/local && \
    make install prefix=/usr/local

ENV LD_LIBRARY_PATH="/usr/local/lib":$LD_LIBRARY_PATH
