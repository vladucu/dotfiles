#!/bin/bash
# Install nix
# Uses https://github.com/DeterminateSystems/nix-installer

source /tmp/chezmoi-utils.sh
set -eufo pipefail

printf "${green}\n[03 - macOS] ${reset}"
echo "Installing nix"

curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
