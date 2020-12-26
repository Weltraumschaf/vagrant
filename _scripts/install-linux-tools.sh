#!/usr/bin/env bash

set -eu

export DEBIAN_FRONTEND="noninteractive"

# custom tools
apt-get install -y \
  git \
  htop \
  tree \
  tmux
