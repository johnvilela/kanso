#!/bin/bash

mkdir -p "$HOME/.config/systemd/user"

cat > "$HOME/.config/systemd/user/enable-pop-shell.service" <<'EOF'
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
