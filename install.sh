#!/bin/bash

set -euo pipefail

trap 'echo "Installation failed." >&2' ERR

echo "Starting Kanso installation..."

if ! command -v git >/dev/null 2>&1; then
  echo "Installing git..."
  sudo apt install -y git
fi

REPO_URL="https://github.com/johnvilela/kanso.git"
TARGET_DIR="$HOME/.local/share/kanso"

rm -rf "$TARGET_DIR"
mkdir -p "$HOME/.local/share"

git clone "$REPO_URL" "$TARGET_DIR"

echo "Repository cloned."

if [ ! -f "$TARGET_DIR/bootstrap.sh" ]; then
  echo "bootstrap.sh not found." >&2
  exit 1
fi

cd "$TARGET_DIR"

echo "Running bootstrap.sh..."
source ./bootstrap.sh