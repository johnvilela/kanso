#!/bin/bash

DOTFILES_DIR="$USER_SETUP_DIR/dotfiles"

if [[ -d "$DOTFILES_DIR" ]] && compgen -A file "$DOTFILES_DIR"/.[!.]* "$DOTFILES_DIR"/* >/dev/null; then
    if gum confirm "Dotfiles detected in 'custom/dotfiles'. Do you want to link them to your home directory?"; then
        log "INFO" "Linking dotfiles to home directory..."

        for file in "$DOTFILES_DIR"/.[!.]* "$DOTFILES_DIR"/*; do
            [[ -e "$file" ]] || continue
            ln -sf "$file" "$HOME/"
        done

        log "SUCCESS" "Dotfiles linked successfully"
    else
        log "WARN" "User chose not to link dotfiles"
    fi
else
    log "INFO" "No dotfiles found in 'custom/dotfiles', skipping"
fi
