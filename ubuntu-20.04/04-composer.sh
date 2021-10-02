#!/bin/bash

# Stop the script at the first error signal.
set -e

# Refresh the package index.
sudo apt -qq update

# Install requirements.
sudo apt -qq install --yes php-cli php-zip php-gd unzip

# Get composer installer.
curl -sS https://getcomposer.org/installer -o ~/composer-setup.php

# Install composer.
sudo php ~/composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Get the configuration folder.
COMPOSER_PATH=$(composer -n config --global home)

# Add the bin folder to the PATH.
export PATH="${PATH}:${COMPOSER_PATH}/vendor/bin"
echo "export PATH=\"\$PATH:${COMPOSER_PATH}/vendor/bin\"" >> ~/.bashrc

# Check installed version.
composer --version

