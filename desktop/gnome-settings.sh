#!/bin/bash

log "INFO" "Adding better settings"

gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono Nerd Font 10'

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

gsettings set org.gnome.mutter center-new-windows true

gsettings set org.gnome.desktop.calendar show-weekdate true

gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false