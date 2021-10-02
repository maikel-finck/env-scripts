#!/bin/bash

# Stop the script at the first error signal.
set -e

# Refresh the package index.
sudo apt -qq update

# Install packages.
sudo apt install --yes nfs-common cifs-utils
