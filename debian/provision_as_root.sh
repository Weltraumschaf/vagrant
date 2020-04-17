#!/usr/bin/env sh

set -eu

export DEBIAN_FRONTEND="noninteractive"

apt-get update
apt-get upgrade -y
apt-get install -y \
    locales \
    git \
    tmux \
    apt-file \
    build-essential \
    file \
    coreutils \
    man \
    ltrace \
    nano \
    gdb \
    curl
    
localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
