#!/bin/sh

# Install remotely from single shell command
# Usage : sh -c "$(curl -fsSL https://raw.githubusercontent.com/vladucu/dotfiles/main/install.sh)"
echo ""
echo "🤚  This script will setup your macOS & dotfiles."
read -n 1 -r -s -p $'    Press any key to continue or Ctrl+C to abort...\n\n'

# Install Xcode Command Line tools
check=$(xcode-select --install 2>&1)
str="xcode-select: note: install requested for command line developer tools"
while [[ "$check" == "$str" ]]; do
  check=$(xcode-select --install 2>&1)
  sleep 1
done

echo "Xcode Command Line Tools installed"

set -e # -e: exit on error

if [ ! "$(command -v chezmoi)" ]; then
  bin_dir="$HOME/.local/bin"
  chezmoi="$bin_dir/chezmoi"
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  chezmoi=chezmoi
fi

# exec: replace current process with chezmoi init
exec "$chezmoi" init --apply vladucu --keep-going
