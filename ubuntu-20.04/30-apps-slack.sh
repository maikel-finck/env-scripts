#!/bin/bash

# Get Slack for Linux installer.
curl https://downloads.slack-edge.com/releases/linux/4.19.2/prod/x64/slack-desktop-4.19.2-amd64.deb -L -o ~/slack-desktop.deb

# Install lando.
sudo apt install ~/slack-desktop.deb

# Remove installation files.
rm ~/slack-desktop.deb

