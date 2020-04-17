#!/usr/bin/env sh

set -eu

(
    mkdir -p "${HOME}/src"
    cd "${HOME}/src"
    git clone https://github.com/Weltraumschaf/dotfiles.git
    git clone https://github.com/Weltraumschaf/shell-scripts.git
)

(cd "${HOME}/src/dotfiles" && ./install.sh)

(cd "${HOME}/src/shell-scripts" && ./install.sh)
