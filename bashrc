#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# I'm in love with color, especially for vim 7/14/2014
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# Custom command to clear kernel messages (especially on boot)
alias away='sudo dmesg -D'

# Bash completion for git
source /usr/share/git/completion/git-completion.bash

# For rubyGems
PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# RVM bash completion
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"

# i3Lock screen alias - 5/22/2014
alias lockArch='i3lock -n -i Pictures/i3Lock.png -p default -d'

# set the terminal font (easy) 7/19/2014
alias terminusB='setfont ter-u24b'

# get to the os2 source code easily (7/22/2014)
alias getOs2='cd /home/devon/Projects/siris-os-2'

#get to the ui source code easily (7/22/2014)
alias getui='cd /home/devon/Projects/siris-ui-source'
