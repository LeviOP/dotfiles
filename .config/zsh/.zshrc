REAL_TERM=$([[ -n "$TMUX" ]] && tmux display-message -a | grep client_termname | sed -ne "s/client_termname=//p" || echo $TERM)

# Dont' use complicated fonts if in the virtual console
if [[ "$REAL_TERM" == "linux" ]]; then
    autoload -U colors && colors
    PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
else
    source ~/.config/p10k/p10k.zsh
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi

# Use emacs binds
bindkey -v
bindkey "^N" down-line-or-history
bindkey "^P" up-line-or-history
bindkey "^F" forward-char

# Case-insensitive tab completion
autoload -Uz compinit && compinit
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"

# Load aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-z/zsh-z.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # Must be last
