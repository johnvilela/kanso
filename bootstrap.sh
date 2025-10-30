#!/bin/bash

set -Eeuo pipefail

trap 'log "ERROR" "Script failed at line $LINENO. Check the log file or run the install commands again"; exit 1' ERR

KANSO_REPO="${KANSO_REPO:-$HOME/.local/share/kanzo}"

source "$KANSO_REPO/check-os.sh"

source "$KANSO_REPO/required/gum.sh"

source "$KANSO_REPO/utils.sh"

if [[ " $* " == *" --simple"* ]]; then
    source "$KANSO_REPO/simple.sh"
else
    source "$KANSO_REPO/desktop.sh"
fi

if gum confirm "Do you want to reboot the machine now?"; then
    sudo reboot
fi
