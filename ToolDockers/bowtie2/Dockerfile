FROM debian:9.8

## Annotations
# Label schema from https://github.com/opencontainers/image-spec/blob/master/annotations.md
# and from https://github.com/BioContainers/specs/blob/master/container-specs.md
# Some labels are set via arguments from the build command line.

ARG buildVersion
ARG imageCreated

ARG toolVersion="2.3.5"
ARG toolSource="https://github.com/BenLangmead/bowtie2/releases/download/v${toolVersion}/bowtie2-${toolVersion}-linux-x86_64.zip"

LABEL tool="bowtie2"
LABEL toolVersion="${toolVersion}"
LABEL toolLicense="SPDX:GPL-3.0-or-later"
LABEL toolLicenseFile="/usr/local/bin/LICENSE"

LABEL brief="A fast and sensitive gapped read aligner"
LABEL title="${tool} - ${brief}"
LABEL description="A container for running the bowtie2 short read aligner. Includes the bowtie2, bowtie2-index and bowtie2-inspect wrappers, as well as the examples and documentation from the bowtie2 distribution in /usr/local/bin."
LABEL keywords="debian, ${tool}, aligner, genomics, bioinformatics"

LABEL buildAuthor="Stuart R. Jefferys <srj@unc.edu>"
LABEL buildMaintainer="Stuart R. Jefferys <srj@unc.edu>"
LABEL buildVendor="UNC - Lineberger"
LABEL buildSource="https://github.com/jefferys/Dockers/ToolDockers/${tool}"
LABEL buildLicense="SPDX:MIT"
LABEL buildLicenseFile="https://github.com/jefferys/Dockers/LICENSE"

LABEL imageTag="${toolVersion}_${buildVersion}"
LABEL imageSource="https://hub.docker.com/r/jefferys/${tool}"
LABEL imageCreated="${imageCreated}"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    perl \
    python \
    unzip

RUN /usr/bin/curl -L "${toolSource}" \
                  -o "/usr/local/${tool}.zip" && \
    /usr/bin/unzip -d "/usr/local" "/usr/local/${tool}.zip" && \
    rm "/usr/local/${tool}.zip" && \
    mv /usr/local/bowtie2-${toolVersion}-linux-x86_64/* "/usr/local/bin/" && \
    rmdir /usr/local/bowtie2-${toolVersion}-linux-x86_64
