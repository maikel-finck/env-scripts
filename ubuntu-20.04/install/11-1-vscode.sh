#!/bin/bash

# Refresh the package index.
sudo apt -qq update

# Install requirements.
sudo apt -qq install --yes curl software-properties-common apt-transport-https gpg

# Adding repository and key.
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/

sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

# Installing Visual Studio Code.
sudo apt -qq update
sudo apt -qq install --yes code

code --version

