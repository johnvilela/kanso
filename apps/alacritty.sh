#!/bin/bash

log "INFO" "Installing alacritty"

silent_log sudo apt-get install -yqq alacritty

mkdir -p ~/.config/alacritty

sudo cp "$KANSO_REPO/configs/alacritty/alacritty-term.svg" /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install "$KANSO_REPO/configs/alacritty/Alacritty.desktop"

sudo cp "$KANSO_REPO/configs/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
sudo update-desktop-database

sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty

cd "$KANSO_REPO"

log "SUCCESS" "Alacritty installed and configured"
