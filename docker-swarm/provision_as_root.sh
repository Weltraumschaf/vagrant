#!/usr/bin/env sh

set -eu

export DEBIAN_FRONTEND="noninteractive"

apt-get update
apt-get upgrade -y
apt-get install -y \
    avahi-daemon \
    libnss-mdns \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    tmux \
    git

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"
apt-get update
apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io
