#!/bin/sh

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --output HDMI1 --right-of VGA1
setxkbmap -option caps:escape

if [ -f $HOME/.Xresources ]; then
	xrdb -merge -I$HOME ~/.Xresources
fi

exec awesome


