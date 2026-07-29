#!/usr/bin/env bash
# Rebuild Mark's hardened grepai fork and install to ~/.local/bin/grepai
# (PATH already prefers ~/.local/bin over Homebrew).
set -euo pipefail
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

SRC="${GREPAI_SRC:-$HOME/Code/Labs/grepai-src}"
VERSION="${GREPAI_VERSION:-0.35.0-mark.1}"
DEST="${GREPAI_DEST:-$HOME/.local/bin/grepai}"

cd "$SRC"
mkdir -p bin
go test ./store/ -count=1 -timeout 60s
go build -ldflags "-s -w -X main.version=${VERSION}" -o "bin/grepai" ./cmd/grepai
mkdir -p "$(dirname "$DEST")"
cp -f bin/grepai "$DEST"
chmod +x "$DEST"
echo "installed: $DEST ($("$DEST" version))"
echo "homebrew still at: $(command -v -a grepai | tail -n +2 | head -1 || true)"
