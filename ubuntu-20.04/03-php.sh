#!/bin/bash

# Stop the script at the first error signal.
set -e

# Refresh the package index.
sudo apt -qq update

# Install packages.
sudo apt install --yes php-cli php-zip unzip php-gd php-xml php-mbstring

# Check installed version.
echo
php --version
