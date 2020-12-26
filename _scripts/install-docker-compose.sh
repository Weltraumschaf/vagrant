#!/usr/bin/env bash

set -eu

# docker-compose install
curl -sSL \
  "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose

chmod a+x /usr/local/bin/docker-compose

curl -sSL \
  "https://raw.githubusercontent.com/docker/compose/master/contrib/completion/bash/docker-compose" \
  -o /etc/bash_completion.d/docker-compose
