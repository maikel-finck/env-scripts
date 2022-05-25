#!/bin/bash

# Dependencies:
sudo apt -qq update
sudo apt -qq install --yes openjdk-11-jre

# SonarQube Linter:
code --install-extension sonarsource.sonarlint-vscode
