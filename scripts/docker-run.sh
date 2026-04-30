#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKSPACE_DIR="${PROJECT_DIR}/ws"
IMAGE_NAME="yocto-intins"

mkdir -p ${WORKSPACE_DIR}

docker run -it --rm \
    --device=/dev/kvm:/dev/kvm \
    --device=/dev/net/tun:/dev/net/tun \
    --cap-add NET_ADMIN \
    --hostname buildserver \
    -v "${WORKSPACE_DIR}:/home/intins/ws" \
    "${IMAGE_NAME}"

