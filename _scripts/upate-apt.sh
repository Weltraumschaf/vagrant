#!/usr/bin/env bash

set -eu

export DEBIAN_FRONTEND="noninteractive"

apt-get update
apt-get upgrade -y
