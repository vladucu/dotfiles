#!/bin/bash
# Install nix
# Uses https://github.com/DeterminateSystems/nix-installer

source /tmp/chezmoi-utils.sh
set -eufo pipefail

if command -v nix >/dev/null; then
  echo "Homebrew already installed, skipping."
  exit 0
else
  printf "${green}\n[03 - macOS] ${reset}"
  echo "Installing nix"
fi

curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
