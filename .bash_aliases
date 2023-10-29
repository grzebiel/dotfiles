
#if you are on mac os x use GNU installed by homebrewls instead of BSD one

# cd and ls in one
cl() {
    cd "$1"
    ls
}

cll() {
    cd "$1"
    ll
}
cla() {
    cd "$1"
    la
}
clla() {
    cd "$1"
    lla
}

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff="diff -u --color=always" 
fi

# some more ls aliases
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias lla='ls -lhA'

# go up
alias ..='cd ..; pwd; ls'
alias ...='cd ../..; pwd; ls'
alias ....='cd ../../..; pwd; ls'
alias .....='cd ../../../..; pwd; ls'
alias ......='cd ../../../../..; pwd; ls'
alias .......='cd ../../../../../..; pwd; ls'
alias cd..='cd ..; pwd'

# do symlink
alias lns='ln -s'

# you dont want vi...
alias vi='nvim'
alias vim='nvim'

# some vim like aliases
:e()
{
    nvim "$@"
}

# tmux in 265 colors
alias tmux="TERM=xterm-256color tmux"

# pacaur instead of pacman
if yay --version > /dev/null
then
    alias pacman='yay'
fi

# copy and paste to commandline
alias c='xclip -selection clipboard'
alias v='xclip -selection clipboard -o'

#this name really sucks
alias music='ncmpcpp'

#sane date format
alias isodate='date +"%Y-%m-%d"'

# use kitty ssh
alias kssh='kitten ssh'
