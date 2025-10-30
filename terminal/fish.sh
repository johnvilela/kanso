#!/bin/bash

if command -v fish >/dev/null 2>&1; then
    FISH_PATH="$(command -v fish)"

    if ! grep -qF "$FISH_PATH" /etc/shells; then
        log "INFO" "Adding fish to /etc/shells"
        echo "$FISH_PATH" | sudo tee -a /etc/shells >/dev/null
    fi

    log "INFO" "Setting fish as default shell for $USER"

    if command -v chsh >/dev/null 2>&1; then
        sudo chsh -s "$FISH_PATH" "$USER" || true
    fi

    mkdir -p ~/.config/fish
fi
