#!/bin/bash

log "INFO" "Installing Yaak"

cd /tmp
wget -qO yaak_2025.5.6_amd64.deb https://github.com/mountain-loop/yaak/releases/download/v2025.5.6/yaak_2025.5.6_amd64.deb
$SUDO dpkg -i yaak_2025.5.6_amd64.deb >/dev/null 2>&1
rm yaak_2025.5.6_amd64.deb
cd -

log "SUCCESS" "Yaak installed and configured"
