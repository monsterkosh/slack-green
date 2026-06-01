# Slack Green

Keep your Slack status active on Wayland using ydotool.

## Requirements

* Linux
* Wayland
* ydotool
* Ptyxis

## Installation

```bash
git clone https://github.com/YOUR_USERNAME/slack-green.git
cd slack-green
./install.sh
```

## Usage

Open **Slack Green** from your applications menu.

A terminal window will open and keep Slack active.

Close the terminal window to stop it.

## Uninstall

```bash
./uninstall.sh
```

## How it works

Slack Green periodically generates minimal keyboard and mouse activity using ydotool, helping Slack remain in an active state while running under Wayland.
