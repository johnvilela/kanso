#!/bin/bash

log "INFO" "Installing Mise"

silent_log bash -c "wget -qO- https://mise.run | sh"

if [[ -f "$HOME/.local/bin/mise" ]]; then
    eval "$($HOME/.local/bin/mise activate bash)"
fi

if command_exists mise; then
    log "INFO" "Installing Node.js via Mise"
    silent_log mise install --yes node@lts
    silent_log mise use nodejs@lts --global

    log "SUCCESS" "Node installed"
fi
