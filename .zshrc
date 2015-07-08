#!/usr/bin/zsh
# Path to your oh-my-zsh configuration.
DOT=$HOME/.dotfiles
ZSH=$DOT/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="vladucu"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# ssh-agent set forwarding on and specify all identities that we want to be loaded
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent vladucu vlad@ST

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    git git-flow git-extras git-cust github
    vagrant knife docker supervisor
    sublime extract ssh-agent composer
    npm node
    ruby gem rvm rails capistrano
    bower
    redis-cli
    z
    heroku
    battery
    cp
    shortcuts
    go
    tmux tmuxinator
    brew brew-cask osx
)

# set default editor to sublime
export EDITOR="subl"

source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

source $ZSH/oh-my-zsh.sh

# Customize to your needs..

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Enable nvm
mkdir -p ~/.nvm
cp $(brew --prefix nvm)/nvm-exec ~/.nvm/
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Enable rvm
source $HOME/.rvm/scripts/rvm
rvm use default

# Enable direnv
eval "$(direnv hook zsh)"
