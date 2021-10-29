#!/usr/bin/env bash
set -exuo pipefail
pushd "$(dirname "$0")" > /dev/null

TAG=${1:?}

docker buildx build  \
    --tag brewblox/omgwtfssl:"${TAG}" \
    --push \
    --platform linux/amd64,linux/arm/v7,linux/arm64/v8 \
    .
