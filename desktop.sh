#!/bin/bash

log "INFO" "Executing DESKTOP"

gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# TERMINAL STEPS
source "$KANSO_REPO/terminal/essential-packages.sh"
source "$KANSO_REPO/terminal/fish.sh"
source "$KANSO_REPO/terminal/zellij.sh"
source "$KANSO_REPO/terminal/lazygit.sh"
source "$KANSO_REPO/terminal/lazydocker.sh"
source "$KANSO_REPO/terminal/lazyvim.sh"
source "$KANSO_REPO/terminal/mise.sh"
source "$KANSO_REPO/terminal/starship.sh"
source "$KANSO_REPO/terminal/flatpak.sh"

# APPS STEPS
source "$KANSO_REPO/apps/docker.sh"
source "$KANSO_REPO/apps/alacritty.sh"
source "$KANSO_REPO/apps/yaak.sh"
source "$KANSO_REPO/apps/openfortivpn.sh"

# CUSTOMIZATION STEPS
source "$KANSO_REPO/customization/config-fish.sh"
source "$KANSO_REPO/customization/dotfiles.sh"
source "$KANSO_REPO/customization/ssh.sh"
source "$KANSO_REPO/customization/projects.sh"

# DESKTOP STEP
source "$KANSO_REPO/desktop/gnome-settings.sh"
source "$KANSO_REPO/desktop/ulauncher.sh"
source "$KANSO_REPO/desktop/font.sh"

gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

log "SUCCESS" "Installed DESKTOP"
