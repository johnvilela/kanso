#!/bin/bash

log "INFO" "Installing OpenFortiVPN"

cd /tmp
mkdir -p openfortivpn
wget -qO openfortivpn.zip https://github.com/adrienverge/openfortivpn/archive/refs/tags/v1.23.1.zip
unzip -q openfortivpn.zip -d openfortivpntmp
mv openfortivpntmp/*/* openfortivpn/*
rm -rf openfortivpntmp
cd /tmp/openfortivpn

./autogen.sh
./configure --prefix=/usr/local --sysconfdir=/etc
make
sudo make install
cd -

log "SUCCESS" "OpenFortiVPN installed"
