#!/bin/bash

log "INFO" "Installing alacritty"

silent_log sudo apt-get install -yqq alacritty

mkdir -p ~/.config/alacritty

sudo cp "${REPO_ROOT}/configs/alacritty/alacritty-term.svg" /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install "${REPO_ROOT}/configs/alacritty/Alacritty.desktop"

sudo cp "${REPO_ROOT}/configs/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
sudo update-desktop-database

sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty

cd "${REPO_ROOT}"

log "SUCCESS" "Alacritty installed and configured"
