FROM debian:9.8

ARG buildVersion
ARG imageCreated
ARG toolVersion
ARG tool

ARG toolSource="http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-${toolVersion}.zip"
ARG brief="${tool} - A flexible trimmer for Illumina Sequence Data."
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
LABEL org.opencontainers.image.description="Trims adaptors and removes low quality sequence from reads in fastq files. Works with single and paired end fastqs. Includes files with adaptors for Illumina's GAII TruSeq2 (SE and PE), Illuminals HiSeq/MiSeq TruSeq3 (SE and PE), and for Nextera transposase adaptors (PE only). Jarfile to be run is \$TRIMMOMATIC, e.g. run like \"java -jar \$TRIMMOMATIC\". Adaptor files are in \$ADAPTER_DIR."

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="debian:9.8"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL keywords="debian, ${tool}, adaptor trim, quality trim, fastq, genomics, bioinformatics"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    default-jre \
    unzip

# Differs between "Trimmomatic"" for directory and "trimmomatic" for jar name.

ENV TRIMMOMATIC="/usr/local/Trimmomatic-${toolVersion}/${tool}-${toolVersion}.jar"
ENV ADAPTER_DIR="/usr/local/Trimmomatic-${toolVersion}/adapters"
RUN /usr/bin/curl -L "${toolSource}" \
                  -o "/usr/local/${tool}.zip" && \
    /usr/bin/unzip -d "/usr/local" "/usr/local/${tool}.zip" && \
    rm "/usr/local/${tool}.zip"