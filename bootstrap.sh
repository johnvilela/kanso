#!/bin/bash

set -Eeuo pipefail

trap 'log "ERROR" "Script failed at line $LINENO. Check the log file or run the install commands again"; exit 1' ERR

KANSO_REPO="${KANSO_REPO:-$HOME/.local/share/kanso}"
USER_SETUP_DIR="$HOME/user-setup"

source "$KANSO_REPO/check-os.sh"

source "$KANSO_REPO/required/gum.sh"

source "$KANSO_REPO/utils.sh"

if [ ! -d "$USER_SETUP_DIR" ] || [ -z "$(ls -A "$USER_SETUP_DIR" 2>/dev/null)" ]; then
    if gum confirm "We see that you have no 'user-setup'. Do you want to setup default files at '~/user-setup/' first to make your life easier?"; then
        log "INFO" "Check the 'user-setup' docs for more details: https://your-docs-url-here"
        exit 0
    fi
fi

if [[ " $* " == *" --simple"* ]]; then
    source "$KANSO_REPO/simple.sh"
else
    source "$KANSO_REPO/desktop.sh"
fi

if gum confirm "Do you want to reboot the machine now?"; then
    sudo reboot
fi
