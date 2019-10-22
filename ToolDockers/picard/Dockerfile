FROM rocker/r-ver:3.6.1

# Up front as args break caching, even if not changed!
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    default-jre

ARG toolVersion="2.21.1"
ARG toolSource="https://github.com/broadinstitute/picard/releases/download/{$toolVersion}/picard.jar"
ARG tool="picard"
ARG buildVersion
ARG brief="${tool} - Java CLI tools for manipulating high-throughput sequencing data and formats"
# License abbreviation from spdx.org version 2.1 specification
# SPDX-License-Identifier: MIT
ARG toolLicense="MIT"
ARG imageCreated

ENV PICARD_JAR="/usr/local/picard.jar"

RUN /usr/bin/curl -L "${toolSource}" \
                  -o "/usr/local/picard-${toolVersion}.jar" && \
    ln -s "/usr/local/picard-${toolVersion}.jar" "${PICARD_JAR}"

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="rocker/r-ver:3.6.1"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL about.tags="debian, picard, java, R, HTS, toolkit"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"

# From https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.authors="Stuart R. Jefferys <srj@unc.edu>"
LABEL org.opencontainers.image.url="https://hub.docker.com/r/jefferys/${tool}"
LABEL org.opencontainers.image.source="https://github.com/jefferys/Dockers/ToolDockers/${tool}"
LABEL org.opencontainers.image.version="${toolVersion}"
LABEL org.opencontainers.image.vendor="UNC - Lineberger"
LABEL org.opencontainers.image.licenses="${toolLicense}"
LABEL org.opencontainers.image.ref.name="${tool}:${toolVersion}_${buildVersion}"
LABEL org.opencontainers.image.title="${brief}"
LABEL org.opencontainers.image.description="Picard is a set of command line tools for manipulating high-throughput sequencing (HTS) data and formats such as SAM/BAM/CRAM and VCF. These file formats are defined in the Hts-specs repository (http://samtools.github.io/hts-specs/)."

LABEL org.opencontainers.image.created="${imageCreated}"

