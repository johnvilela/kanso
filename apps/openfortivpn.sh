#!/bin/bash

log "INFO" "Installing OpenFortiVPN"

cd /tmp
mkdir -p openfortivpn
wget -qO openfortivpn.zip https://github.com/adrienverge/openfortivpn/archive/refs/tags/v1.23.1.zip
unzip -q openfortivpn.zip -d openfortivpntmp
mv openfortivpntmp/*/* openfortivpn
rm -rf openfortivpntmp
cd /tmp/openfortivpn

silent_log bash -c "./autogen.sh"
silent_log bash -c "./configure --prefix=/usr/local --sysconfdir=/etc"
silent_log bash -c "make"
silent_log bash -c "sudo make install"
cd -

log "SUCCESS" "OpenFortiVPN installed"
