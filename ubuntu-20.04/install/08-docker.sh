#!/bin/bash

# Guidelines used to create this script:
# https://docs.docker.com/engine/install/ubuntu/
# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository

# Stop the script at the first error signal.
set -e

# Go to the home folder:
cd ~

# Refresh the package index.
sudo apt -qq update

# Allow the next instruct to fail without interrupting the script.
set +e

# Stop the docker service if its running.
sudo systemctl stop docker.socket

# Uninstall old versions. The contents of /var/lib/docker/ are preserved.
# This is run multiline to avoid issues with missing packages stopping the command.
sudo apt -qq purge --yes docker
sudo apt -qq purge --yes docker-engine
sudo apt -qq purge --yes docker.io
sudo apt -qq purge --yes docker-ce
sudo apt -qq purge --yes docker-ce-cli
sudo apt -qq purge --yes containerd
sudo apt -qq purge --yes containerd.io
sudo apt -qq purge --yes runc

# Remove unused or broken packages.
sudo apt autoremove --yes

# Stop the script at the first error signal.
set -e

# Install packages to allow apt to use a repository over HTTPS:
sudo apt -qq install --yes apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release

# Add Docker’s official GPG key:
sudo rm -f /usr/share/keyrings/docker-archive-keyring.gpg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Get the current architecture:
ARCHITECTURE=$(dpkg --print-architecture)
DISTRIBUTION=$(lsb_release -cs)

# Setup the stable repository for the current architecture.
sudo rm -f /etc/apt/sources.list.d/docker.list
echo "deb [arch=${ARCHITECTURE} signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu ${DISTRIBUTION} stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the apt package index:
sudo apt clean
sudo apt-get autoclean
sudo apt -qq update

# Reconfigure DPKG in case docker had issues in a previous attempt.
sudo dpkg --configure -a
# Remove previous installers.
sudo rm -f /var/lib/dpkg/info/docker-ce
sudo rm -f /var/lib/dpkg/info/docker-ce-cli
sudo rm -f /var/lib/dpkg/info/containerd.io

# Restart the network service to avoid post-setup issues.
sudo systemctl restart systemd-networkd.service
sudo systemctl status systemd-networkd.service

# Install DOCKER:
sudo apt install --yes containerd.io
sudo apt install --yes docker-ce docker-ce-cli

# Check the docker service.
# sudo systemctl status docker.service

sudo groupadd docker
sudo usermod -aG docker ${USER}

# Fix the permission issue to access the socket.
sudo chmod 666 /var/run/docker.sock

echo
docker --version
