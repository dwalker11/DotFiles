# Make vim the default editor
export EDITOR="vim"
export VISUAL="vim"

ANTIGEN_LOG=~/antigen.log

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep nomatch notify
unsetopt extendedglob
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/home/devon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# User specific environment
if [ -d "$HOME/.bin" ]; then
    PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/usr/local/go/bin" ]; then
    PATH="$PATH:/usr/local/go/bin"
fi

if [ -d "$HOME/.rvm/bin" ]; then
    PATH="$PATH:$HOME/.rvm/bin"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Aliases
# alias cat='bat'
# End of Aliases

# ZSH plugin manager
source ~/antigen.zsh

antigen init ~/.antigenrc

# Starship command prompt
eval "$(starship init zsh)"
