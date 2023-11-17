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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
export PATH="/home/ahsan/.local/share/fnm:$PATH"
eval "`fnm env`"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ahsan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ahsan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ahsan/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ahsan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/ahsan/miniconda3/etc/profile.d/mamba.sh" ]; then
    . "/home/ahsan/miniconda3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

eval "$(starship init zsh)"
