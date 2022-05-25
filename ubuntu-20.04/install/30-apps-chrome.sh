#!/bin/bash

# Stop the script at the first error signal.
set -e

curl -sL https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o ~/google-chrome-stable_current_amd64.deb

sudo dpkg -i ~/google-chrome-stable_current_amd64.deb

rm ~/google-chrome-stable_current_amd64.deb
