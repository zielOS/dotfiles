#!/bin/sh
# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="brave-bin"

# source
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/syntax_highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh


