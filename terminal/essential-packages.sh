#!/bin/bash

log "INFO" "Adding repositories"

PPAS=(
    "universe"
    "ppa:git-core/ppa"
    "ppa:agornostal/ulauncher"
)

if ! apt-cache policy fish | grep -q "Candidate.*[0-9]"; then
    PPAS+=("ppa:fish-shell/release-4")
fi

for ppa in "${PPAS[@]}"; do
    silent_log sudo add-apt-repository -y "$ppa"
done

log "INFO" "Updating and upgrading system packages"

silent_log sudo apt-get -q update
silent_log sudo apt-get -yq upgrade

log "INFO" "Installing essential packages"

PACKAGES=(
    # Build toolchain
    build-essential gcc g++ make automake autoconf pkg-config
    cmake ninja-build gettext unzip zip htop btop gpg libfontconfig1-dev
    libxcb-xfixes0-dev libxkbcommon-dev dbus-x11 pipx node-typescript typescript

    # Networking/tools
    curl git

    # Crypto/SSL
    libssl-dev

    # Shells/UX
    fish

    # Apps/runtime
    flatpak

    # Dev tools
    flameshot eza fzf bat tldr neovim

    # Gnome extensions
    gnome-tweak-tool gnome-sushi gnome-shell-extensions gnome-shell-extension-manager pipx
    ulauncher
)

silent_log sudo apt-get install -yq --no-install-recommends "${PACKAGES[@]}"

log "SUCCESS" "Essential packages installed"
