FROM python:2.7.16-stretch

ARG buildVersion
ARG imageCreated

ARG toolVersion="2.1.2.1"
ARG toolSource="https://pypi.org/project/MACS2/"
ARG tool="macs2"
ARG brief="${tool} - Model-based Analysis of ChIP-Seq"
ARG toolLicense="BSD-3-Clause"

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
LABEL org.opencontainers.image.description="MACS2 is a bioinformatics algorithm to analyze ChIP-seq datasets. MACS empirically models the shift size of ChIP-Seq tags, and uses it to improve the spatial resolution of predicted binding sites. MACS also uses a dynamic Poisson distribution to effectively capture local biases in the genome, allowing for more robust predictions."

# https://github.com/BioContainers/specs/blob/master/container-specs.md
LABEL base_image="python:2.7.16-stretch"
LABEL version="${buildVersion}"
LABEL software.version="${toolVersion}"
LABEL software="${tool}"
LABEL about.summary="${brief}"
LABEL about.home="${toolSource}"
LABEL about.license="${toolLicense}"
LABEL about.tags="debian, python, macs2, chip-seq, peak calling"
LABEL maintainer="Stuart R. Jefferys <srj@unc.edu>"

RUN pip install numpy==1.16.2 \
 && pip install MACS2==2.1.2.1
