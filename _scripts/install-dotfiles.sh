#!/usr/bin/env bash

set -euo pipefail

# @see: http://wiki.bash-hackers.org/syntax/shellvars
[ -z "${SCRIPT_DIRECTORY:-}" ] \
  && SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

BASE_DIR=$(dirname "${SCRIPT_DIRECTORY}")
# shellcheck source=lib.sh
source "${BASE_DIR}/_scripts/lib.sh"

(
  mkdir -p "${HOME}/src"
  cd "${HOME}/src"
  git clone https://github.com/Weltraumschaf/dotfiles.git
)

(cd "${HOME}/src/dotfiles" && ./install.sh)
