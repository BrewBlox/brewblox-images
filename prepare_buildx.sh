#!/usr/bin/env bash
set -ex

BUILDX_URL=https://github.com/docker/buildx/releases/download/v0.4.1/buildx-v0.4.1.linux-amd64

curl -L -o ~/.docker/cli-plugins/docker-buildx --create-dirs ${BUILDX_URL}
chmod a+x ~/.docker/cli-plugins/docker-buildx
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx create --use
docker buildx inspect --bootstrap
