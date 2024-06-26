#!/bin/bash
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-256color) color_prompt=yes;;
    xterm-kitty) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    export PS1='$(bash sync_ps)$(git_ps)\[\033[01;037m\]\h$ \[\033[00m'
else
    export PS1='$ '
fi

source_if_exists()
{
    [ -f "$1" ] && source "$1"
}

#interactive conmpletion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#Quotes
if [ -f ~/.quotes ]; then
    source ~/.quotes
fi

#cd history
source_if_exists ~/.adc_func.sh

#vim as man viewer
export MANPAGER="nvim -c 'Man!' -o -"

#more readable colors of dirs in ls colorized output
export LS_COLORS=$LS_COLORS:'di=0;35:'

#Go environment
export GOPATH=~/workspace/go/

#fuzzy finder for bash (fzf https://github.com/junegunn/fzf) extension
source_if_exists /usr/share/fzf/key-bindings.bash
source_if_exists /usr/share/fzf/completion.bash

#custom aliases
source_if_exists ~/.bash_aliases

#thefuck
thefuck --version &> /dev/null && eval "$(thefuck --alias)"

#ssh agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

#Display error codes
EC() { printf '\e[1;33mcode %d\e[m\n' $?; }
trap EC ERR


#set vim as default editor
export EDITOR=nvim
export VISUAL=nvim

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

complete -C /usr/bin/terraform terraform

#zoxide (cd replacment)
eval "$(zoxide init bash)"
