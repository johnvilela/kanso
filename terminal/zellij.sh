#!/bin/bash

log "INFO" "Installing zellij"

cd /tmp

ZELLIJ_URL="https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
wget -qO zellij.tar.gz "$ZELLIJ_URL"
tar -xzf zellij.tar.gz
sudo mv zellij /usr/local/bin/
rm zellij.tar.gz

cd -

log "SUCCESS" "Zellij installed"