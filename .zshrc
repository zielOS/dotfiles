#!/bin/sh
# source antidote
source /usr/share/zsh-antidote/antidote.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/syntax_highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

zsh_plugins=$HOME/.config/zsh/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory.
fpath=(source /usr/share/zsh-antidote/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh

# keybinds
bindkey '^ ' autosuggest-accept

#eval "$(fnm env)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

