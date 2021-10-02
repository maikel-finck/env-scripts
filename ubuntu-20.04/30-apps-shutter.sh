#!/bin/bash

# Stop the script at the first error signal.
set -e

# Install packages.
sudo add-apt-repository -y ppa:linuxuprising/shutter
sudo apt install --yes shutter

