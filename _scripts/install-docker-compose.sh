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
log "Installing Docker Compose ..."

# docker-compose install
curl -sSL \
  "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose

chmod a+x /usr/local/bin/docker-compose

curl -sSL \
  "https://raw.githubusercontent.com/docker/compose/master/contrib/completion/bash/docker-compose" \
  -o /etc/bash_completion.d/docker-compose
