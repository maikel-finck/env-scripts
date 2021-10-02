#!/bin/bash

# Install Drupal Console.
curl https://drupalconsole.com/installer -L -o ~/drupal.phar
sudo mkdir -p /usr/local/bin
sudo mv ~/drupal.phar /usr/local/bin/drupal
sudo chmod +x /usr/local/bin/drupal

# Check the Drupal console version.
drupal --version

