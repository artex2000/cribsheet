# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#export PS1="[\w]\$ "
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
setxkbmap -option caps:escape
set -o vi

export TOOLS_DIR=/home/artex2000/work/Tools
export IA32_TOOLS_DIR=/usr/bin
export X64_TOOLS_DIR=/usr/bin
export NASM_PREFIX=/usr/bin/

export AARCH64_TOOLS_DIR=/home/artex2000/work/linaro/gcc/bin
export AARCH64_TOOL_PREFIX=aarch64-linux-gnu-
. /home/artex2000/.ps1
