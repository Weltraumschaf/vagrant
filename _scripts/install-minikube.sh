#!/usr/bin/env bash

set -euo pipefail

# @see: http://wiki.bash-hackers.org/syntax/shellvars
[ -z "${SCRIPT_DIRECTORY:-}" ] \
  && SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

SCRIPT_DIR=$(dirname "${SCRIPT_DIRECTORY}")
PROJECT_DIR="/vagrant"
SCRIPT_DIR="${PROJECT_DIR}/_scripts"

# shellcheck source=lib.sh
source "${SCRIPT_DIR}/lib.sh"

log "Executing '${0}' in ${SCRIPT_DIRECTORY} ..."
log "Installing Minikube ..."

MINIKUBE_DEB_FILE="minikube_latest_amd64.deb"
MINIKUBE_DEB_PATH="${HOME}/${MINIKUBE_DEB_FILE}"

cleanup() {
  rm -rfv "${MINIKUBE_DEB_PATH}"
}

# Cleanup stuff on normal exit and interuption.
trap cleanup EXIT
trap cleanup INT

# Install kubectl (https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-using-native-package-management)
add_kubectl_apt_source() {
  add_apt_key "https://packages.cloud.google.com/apt/doc/apt-key.gpg"
  add_apt_source "deb https://apt.kubernetes.io/ kubernetes-xenial main" "kubernetes"
}

# https://helm.sh/docs/intro/install/
add_helm_apt_source() {
  add_apt_key "https://baltocdn.com/helm/signing.asc"
  add_apt_source "deb https://baltocdn.com/helm/stable/debian/ all main" "helm"
}

add_apt_key() {
  local url="${1}"
  curl -fsSL "${url}" | apt-key add -
}

add_apt_source() {
  local src="${1}"
  local destination="${2}"
  echo "${src}" > "/etc/apt/sources.list.d/${destination}.list"
}

# Install minikube (https://minikube.sigs.k8s.io/docs/start/)
donwload_and_install_minikube() {
  curl -sSLo "${MINIKUBE_DEB_PATH}" "https://storage.googleapis.com/minikube/releases/latest/${MINIKUBE_DEB_FILE}"
  dpkg -i "${MINIKUBE_DEB_PATH}"
}

add_kubectl_apt_source
add_helm_apt_source

apt-get update
apt-get install -y \
  kubectl \
  helm

donwload_and_install_minikube

