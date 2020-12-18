#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WORKDIR="/work"
IMAGE="bs-js-cli"
CONTAINER="${IMAGE}-${1}"

docker rm -f "$CONTAINER" > /dev/null 2>&1 || true

docker run --rm -ti \
           --log-driver=none \
           -u "$(id -u):$(id -g)" \
           --net=host \
           -e "HOME=${WORKDIR}" \
           -v "${SCRIPTDIR}:${WORKDIR}" \
           -w "${WORKDIR}" \
           --name "$CONTAINER" \
           "${IMAGE}:local" "$@"
