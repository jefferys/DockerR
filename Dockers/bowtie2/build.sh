#!/bin/sh

# USAGE: build.sh <dockerDir>

imageMaintainer="Stuart R. Jefferys <srj@unc.edu>"
imageCreated="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"
read buildVersion < "../../VERSION"

context="."
name="bowtie2"
toolVersion="2.3.5"
domain="jefferys"

fullName="${domain}/${name}"
imageTag="${toolVersion}_${buildVersion}"

docker build --build-arg toolVersion="${toolVersion}" \
             --build-arg buildVersion="${buildVersion}" \
             --build-arg imageCreated="${imabgeCreated}" \
             -t "${fullName}:${imageTag}" \
             -t "${fullName}:${toolVersion}_latest" \
             -t "${fullName}:latest" \
             "${context}"
