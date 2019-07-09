# NEWS

* ToolDockers added:
    + ataqv - 1.0.0, base debian:9.8
    + trimmomatic - 0.39
    + csaw-run - 0.0.1 - Includes executable script "csaw.Rscript".
* BaseDocker updated:
    + bioconductor: added explicity openssl and ca-certificates libraries.
    + ToolDockers affected: csaw.
    
# 0.0.2

* Added NEWS.md
* ToolDockers added:
    + fastqc - 0.11.8, base debian:9.8
    + samtools - 0.9, base debian:9.8
* ToolDockers modified:
    + bowtie2 - Added samtools (1.9) to container

# 0.0.1

* BaseDockers added:
    + bioconductor - 3.8, base rocker/r-ver:3.5.3
* ToolDockers added:
    + bowtie2 - 2.3.5, base debian:9.8
    + csaw - from bioconductor 3.8, base jefferys/bioconductor_latest
    + fastqc - 0.11.8, base debian:9.8
    + macs2 - 2.1.2.1, base python:2.7.16-stretch