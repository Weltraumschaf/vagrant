#!/usr/bin/env bash

set -euo pipefail

# @see: http://wiki.bash-hackers.org/syntax/shellvars
[ -z "${SCRIPT_DIRECTORY:-}" ] \
  && SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

SCRIPT_DIR=$(dirname "${SCRIPT_DIRECTORY}")
PROJECT_DIR="/vagrant"
SCRIPT_DIR="${PROJECT_DIR}/_scripts"

# shellcheck source=lib.sh
source "${SCRIPT_DIR}/lib.sh"

# docker install
apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

add_apt_key "https://download.docker.com/linux/debian/gpg"
add_apt_source "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" "docker"

apt-get update
apt-get install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io
usermod -a -G docker vagrant
