#!/usr/bin/env sh

set -eu

export DEBIAN_FRONTEND="noninteractive"

# custom tools
apt-get install -y \
    cifs-utils \
    git \
    htop \
    tree \
    tmux
