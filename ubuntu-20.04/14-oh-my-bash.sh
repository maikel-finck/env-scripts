#!/bin/bash

# Stop the script at the first error signal.
set -e

# Install packages.
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

