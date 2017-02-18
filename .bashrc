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
    xterm-color) color_prompt=yes;;
esac

export PS1='$(git_ps)\[\033[01;037m\]$\[\033[00m'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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
    . ~/.quotes
fi

#Display error codes
EC() { printf '\e[1;33mcode %d\e[m\n' $?; }
trap EC ERR

#custom scripts location added to path
export PATH=~/configs/bin:~/bin:$PATH

#cd history
source ~/.adc_func.sh

#vim as man viewer
export MANPAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist nonumber norelativenumber' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

#Go environment
export GOPATH=~/workspace/go/

#fuzzy finder for bash (fzf https://github.com/junegunn/fzf) extension
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#more readable colors of dirs in ls colorized output
export LS_COLORS=$LS_COLORS:'di=0;35:'

#thefuck
eval "$(thefuck --alias)"

#print my tasks
task list

#used for git bare repo handling
alias config='/usr/bin/git --git-dir=/home/grzebiel/.cfg/ --work-tree=/home/grzebiel'

#this name really sucks
alias music='ncmpcpp'
