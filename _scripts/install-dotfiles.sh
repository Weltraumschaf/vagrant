#!/usr/bin/env sh

set -eu

(
    mkdir -p "${HOME}/src"
    cd "${HOME}/src"
    git clone https://github.com/Weltraumschaf/dotfiles.git
)

(cd "${HOME}/src/dotfiles" && ./install.sh)
