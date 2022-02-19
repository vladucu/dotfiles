#!/usr/bin/env zsh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Less recursive by default
export LESS=-R

# You Should Use
# Plugin: MichaelAquilina/zsh-you-should-use
export YSU_MODE=ALL

# Enable shell history for IEx
# https://hexdocs.pm/iex/IEx.html#module-shell-history
export ERL_AFLAGS="-kernel shell_history enabled"

# Link Phoenix debug page stack traces to VSCode
# https://angelika.me/2020/03/22/link-phoenix-debug-page-stack-trace-to-your-editor
export PLUG_EDITOR="vscode://file/__FILE__:__LINE__"