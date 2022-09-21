#! /usr/bin/env bash
set -euo pipefail
pushd "$(dirname "$0")" >/dev/null

bash ../prepare_buildx.sh

TAG="${1:?}"
shift

# don't forget to call with --push
docker buildx build \
    --pull \
    --tag brewblox/dockeragent:"$TAG" \
    --platform linux/arm/v7,linux/arm64/v8 \
    "$@" \
    .
