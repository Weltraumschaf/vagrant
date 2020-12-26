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

log "Executing '${0}' in ${SCRIPT_DIRECTORY} ..."
log "Updating Apt ..."

apt-get update
apt-get upgrade -y
