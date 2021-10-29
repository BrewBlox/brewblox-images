#!/usr/bin/env bash
set -exuo pipefail
pushd "$(dirname "$0")" > /dev/null

TAG=${1:?}
COMMIT="44a4a43cad5c8e4b47044499d7173301f8343cba"

docker buildx build \
    --tag brewblox/mdns-reflector:"${TAG}" \
    --push \
    --platform linux/amd64,linux/arm/v7,linux/arm64/v8 \
    git@github.com:vfreex/mdns-reflector.git#"${COMMIT}"
