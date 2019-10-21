set -o vi
bind -m vi-insert '"\e.": yank-last-arg'
bind -m vi-insert '"\e,": yank-nth-arg'
bind -x '"\C-p": edit_file'
bind -x '"\C-o": pick_inf_file'

alias ~~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias gk='cd ~/work/kabylake/source'
alias gc='cd ~/work/coffelake/source'
alias ed='cd ~/work/edk2/source'

export PATH=$HOME/bin:$PATH

. ~/.ps1

edit_file () {
    local name
    local rg_pid
    name=`sh -c 'echo "$$"; exec rg --files --glob "!.git/*"' | (
        read rg_pid
        fzf --height 40% --reverse
        kill "$rg_pid" 2>/dev/null
        true)`
    if [ ! -z "$name" ]; then
        vim "$name"
    fi
}

pick_inf_file () {
    local name
    local rg_pid
    name=`sh -c 'echo "$$"; exec rg --files --glob "!.git/*" --glob "*.inf"' | (
        read rg_pid
        fzf --height 40% --reverse
        kill "$rg_pid" 2>/dev/null
        true)`
    if [ ! -z "$name" ]; then
        bm "$name"
    fi
}
