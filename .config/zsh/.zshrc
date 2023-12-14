# Path to your oh-my-zsh installation.
export ZSH="${XDG_DATA_HOME:-$HOME/.local/share}/oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

plugins=(
    git
    zsh-autosuggestions
    z
    zsh-vi-mode
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
# Load aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# hide bad files in home
unalias ll
ll() {
    [ "$(pwd)" = "$HOME" ] && exa -lah --icons --ignore-glob=".CFUserTextEncoding|.DS_Store|.cups|.Trash|Applications|Desktop|Documents|Downloads|Library|Movies|Music|Pictures|Public|Creative Cloud Files" $@ || exa -lah --icons $@
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/p10k/p10k.zsh ]] || source ~/.config/p10k/p10k.zsh
