#!/bin/bash

log "INFO" "Installing OpenFortiVPN"

cd /tmp
mkdir -p openfortivpn
wget -qO openfortivpn.zip https://github.com/adrienverge/openfortivpn/archive/refs/tags/v1.23.1.zip
unzip -q openfortivpn.zip -d openfortivpntmp
mv openfortivpntmp/*/* openfortivpn
rm -rf openfortivpntmp

silent_log bash -c "./openfortivpn/autogen.sh"
silent_log bash -c "./openfortivpn/configure --prefix=/usr/local --sysconfdir=/etc"
silent_log bash -c "cd ./openfortivpn && make && cd .."
silent_log bash -c "cd ./openfortivpn && sudo make install && cd .."
cd -

log "SUCCESS" "OpenFortiVPN installed"
