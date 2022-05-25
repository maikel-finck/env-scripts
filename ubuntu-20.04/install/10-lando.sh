#!/bin/bash

# Download the installer.
curl -sL https://files.devwithlando.io/lando-stable.deb -o ~/lando-stable.deb

# Install lando.
sudo dpkg -i ~/lando-stable.deb

# Remove installation files.
rm ~/lando-stable.deb

# Check the installed version.
lando version

