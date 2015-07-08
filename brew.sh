#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2
# Install zsh
brew install zsh
git clone git://github.com/vladucu/oh-my-zsh.git $PWD/oh-my-zsh
# Install tmux
brew install tmux
# super useful, more here: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
brew install reattach-to-user-namespace

# Install python + vim + powerline
# https://gist.github.com/antiAgainst/5b63c39960d875b5d75b
brew install python
brew install vim --env-std --override-system-vi --with-lua


# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
#brew install ringojs
#brew install narwhal

# Install more recent versions of some OS X tools.
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
# brew install homebrew/php/php55 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli

# Install direnv
brew install direnv

# Install hub
brew install hub

# sourcetree
brew cask install sourcetree

# Install ngrok
brew install ngrok

# Install redis
brew install redis

brew cask install istat-menus

# Install z https://github.com/rupa/z
brew install z

# http://vim.spf13.com/#install
curl http://j.mp/spf13-vim3 -L -o - | sh

# https://rvm.io
# rvm for the rubiess
curl -L https://get.rvm.io | bash -s stable --ruby

# Install modman, module manager for Magento
# https://github.com/colinmollenhour/modman
bash < <(curl -s https://raw.github.com/colinmollenhour/modman/master/modman-installer)

# https://github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
sudo bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)

# Install nvm
brew install nvm

# Install go
brew install go

# Remove outdated versions from the cellar.
brew cleanup
