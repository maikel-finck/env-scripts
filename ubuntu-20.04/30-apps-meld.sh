#!/bin/bash

# Stop the script at the first error signal.
set -e

sudo apt -qq update
sudo apt -qq install --yes meld
