FROM debian:9.8

ARG buildVersion
ARG imageCreated


ARG toolVersion="0.11.8"
ARG toolSource="https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v${toolVersion}.zip"
ARG tool="fastqc"
ARG brief="${tool} - A quality control analysis tool for high throughput sequencing data"
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
LABEL org.opencontainers.image.description="A container for running the fastqc quality control analysis program in batch mode. Does not work interactively. Generates an html report with images. Run `fastqc help` for instructions."

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="debian:9.8"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL keywords="debian, ${tool}, quality, qc, fastq, genomics, bioinformatics"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    default-jre \
    perl \
    unzip

RUN /usr/bin/curl -L "${toolSource}" \
                  -o "/usr/local/${tool}.zip" && \
    /usr/bin/unzip -d "/usr/local" "/usr/local/${tool}.zip" && \
    rm "/usr/local/${tool}.zip" && \
    chmod +x "/usr/local/FastQC/fastqc" && \
    ln -s "/usr/local/FastQC/fastqc" "/usr/local/bin/fastqc"