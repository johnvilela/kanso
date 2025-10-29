#!/bin/bash

cd /tmp
wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/download/v0.17.0/gum_0.17.0_amd64.deb"
sudo apt-get install -y ./gum.deb >/dev/null 2>&1
rm gum.deb
cd -