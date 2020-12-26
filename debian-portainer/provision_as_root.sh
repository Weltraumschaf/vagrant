#!/usr/bin/env bash

set -euo pipefail

# Install Portainer.
mkdir ~/portainer
docker pull portainer/portainer
docker tag portainer/portainer portainer
export CONT_NAME="portainer"
docker run -d -p 9000:9000 \
  --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ~/portainer:/data \
  --name ${CONT_NAME} \
  portainer
