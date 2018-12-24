# User specific aliases and functions
setxkbmap -option caps:escape
set -o vi
bind -m vi-insert '"\e.": yank-last-arg'
bind -m vi-insert '"\e,": yank-nth-arg'
#bind -x '"\C-p": vim $(edit_file)'
bind -x '"\C-p": edit_file'
bind -x '"\C-o": pick_inf_file'
#bind -x '"\C-p": vim $(fzf --height 40% --reverse)'

alias ~~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ll='ls -l'
alias la='ls -al'
alias gk='cd ~/work/Kabylake/Source'
alias gm='cd ~/work/Mustang/Source'
alias gj='cd ~/work/Juno/Source'
alias gx='cd ~/work/QemuX86/Source'



. /home/artex2000/.ps1

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#export FZF_COMPLETION_TRIGGER=',,'
#export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*" 2> /dev/null'
#export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
#export FZF_ALT_C_COMMAND="cd ~/; bfs -type d -nohidden | sed s#^\.\/##"

#gd - go to directory
gd() {
    local name
    local bfs_pid
    name=`sh -c 'echo "$$"; exec bfs . -type d' | (
        read bfs_pid
        fzf --height 40% --reverse 
        kill "$bfs_pid" 2>/dev/null
        true)`
    cd "$name"
}

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
