FROM debian:9.8

ARG buildVersion
ARG imageCreated

ARG toolVersion="2.3.5"
ARG samtoolsVersion="1.9"
ARG toolSource="https://github.com/BenLangmead/bowtie2/releases/download/v${toolVersion}/bowtie2-${toolVersion}-linux-x86_64.zip"
ARG samtoolsSource="https://github.com/samtools/samtools/releases/download/${samtoolsVersion}/samtools-${samtoolsVersion}.tar.bz2"
ARG tool="bowtie2"
ARG brief="${tool} - A fast and sensitive gapped read aligner"
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
LABEL org.opencontainers.image.description="A container for running the bowtie2 short read aligner. Includes the bowtie2, bowtie2-index and bowtie2-inspect wrappers, as well as the examples and documentation from the bowtie2 distribution in /usr/local/bin. Also includes samtools (v${samtoolsVersion})."

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

RUN /usr/bin/curl -L "${toolSource}" \
                  -o "/usr/local/${tool}.zip" && \
    /usr/bin/unzip -d "/usr/local" "/usr/local/${tool}.zip" && \
    rm "/usr/local/${tool}.zip" && \
    mv /usr/local/bowtie2-${toolVersion}-linux-x86_64/* "/usr/local/bin/" && \
    rmdir /usr/local/bowtie2-${toolVersion}-linux-x86_64

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
