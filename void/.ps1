#!/bin/bash

PROMPT_COMMAND=prompter
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
DGRAY=$(tput setaf 10)
NC=$(tput sgr0)

#HOSTNAME="$(hostname | cut -d. -f1)"
#WORKDIR='$(echo -n "$PWD" | /home/artex2000/bin/ps1-awk)'
#export PS1='[\[${BLUE}\]${HOSTNAME}\[${YELLOW}\] $WORKDIR]\n\[${NC}\]\$ '
function prompter() {
    git_rep=`git rev-parse --is-inside-work-tree 2>/dev/null`
    if [ "$git_rep" = "true" ]; then
        BRANCH=`git rev-parse --abbrev-ref HEAD`
        git_mod=`git status --porcelain --untracked-files=no`
        #git_untracked=`git status --porcelain`
        #git_mod=`git ls-files -m`
        git_untracked=`git ls-files -o --exclude-standard`
        if [ ! -z "$git_mod" ]; then
            export PS1='\[${DGRAY}\]\u@\h:\w \[${RED}\][$BRANCH]\[${NC}\]\n\$ '
        elif [ ! -z "$git_untracked" ]; then
            export PS1='\[${DGRAY}\]\u@\h:\w \[${YELLOW}\][$BRANCH]\[${NC}\]\n\$ '
        else
            export PS1='\[${DGRAY}\]\u@\h:\w \[${GREEN}\][$BRANCH]\[${NC}\]\n\$ '
        fi
    else
        export PS1='\[${DGRAY}\]\u@\h:\w\[${NC}\]\n\$ '
    fi
}

