#!/bin/bash

# Refresh the package index.
sudo apt update

# Install requirements.
sudo apt install --yes php-cli php-zip php-gd unzip

# Install composer.
curl -sS https://getcomposer.org/installer | sudo php && sudo mv composer.phar /usr/local/bin/composer

# Fix permissions.
sudo chmod +x /usr/local/bin/composer
sudo chown -R $USER ~/.composer/

composer --version
