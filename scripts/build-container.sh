#!/bin/bash
# container build script for api
#

function die { [ -n "$1" ] && echo "ERROR: $1"; exit 1; }

# set the container domain/name and the version to the git branch name
DOMAIN="rakutenrbl"
APP="multichain-peer"
VERSION=$(git rev-parse --abbrev-ref HEAD)

# run docker build
echo "Building ${DOMAIN}/${APP}:${VERSION}"
docker build -t ${DOMAIN}/${APP}:${VERSION} .
[ $? -eq 0 ] || die 'build failure';

docker tag ${DOMAIN}/${APP}:${VERSION} ${DOMAIN}/${APP}:latest
docker images ${DOMAIN}/${APP}

echo

echo 'Done'
exit 0