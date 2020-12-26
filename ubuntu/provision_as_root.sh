#!/usr/bin/env bash

set -euo pipefail

export DEBIAN_FRONTEND="noninteractive"

apt-get install -y --no-install-recommends \
  lubuntu-desktop

VBoxClient --clipboard
VBoxClient --draganddrop
VBoxClient --display
VBoxClient --checkhostversion
VBoxClient --seamless
