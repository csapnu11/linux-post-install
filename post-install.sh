#!/bin/bash

# Initial update of system
echo "Running apt update and upgrade..."
sudo apt update && sudo apt upgrade -y

echo "Installing dependencies for VS Code..."
sudo apt install -y software-properties-common apt-transport-https curl

# Add Microsoft's GPG key and VS Code repository
echo "Adding Microsoft's GPG key and repository for VS Code..."
curl https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor > /usr/share/keyrings/microsoft-archive-keyring.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# refresh apt
sudo apt update


echo "Installing programs"
sudo apt install -y vlc
sudo apt install -y code
sudo apt install -y python3-pip
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# Clean up
echo "Cleaning up..."
sudo apt autoremove -y
sudo apt clean

echo "Installation complete..."
