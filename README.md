# Dockers

Dockers for the bioinformatics tools I use. These are divided into the following groups (by directory).

* **ToolDockers** - Dockers that are wrappers around a (single distro) tool.
* **BaseDockers** - Dockers that are designed to be used as a base for other Dockers.

## Licensings

The contents of this repository are licensed under the MIT license, included as `LICENSE`, except as noted otherwise.

## Building

To build, clone the repo, `cd` to the docker directory of your choice, and run the `build.sh` script.

```
git clone "https://github.com/jefferys/Dockers.git"
cd Dockers/ToolDockers/<tool>
./build.sh
```

The Dockers built from the `BaseDockers` directory are used as a base for one or more Dockerfiles included in this repo. All dependent Dockers should be rebuilt when a base is changed, but the base must be rebuilt first.

```
git clone "https://github.com/jefferys/Dockers.git"
cd Dockers/BaseDockers/<base>
./build.sh
cd ../../ToolDockers/<tool>
./build.sh
cd ../<tool2>
./build.sh
...
```

## Pushing to DockerHub

To push to `<user>` at `https://hub.docker.com/r/<user>` (assumes user already exists there)

```
docker login -u <user>
# for each tag
docker push <user>/<tool>:<tag>
docker logout
```

## Using DockerHub dockers

You can pull a remote DockerHub image with

```
docker pull <user>/<tool>:<tag>
```

It will be pulled automatically if you use it and it is not local, e.g.

```
docker run <user>/<tool>:<tag>
```
