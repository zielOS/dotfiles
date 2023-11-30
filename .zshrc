#!/bin/sh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="brave-bin"

# source
plug "$HOME/.config/zsh/aliases.zsh"

# plugins
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "zap-zsh/zap-prompt"
plug "Aloxaf/fzf-tab"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-autosuggestions"

# keybinds
bindkey '^ ' autosuggest-accept

export PATH="$HOME/.local/bin":$PATH

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"Visual Studio Dark+\"" 
  alias catt="bat --theme \"Visual Studio Dark+\"" 
fi

# fnm
export PATH="/home/ahsan/.local/share/fnm:$PATH"
eval "`fnm env`"

eval "$(fnm env)"
eval "$(zoxide init zsh)"

source ~/.config/zsh/syntax_highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
