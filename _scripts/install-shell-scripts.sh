#!/usr/bin/env bash

set -euo pipefail

(
  mkdir -p "${HOME}/src"
  cd "${HOME}/src"
  git clone https://github.com/Weltraumschaf/shell-scripts.git
)

(cd "${HOME}/src/shell-scripts" && ./install.sh)
