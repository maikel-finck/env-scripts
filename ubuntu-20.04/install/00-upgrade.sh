#!/bin/bash

# Stop the script at the first error signal.
set -e

# Update the system.
sudo apt -qq clean

sudo apt -qq update
apt list --upgradeable

sudo apt -qq upgrade --yes

sudo apt -qq autoremove --yes
sudo apt-get autoclean
