#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKSPACE_DIR="${PROJECT_DIR}/ws"
SSTATE_CACHE="${PROJECT_DIR}/sstate-cache"
DOWNLOAD_DIR="${PROJECT_DIR}/downloads"
IMAGE_NAME="yocto-intins"

mkdir -p ${WORKSPACE_DIR}
mkdir -p ${SSTATE_CACHE}
mkdir -p ${DOWNLOAD_DIR}

docker run -it --rm \
    --device=/dev/kvm:/dev/kvm \
    --device=/dev/net/tun:/dev/net/tun \
    --cap-add NET_ADMIN \
    --hostname buildserver \
    -v "${SSTATE_CACHE}:/home/intins/sstate-cache" \
    -v "${DOWNLOAD_DIR}:/home/intins/downloads" \
    -v "${WORKSPACE_DIR}:/home/intins/ws" \
    "${IMAGE_NAME}"

