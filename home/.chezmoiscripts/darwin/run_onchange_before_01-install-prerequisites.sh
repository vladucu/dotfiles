#!/bin/bash
# Install macOS prerequisites
#
# We need to do this as the first step and __not in a template__.
# Source
# https://www.chezmoi.io/user-guide/frequently-asked-questions/usage/#how-do-i-install-pre-requisites-for-templates

source /tmp/chezmoi-utils.sh
set -eufo pipefail

printf "${green}\n[01 - macOS] ${reset}"

### Homebrew
if command -v brew >/dev/null; then
  echo "Homebrew already installed, skipping."
else
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "Homebrew installed!\n"

  # Needed here because dotfiles depends on this for the shell config - mostly for the initial run
  if [ -f /opt/homebrew/bin/brew ]; then
    eval $(/opt/homebrew/bin/brew shellenv)
  elif [ -f /usr/local/bin/brew ]; then
    eval $(/usr/local/bin/brew shellenv)
  fi

  brew install sheldon
  echo "Sheldon installed!\n"
fi
