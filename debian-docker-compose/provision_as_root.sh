#!/usr/bin/env sh

set -eu

export DEBIAN_FRONTEND="noninteractive"

# docker install
apt-get update
apt-get upgrade -y
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

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

# docker-compose install
curl -sSL \
    "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose

curl -sSL \
     "https://raw.githubusercontent.com/docker/compose/master/contrib/completion/bash/docker-compose" \
    -o /etc/bash_completion.d/docker-compose

# custom tools
apt-get install -y \
    cifs-utils \
    git \
    tmux
