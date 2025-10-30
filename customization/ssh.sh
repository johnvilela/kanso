#!/bin/bash

SSH_CUSTOM_DIR="$USER_SETUP_DIR/ssh"
SSH_TARGET_DIR="$HOME/.ssh"

if [[ -d "$SSH_CUSTOM_DIR" ]] && compgen -A file "$SSH_CUSTOM_DIR"/* >/dev/null; then
  if gum confirm "SSH configuration detected in '~/user-setup/ssh'. Do you want to link these files to ~/.ssh?"; then
    log "INFO" "Linking SSH files to ~/.ssh..."

    mkdir -p "$SSH_TARGET_DIR"

    for file in "$SSH_CUSTOM_DIR"/*; do
      [[ -e "$file" ]] || continue
      ln -sf "$file" "$SSH_TARGET_DIR/"
    done

    chmod 700 "$SSH_TARGET_DIR"
    chmod 600 "$SSH_TARGET_DIR"/* 2>/dev/null || true

    log "SUCCESS" "SSH files linked successfully to ~/.ssh"
  else
    log "WARN" "User chose to skip SSH linking"
  fi
else
  log "INFO" "No SSH files found in '~/user-setup/ssh', skipping"
fi