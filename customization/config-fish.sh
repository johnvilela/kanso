#!/bin/bash

DEFAULT_CONFIG="$KANSO_REPO/configs/config.fish"
CUSTOM_CONFIG="$USER_SETUP_DIR/configs/config.fish"

if [[ -f "$CUSTOM_CONFIG" ]]; then
    if gum confirm "A custom Fish config was found at ./custom/config.fish. Do you want to use it instead of the default?"; then
        log "INFO" "Using custom Fish configuration"
        sudo cp "$CUSTOM_CONFIG" ~/.config/fish/config.fish
    else
        log "INFO" "Using default Fish configuration"
        sudo cp "$DEFAULT_CONFIG" ~/.config/fish/config.fish
    fi
else
    log "INFO" "No custom Fish configuration found. Using default."
    sudo cp "$DEFAULT_CONFIG" ~/.config/fish/config.fish
fi
