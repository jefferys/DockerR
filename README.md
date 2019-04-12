# DockerR

Dockers for R, Bioconductor, and tools based on them.

## Licensing

The contents of this repository are licensed under the MIT license, included as LICENSE, except as noted otherwise.

**[TODO]** - Everything below here is a description of the goal for this project, in progress and not complete.

## Features

* Self contained docker contexts that can be built with simple `docker build` commands
* Context-specific `build.sh` scripts that allow building and tagging images locally in a consistent way.
* Distro-specific sub-directories that allow building some dockers with a choice of base distros.
* Separate tree of dockers to isolate those that need proprietary local content to build.
* Tools that allow managing a large collection of docker files such as this.

## Repository Structure

* **`Docker/`** - The base directory of docker builds.

    This contains the docker build context directories, one per tool/image. Each context is self contained and can be used to `docker build` an image.

* **`LocalDocker/`** - The base directory for dockers that require local resources.

    This contains the rare docker build context that needs additional local resources to build. For example, if a tool expects proprietary libraries that can not just be downloaded to be installed, they must be provided locally before the container that needs them can be built. See the specific context for details.

* **`Dev/` ** - A directory that contains tools for managing this repo.

    In order to automate maintenance of this collection, some tools are used by the developers. These tools are provided in `Dev/`. Nothing here is needed to use or build any container, but they provide convenience features such as automated tagging of built local images.

## The `Docker/<name>` directories

The main purpose of a `Docker/<name>` directory is to serve as a build context for an image. To build a local image, get/clone the context directory locally and run the normal docker build command.


```
docker build "path/to/<name>/" [--tag <name>:<tag>]*
```

To simplify automation of container builds, the container directory contains a `build.sh` script that can be used to build and tag the image. This is used like

```
cd "path/to/<name>"
./build.sh
```

This builds the image and the following aliases

* `<name>:latest`, where `<name>` is the directory.
* `<alias>:latest`, if `<name>` is long.
* `<name>:<toolVersion>_latest`, where `<toolVersion>` is the version of the tool or software that the container mainly provides
* `<name>:<toolVersion>_<buildVersion>`, where `<buildVersion>` is the version of the build file (this repository).

## Running `Dev/build.sh`


