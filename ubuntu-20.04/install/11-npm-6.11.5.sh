#!/bin/bash

# Refresh the package index.
sudo apt -qq update

# Install NODEJS and dependencies.
sudo apt -qq install --yes build-essential autoconf libtool nasm

# Install NVM.
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

# Add the system environment to the bashrc file.
sudo tee -a $HOME/.bash_aliases > /dev/null <<EOT

if [ -d "\$HOME/.nvm" ]; then
  export NVM_DIR="\$HOME/.nvm"
  [ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "\$NVM_DIR/bash_completion" ] && \. "\$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
EOT

# Load system environment.
source $HOME/.bash_aliases

# Install version 6.
nvm install v6.11.5

echo "NodeJS:"
node --version
echo "NPM:"
npm --version
echo "NVM:"
nvm --version
