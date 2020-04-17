#!/usr/bin/env sh

set -eu

export DEBIAN_FRONTEND="noninteractive"
apt-get update
apt-get upgrade -y
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    tmux \
    git

# Install Docker
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

usermod -aG docker vagrant

# Install Docker Compose
curl -sSL "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
curl -sSL https://raw.githubusercontent.com/docker/compose/master/contrib/completion/bash/docker-compose \
    -o /etc/bash_completion.d/docker-compose

# Install Portainer.
mkdir ~/portainer
docker pull portainer/portainer
docker tag portainer/portainer portainer
export CONT_NAME="portainer"
docker run -d -p 9000:9000 \
    --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ~/portainer:/data \
    --name ${CONT_NAME} \
    portainer
