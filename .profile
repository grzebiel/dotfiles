export PATH="$HOME/configs/bin:$HOME/bin:$PATH"
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/grzebiel/.lmstudio/bin"

source ~/.bashrc
. "$HOME/.cargo/env"
