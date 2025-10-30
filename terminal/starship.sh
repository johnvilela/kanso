#!/bin/bash

if ! command -v starship &> /dev/null; then
  log "INFO" "Installing Starship"

  wget -qO- https://starship.rs/install.sh | sh -s -- -y >/dev/null 2>&1 || {
    log "ERROR" "Starship installation failed"
  }
  
  log "SUCCESS" "Starship installed"
fi