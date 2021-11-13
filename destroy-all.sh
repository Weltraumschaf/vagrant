#!/usr/bin/env bash

set -ueo pipefail

for dir in $(ls -1); do
  if [[ ! -d "${dir}" ]]; then
    continue
  fi

  if [[ "${dir}" =~ ^_.* ]]; then
    continue
  fi

  if [[ ! -f "${dir}/Vagrantfile" ]]; then
    continue
  fi
  
  (cd "${dir}" && vagrant destroy -f)
done
