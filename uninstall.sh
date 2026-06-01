#!/bin/bash
set -euo pipefail

echo "Removing Slack Green..."

rm -rf "$HOME/.local/share/slack-green"

rm -f "$HOME/.local/bin/slack-green"

rm -f "$HOME/.local/share/applications/slack-green.desktop"

if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database "$HOME/.local/share/applications"
fi

echo "Slack Green removed."
