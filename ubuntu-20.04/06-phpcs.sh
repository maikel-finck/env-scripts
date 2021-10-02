#!/bin/bash

# Install requirements.
sudo apt -qq install --yes php-xml php-mbstring

# Install PHP Code Sniffer.
composer global require drupal/coder

# Create symbolic link to executable.
COMPOSER_PATH=$(composer -n config --global home)
sudo ln -s ${COMPOSER_PATH}/vendor/bin/phpcs /usr/local/bin/phpcs

# Configure Drupal Code Standard.
phpcs --config-set colors 1
phpcs --config-set report_width auto
phpcs --config-set installed_paths ${COMPOSER_PATH}/vendor/drupal/coder/coder_sniffer

# Check installed standards.
echo
phpcs -i

