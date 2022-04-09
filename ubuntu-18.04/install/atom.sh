#!/bin/bash

# Install requirements.
sudo apt install --yes gdebi-core

# Download Atom debian installer.
wget https://atom.io/download/deb -O ./atom-amd64.deb
# Install Atom.
sudo gdebi ./atom-amd64.deb --non-interactive

# Delete the installer.
rm ./atom-amd64.deb
