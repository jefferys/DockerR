#!/bin/sh

# USAGE: build.sh <dockerDir>

imageMaintainer="Stuart R. Jefferys <srj@unc.edu>"
imageCreated="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"
read buildVersion < "../../VERSION"

context="."
name="picard"
toolVersion="2.21.1"
domain="jefferys"

fullName="${domain}/${name}"
imageTag="${toolVersion}_${buildVersion}"

docker build --build-arg toolVersion="${toolVersion}" \
             --build-arg buildVersion="${buildVersion}" \
             --build-arg imageCreated="${imageCreated}" \
             -t "${fullName}:${imageTag}" \
             -t "${fullName}:${toolVersion}_latest" \
             -t "${fullName}:latest" \
             "${context}"
