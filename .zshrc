#!/bin/sh
# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave-browser"

export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/bin/hypr
export PATH=$PATH:$HOME/.config/emacs/bin
export PATH=$PATH:$HOME/.npm-global/bin

NVARCH=`uname -s`_`uname -m`; export NVARCH
NVCOMPILERS=/opt/nvidia/hpc_sdk; export NVCOMPILERS
MANPATH=$MANPATH:$NVCOMPILERS/$NVARCH/23.9/compilers/man; export MANPATH
PATH=$NVCOMPILERS/$NVARCH/23.9/compilers/bin:$PATH; export PATH 
export PATH=$NVCOMPILERS/$NVARCH/23.9/comm_libs/mpi/bin:$PATH
export MANPATH=$MANPATH:$NVCOMPILERS/$NVARCH/23.9/comm_libs/mpi/man

# source
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/syntax_highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh

# ${ZDOTDIR:-~}/.zshrc

# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=$HOME/.config/zsh/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory.
fpath=(/usr/share/zsh-antidote/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh

