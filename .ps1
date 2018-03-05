#!/bin/bash

GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
NC=$(tput sgr0)

HOSTNAME="$(hostname | cut -d. -f1)"
WORKDIR='$(echo -n "$PWD" | /home/artex2000/bin/ps1-awk)'
export PS1='[\[${BLUE}\]${HOSTNAME}\[${YELLOW}\] $(eval "echo $WORKDIR")\[${NC}\]]\$ '
