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

mkdir -p $HOME/.docker/cli-plugins/
sudo chmod g+rwx "$HOME/.docker" -R

sudo rm -f $HOME/.docker/cli-plugins/docker-compose

# Get the latest DOCKER-COMPOSE:
COMPOSE_LATEST=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/docker/compose/releases/latest)
COMPOSE_VERSION=$(echo ${COMPOSE_LATEST} | sed 's:.*/::')
OS_SYSTEM=$(uname -s | tr '[:upper:]' '[:lower:]')
OS_ARCHITECTURE=$(dpkg --print-architecture)

sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-${OS_SYSTEM}-${OS_ARCHITECTURE}" -o $HOME/.docker/cli-plugins/docker-compose

sudo chmod +x $HOME/.docker/cli-plugins/docker-compose
sudo systemctl restart docker


echo
echo "Docker Compose installed as a Docker CLI pluggin"
echo "$ docker compose ls"
docker compose --version
