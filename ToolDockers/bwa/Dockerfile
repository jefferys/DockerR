FROM debian:9.8

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
    python \
    unzip \
    zlib1g-dev

ARG buildVersion
ARG imageCreated

ARG toolVersion="0.7.17"
ARG samtoolsVersion="1.9"
ARG tool="bwa"

ARG toolSource="https://github.com/lh3/bwa/releases/download/v${toolVersion}/bwa-${toolVersion}.tar.bz2"
ARG samtoolsSource="https://github.com/samtools/samtools/releases/download/${samtoolsVersion}/samtools-${samtoolsVersion}.tar.bz2"
ARG brief="${tool} - Fast and accurate read alignment with Burrows-Wheeler transform"
ARG toolLicense="GPL-3.0"

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
LABEL org.opencontainers.image.description="BWA is a software package for mapping DNA sequences against a large reference genome, such as the human genome. Also includes samtools (v${samtoolsVersion})."

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="debian:9.8"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL keywords="debian, ${tool}, aligner, genomics, bioinformatics"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"

RUN /usr/bin/curl -L "${toolSource}" \
                  -o "/usr/local/${tool}-${toolVersion}.tar.bz2" && \
    cd "/usr/local/" && \
    tar -xvjf "${tool}-${toolVersion}.tar.bz2" && \
    rm "${tool}-${toolVersion}.tar.bz2" && \
    ln -s "${tool}-${toolVersion}" "${tool}" && \
    cd "${tool}" && \
    make && \
    cd "../"

ENV PATH="/usr/local/${tool}:${PATH}"

RUN /usr/bin/curl -L "${samtoolsSource}" \
                  -o "/usr/local/samtools-${samtoolsVersion}.tar.bz2" && \
    cd "/usr/local" && \
    tar -jxvf "samtools-${samtoolsVersion}.tar.bz2" && \
    rm "samtools-${samtoolsVersion}.tar.bz2" && \
    cd "samtools-${samtoolsVersion}" && \
    autoheader && \
    autoconf -Wno-syntax && \
    ./configure --prefix="/usr/local" && \
    make && \
    make install
