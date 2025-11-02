#!/bin/bash

pushd /tmp >/dev/null

git clone -q https://github.com/pop-os/shell.git

pushd shell >/dev/null
git checkout master_noble
log "INFO" "Building Pop Shell"
make local-install || true

popd >/dev/null

popd >/dev/null

mkdir -p "$HOME/.config/pop-shell"

cp "$KANSO_REPO/configs/pop-shell/config.json" "$HOME/.config/pop-shell/config.json"

mkdir -p "$HOME/.config/systemd/user"

cat >"$HOME/.config/systemd/user/enable-pop-shell.service" <<'EOF'
[Unit]
Description=Enable Pop Shell after first login
After=graphical-session.target

[Service]
Type=oneshot
ExecStart=/usr/bin/gnome-extensions enable pop-shell@system76.com
ExecStartPost=/usr/bin/systemctl --user disable enable-pop-shell.service
ExecStartPost=/usr/bin/rm -f %h/.config/systemd/user/enable-pop-shell.service

[Install]
WantedBy=default.target
EOF

systemctl --user enable enable-pop-shell.service || true

log "SUCCESS" "Pop Shell installed from source"
