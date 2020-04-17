#!/usr/bin/env sh

set -eu

export DEBIAN_FRONTEND="noninteractive"

apt-get update
apt-get upgrade -y

VBoxClient --clipboard
VBoxClient --draganddrop
VBoxClient --display
VBoxClient --checkhostversion
VBoxClient --seamless
