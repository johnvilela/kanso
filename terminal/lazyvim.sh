#!/bin/bash

log "INFO" "Installing LazyVim"

silent_log git clone -q https://github.com/LazyVim/starter ~/.config/nvim

log "SUCCESS" "Lazyvim installed"