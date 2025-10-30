#!/bin/bash

log "INFO" "Installing Mise"

silent_log curl https://mise.run | sh

if [[ -f "$HOME/.local/bin/mise" ]]; then
    eval "$($HOME/.local/bin/mise activate bash)"
fi

if command_exists mise; then
    log "INFO" "Installing Node.js via Mise"
    silent_log mise install --yes nodejs@20.19.0
    silent_log mise use nodejs@20.19.0 --global

    echo 'mise activate fish | source' >>~/.config/fish/config.fish
fi
