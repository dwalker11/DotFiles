# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep nomatch notify
unsetopt extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/devon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Antigen plugins
ANTIGEN_LOG=~/antigen.log

source ~/antigen.zsh

antigen bundle common-aliases
antigen bundle fzf
antigen bundle git
antigen bundle json
antigen bundle sudo
antigen bundle tmux
antigen bundle web-search
antigen bundle 'MichaelAquilina/zsh-you-should-use'
antigen bundle olets/zsh-abbr@main
antigen bundle rupa/z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply
# End of Antigen plugins

# Aliases
alias cat='bat'
# End of Aliases

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export PATH="$PATH:/usr/local/go/bin"

export EDITOR="/usr/bin/nvim"

eval "$(starship init zsh)"
