#!/bin/bash

log "INFO" "Executing DESKTOP"

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

# CUSTOMIZATION STEPS
source "$KANSO_REPO/customization/config-fish.sh"
source "$KANSO_REPO/customization/dotfiles.sh"
source "$KANSO_REPO/customization/ssh.sh"
source "$KANSO_REPO/customization/projects.sh"

log "SUCCESS" "Installed DESKTOP"
