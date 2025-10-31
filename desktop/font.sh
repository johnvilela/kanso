#!/bin/bash

log "INFO" "Installing JetBrains Mono"

mkdir -p ~/.local/share/fonts

cd /tmp
wget -q -O JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -q JetBrainsMono.zip -d JetBrainsMono
mkdir -p ~/.local/share/fonts
cp JetBrainsMono/*.ttf ~/.local/share/fonts
rm -rf JetBrainsMono.zip JetBrainsMono

(fc-cache -f >/dev/null 2>&1) &
disown

log "SUCCESS" "JetBrains Mono installed"

cd -
