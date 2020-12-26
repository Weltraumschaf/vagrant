#!/usr/bin/env bash

set -euo pipefail

export DEBIAN_FRONTEND="noninteractive"

# custom tools
apt-get install -y \
  git \
  htop \
  tree \
  tmux
