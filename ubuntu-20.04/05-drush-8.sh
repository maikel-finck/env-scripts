#!/bin/bash

# Install requirements.
sudo apt -qq install --yes php-xml

# Install Drush commandline tool.
composer global require drush/drush:8.*

# Get the configuration folder.
COMPOSER_PATH=$(composer -n config --global home)
sudo ln -s ${COMPOSER_PATH}/vendor/bin/drush /usr/local/bin/drush

echo
drush --version
