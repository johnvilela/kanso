#!/bin/bash

log "INFO" "Installing OpenFortiVPN"

cd /tmp
wget -qO openfortivpn.zip https://github.com/adrienverge/openfortivpn/archive/refs/tags/v1.23.1.zip
unzip -q openfortivpn.zip -d openfortivpn
cd /tmp/openfortivpn

./autogen.sh
./configure --prefix=/usr/local --sysconfdir=/etc
make
sudo make install
cd -

log "SUCCESS" "OpenFortiVPN installed"
