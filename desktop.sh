#!/bin/bash

log "INFO" "Executing DESKTOP"

source "$KANSO_REPO/terminal/exec.sh"
source "$KANSO_REPO/terminal/flatpak.sh"
source "$KANSO_REPO/apps/docker.sh"
source "$KANSO_REPO/customization/exec.sh"

log "SUCCESS" "Installed DESKTOP"
