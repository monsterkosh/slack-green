#!/bin/bash
set -euo pipefail

INSTALL_DIR="$HOME/.local/share/slack-green"
BIN_DIR="$HOME/.local/bin"
APP_DIR="$HOME/.local/share/applications"

echo "Installing Slack Green..."

# Dependencias
if ! command -v ydotool >/dev/null 2>&1; then
    echo "ERROR: ydotool is not installed."
    exit 1
fi

if ! command -v ptyxis >/dev/null 2>&1; then
    echo "ERROR: ptyxis is not installed."
    exit 1
fi

# Validar archivos fuente
if [ ! -f keep-slack-green.sh ]; then
    echo "ERROR: keep-slack-green.sh not found in current directory."
    exit 1
fi

if [ ! -f slack-green.desktop.template ]; then
    echo "ERROR: slack-green.desktop.template not found."
    exit 1
fi

mkdir -p "$INSTALL_DIR"
mkdir -p "$BIN_DIR"
mkdir -p "$APP_DIR"

cp keep-slack-green.sh "$INSTALL_DIR/"
chmod +x "$INSTALL_DIR/keep-slack-green.sh"

cat > "$BIN_DIR/slack-green" << EOF
#!/bin/bash
exec ptyxis --standalone -- "$INSTALL_DIR/keep-slack-green.sh"
EOF

chmod +x "$BIN_DIR/slack-green"

sed "s|__INSTALL_PATH__|$BIN_DIR|g" \
    slack-green.desktop.template \
    > "$APP_DIR/slack-green.desktop"

chmod +x "$APP_DIR/slack-green.desktop"

if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database "$APP_DIR"
fi

if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo
    echo "Note: $HOME/.local/bin is not in your PATH."
    echo "This does not affect Slack Green, but you won't be able"
    echo "to launch it from the command line without a full path."
fi

echo
echo "Installation completed."
echo "Search for 'Slack Green' in your applications menu."
