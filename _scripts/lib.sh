#!/usr/bin/env bash

set -euo pipefail

##
## Varaibles:
##

if [[ "$(lsb_release -si)" == "Debian" ]]; then
  export DEBIAN_FRONTEND="noninteractive"
fi

LOG_PREFIX="VAGRANT "

##
## Functions:
##

log() {
    if (( $# == 1 )); then
        echo "${LOG_PREFIX} Script: ${1}"
    else
        error "Unexpected number ($#) of arguments given to log()! Expecyed is one."
        exit 1
    fi
}

error() {
    if (( $# == 1 )); then
        echo "${LOG_PREFIX} Error: ${1}"
    else
        error "Unexpected number ($#) of arguments given to log()! Expecyed is one."
        exit 1
    fi
}

add_apt_key() {
  local url="${1}"
  curl -fsSL "${url}" | apt-key add -
}

add_apt_source() {
  local src="${1}"
  local destination="${2}"
  echo "${src}" > "/etc/apt/sources.list.d/${destination}.list"
}
