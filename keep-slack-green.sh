#!/bin/bash
set -euo pipefail

ACTIVITY_INTERVAL=240
MOUSE_RETURN_DELAY=1

if ! command -v ydotool >/dev/null 2>&1; then
    echo "ERROR: ydotool is not installed."
    exit 1
fi

echo "Slack Green iniciado"
echo "Cierra esta ventana para detenerlo"
echo

while true
do
    echo "$(date '+%H:%M:%S') - Manteniendo actividad..."

    # Mueve el mouse 1 pixel y vuelve
    ydotool mousemove -- 1 0
    sleep "$MOUSE_RETURN_DELAY"
    ydotool mousemove -- -1 0

    sleep "$ACTIVITY_INTERVAL"
done
