#!/bin/sh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

export VISUAL="nvim"

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/syntax_highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh"

# plugins
plug "hlissner/zsh-autopair"
plug "Aloxaf/fzf-tab" 
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-autosuggestions"
plug "esc/conda-zsh-completion"
plug "zap-zsh/supercharge"

# keybinds
bindkey '^ ' autosuggest-accept

#eval "$(fnm env)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"



# bun completions
[ -s "/home/ahsan/.bun/_bun" ] && source "/home/ahsan/.bun/_bun"

export PATH=$HOME/.config/rofi/scripts:$PATH

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
