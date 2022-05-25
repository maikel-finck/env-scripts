#!/bin/bash

# Stop the script at the first error signal.
set -e

# Refresh the package index.
sudo apt -qq update

# Install essential packages:
sudo apt install --yes curl git unzip build-essential gdebi-core
