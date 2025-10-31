#!/bin/bash

log "INFO" "Setting up uLauncher"

mkdir -p ~/.config/autostart/
cp "$KANSO_REPO/configs/ulauncher/ulauncher.desktop" ~/.config/autostart/ulauncher.desktop
gtk-launch ulauncher.desktop >/dev/null 2>&1
sleep 2
cp "$KANSO_REPO/configs/ulauncher/ulauncher.json" ~/.config/ulauncher/settings.json

log "SUCCESS" "uLauncher installed"
