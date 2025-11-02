#!/bin/bash

log "INFO" "Installing GNOME extensions"

pipx install gnome-extensions-cli --system-site-packages >/dev/null 2>&1

if [[ -z "${DBUS_SESSION_BUS_ADDRESS:-}" ]]; then
    eval "$(dbus-launch --sh-syntax)"
fi

gum confirm "To install Gnome extensions, you need to accept some confirmations. Ready?"

if command -v gnome-extensions >/dev/null 2>&1; then
    gnome-extensions disable tiling-assistant@ubuntu.com
    gnome-extensions disable ubuntu-appindicators@ubuntu.com
    gnome-extensions disable ubuntu-dock@ubuntu.com
    gnome-extensions disable ding@rastersoft.com

    source "$KANSO_REPO/desktop/pop-shell.sh"

    gext install just-perfection-desktop@just-perfection
    gext install blur-my-shell@aunetx
    gext install undecorate@sun.wxg@gmail.com
    gext install AlphabeticalAppGrid@stuarthayhurst

    sudo cp ~/.local/share/gnome-shell/extensions/pop-shell\@system76.com/schemas/org.gnome.shell.extensions.pop-shell.gschema.xml /usr/share/glib-2.0/schemas/
    sudo cp ~/.local/share/gnome-shell/extensions/just-perfection-desktop\@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml /usr/share/glib-2.0/schemas/
    sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell\@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml /usr/share/glib-2.0/schemas/
    sudo cp ~/.local/share/gnome-shell/extensions/AlphabeticalAppGrid\@stuarthayhurst/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml /usr/share/glib-2.0/schemas/
    sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

    gsettings set org.gnome.shell.extensions.pop-shell tile-by-default true
    gsettings set org.gnome.shell.extensions.pop-shell smart-gaps true
    gsettings set org.gnome.shell.extensions.pop-shell snap-to-grid true
    gsettings set org.gnome.shell.extensions.pop-shell gap-inner 6
    gsettings set org.gnome.shell.extensions.pop-shell gap-outer 8
    gsettings set org.gnome.shell.extensions.pop-shell active-hint true
    gsettings set org.gnome.shell.extensions.pop-shell show-title false

    gsettings set org.gnome.shell.extensions.just-perfection animation 2
    gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
    gsettings set org.gnome.shell.extensions.just-perfection workspace true
    gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false
    gsettings set org.gnome.shell.extensions.just-perfection search false
    gsettings set org.gnome.shell.extensions.just-perfection window-preview-caption false
    gsettings set org.gnome.shell.extensions.just-perfection weather false
    gsettings set org.gnome.shell.extensions.just-perfection search false
    gsettings set org.gnome.shell.extensions.just-perfection dash-separator false
    gsettings set org.gnome.shell.extensions.just-perfection quick-settings-dark-mode false
    gsettings set org.gnome.shell.extensions.just-perfection quick-settings-night-light false
    gsettings set org.gnome.shell.extensions.just-perfection show-apps-button false
    gsettings set org.gnome.shell.extensions.just-perfection world-clock false
    gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false
    gsettings set org.gnome.shell.extensions.just-perfection window-picker-icon false
    gsettings set org.gnome.shell.extensions.just-perfection window-preview-caption false
    gsettings set org.gnome.shell.extensions.just-perfection window-preview-close-button false
    gsettings set org.gnome.shell.extensions.just-perfection ripple-box false
    gsettings set org.gnome.shell.extensions.just-perfection events-button false

    gsettings set org.gnome.shell.extensions.blur-my-shell.appfolder blur false
    gsettings set org.gnome.shell.extensions.blur-my-shell.lockscreen blur false
    gsettings set org.gnome.shell.extensions.blur-my-shell.screenshot blur false
    gsettings set org.gnome.shell.extensions.blur-my-shell.window-list blur false
    gsettings set org.gnome.shell.extensions.blur-my-shell.panel blur false
    gsettings set org.gnome.shell.extensions.blur-my-shell.overview blur true
    gsettings set org.gnome.shell.extensions.blur-my-shell.overview pipeline 'pipeline_default'
    gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock blur true
    gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock brightness 0.6
    gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock sigma 30
    gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock static-blur true
    gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock style-dash-to-dock 0

    log "SUCCESS" "Extensions installed and configured"
else
    log "WARN" "GNOME is not running or gnome-extensions not available, skipping extension setup."
fi
