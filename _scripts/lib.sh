#!/usr/bin/env bash

set -euo pipefail

add_apt_key() {
  local url="${1}"
  curl -fsSL "${url}" | apt-key add -
}

add_apt_source() {
  local src="${1}"
  local destination="${2}"
  echo "${src}" > "/etc/apt/sources.list.d/${destination}.list"
}
