# Dockers

Dockers for the bioinformatics tools I use.

* **ToolDockers** Dockers that are wrappers around a (single distro) tool.
* **BaseDockers** Dockers that are designed to be used as a base for other Dockers.

## Licensing

The contents of this repository are licensed under the MIT license, included as LICENSE, except as noted otherwise.

## Building

To build, clone the repo, cd to the docker context directory, and run the build.sh script

```
git clone "https://github.com/jefferys/Dockers.git"
cd <repo>/ToolDockers/<tool>
./build.sh
```

If you want to use a newley built base for other Dockers, that requires changing those dockers Dockerfiles and rebuilding.

## Pushing to DockerHub

To push to <user> at https://hub.docker.com/r/<user> (assumes repository already created there)

```
docker login -u <user>
# for each tag
docker push <user>/<tool>:<tag>
docker logout
```

**[TODO]** - Figure out how to automate pulling these.
