#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If this is not a login shell, source profile to set environment variable
[[ -o login ]] || [[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile" ]] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile"

## Prompts

# Basic prompt
#export PS1='[\u@\h \W]\$ '

# Minimal prompt
#export PS1=" \[\033[1;36m\]\w >\[\033[1;34m\]>\[\033[0m\] "

# Two-line prompt
#export PS1='\[\033[;32m\]┌──(\[\033[1;34m\]\u@\h\[\033[;32m\])-[\[\033[0;1m\]\w\[\033[;32m\]]\n\[\033[;32m\]└─\[\033[1;34m\]\$\[\033[0m\] '

# Colorful prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Setting history
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTFILE="${XDG_CACHE_HOME:=$HOME/.cache}/bash_history"

# shopt
shopt -s histappend             # append to history file
shopt -s checkwinsize           # check window size after each command
shopt -s autocd                 # type path to auto cd
shopt -s cdspell                # auto correct cd spelling
shopt -s cmdhist
shopt -s dirspell
shopt -s direxpand

# Bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# disable terminal flow control (ctrl+s and ctrl+q)
stty -ixon

# enable vi mode
set -o vi

# Aliases
[[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases" ]] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases"

# Python's virtualenv and virtualenvwrapper
if [[ -f $HOME/.local/bin/virtualenvwrapper.sh ]]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    export WORKON_HOME="${XDG_DATA_HOME}/virtualenvs"
    export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/.local/bin/virtualenv
    source $HOME/.local/bin/virtualenvwrapper.sh
fi

# Colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Flexin'
if [[ -x "$(command -v pfetch)" ]]; then
    pfetch
elif [[ -x "$(command -v neofetch)" ]]; then
    neofetch
fi
