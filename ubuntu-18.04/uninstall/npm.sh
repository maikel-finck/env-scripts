#!/bin/bash

# Remove the installation folders.
rm -rf $NVM_DIR ~/.nvm ~/.npm ~/.bower

# Remove the terminal variable.
unset NVM_DIR
