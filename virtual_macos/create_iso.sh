#!/usr/bin/env bash

# Create Installation ISO File
#
# Tutorial: https://www.howtogeek.com/289594/how-to-install-macos-sierra-in-virtualbox-on-windows-10/

# set -e
set -u

usage="Usage: `basename ${0}` <path/to/work_dir> <path/to/installer>"
work_dir="${1:-}"
installer="${2:-}"

if [ "${work_dir}" == "" ]; then
    echo "No work_dir given!"
    echo "${usage}"
    exit 1
fi

if [ "${installer}" == "" ]; then
    echo "No installer given!"
    echo "${usage}"
    exit 2
fi

mkdir -pv "${work_dir}"
hdiutil create -o "${work_dir}/HighSierra.cdr" -size 7316m -layout SPUD -fs HFS+J
hdiutil attach "${work_dir}/HighSierra.cdr.dmg" -noverify -nobrowse \
    -mountpoint /Volumes/install_build
asr restore -source "${installer}/Contents/SharedSupport/BaseSystem.dmg" \
    -target /Volumes/install_build -noprompt -noverify -erase
hdiutil detach /Volumes/OS\ X\ Base\ System
hdiutil convert "${work_dir}/HighSierra.cdr.dmg" -format UDTO -o "${work_dir}/HighSierra.iso"
mv "${work_dir}/HighSierra.iso.cdr" "${work_dir}/HighSierra.iso"
echo "Done :-)"
