#!/usr/bin/env bash
# Symlink tv-guide channels into ~/.config/television/cable/
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CABLE_DIR="${HOME}/.config/television/cable"

mkdir -p "$CABLE_DIR"

for f in "$SCRIPT_DIR"/channels/*.toml; do
  name="$(basename "$f")"
  ln -sf "$f" "$CABLE_DIR/$name"
  echo "  linked $name"
done

echo ""
echo "done. run 'tv list-channels' to verify."
