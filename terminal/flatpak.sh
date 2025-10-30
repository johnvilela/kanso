#!/bin/bash

log "INFO" "Configuring Flatpak with Flathub"

if command -v flatpak >/dev/null 2>&1; then
    silent_log sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
else
    log "ERROR" "flatpak not found (unexpected since it was requested). Skipping Flathub."
fi

if command_exists flatpak; then
    log "INFO" "Installing Flatpak applications"

    FLATPAK_APPS=(
        "dev.zed.Zed"
        "io.neovim.nvim"
        "md.obsidian.Obsidian"
        "app.zen_browser.zen"
        "org.mozilla.Thunderbird"
    )

    for app in "${FLATPAK_APPS[@]}"; do
        if ! flatpak list | grep -q "$app"; then
            log "INFO" "Installing $app via Flatpak..."
            silent_log sudo flatpak install -y --noninteractive flathub "$app"
        else
            log "WARN" "$app is already installed, skipping."
        fi
    done

    log "SUCCESS" "Flatpak installed and configured"
else
    log "ERROR" "Flatpak not found, skipping Flatpak applications installation."
fi
