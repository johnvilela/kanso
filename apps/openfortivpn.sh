#!/bin/bash

log "INFO" "Installing OpenFortiVPN"

pushd /tmp >/dev/null
mkdir -p openfortivpn
wget -qO openfortivpn.zip https://github.com/adrienverge/openfortivpn/archive/refs/tags/v1.23.1.zip
unzip -q openfortivpn.zip -d openfortivpntmp
mv openfortivpntmp/*/* openfortivpn
rm -rf openfortivpntmp

pushd openfortivpn >/dev/null

silent_log ./autogen.sh
silent_log ./configure --prefix=/usr/local --sysconfdir=/etc
silent_log make
silent_log sudo make install

popd >/dev/null

popd >/dev/null

log "SUCCESS" "OpenFortiVPN installed"
