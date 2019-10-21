sudo xbps-install xf86-input-evdev
lspci |grep -i vga
xbps-query -Rs xf86-video
sudo xbps-install xf86-video-intel
sudo xbps-install xf86-video-vesa
sudo xbps-install dejavu-fonts-ttf
sudo xbps-install rxvt-unicode
sudo xbps-install awesome
which startx
ls /etc/X11/xinit/
vim /etc/X11/xinit/xinitrc 
pwd
vim .xinitrc
ls -a
startx
fc-list |grep -i mono
vim
which xrandr
sudo xbps-install xrandr
xrandr
xrandr --help
xrandr -q
xrandr --output HDMI1 --left-of VGA1
xrandr --output HDMI1 --right-of VGA1
ls -a
ls /usr/share
ls /usr/share/font
ls /usr/share/fonts
ls /usr/share/fonts/TTF/
fc-list
fc-list|grep -i mono
mkdir work
cd work/
git clone https://github.com/solarized/xresources
cd xresources/
ls
cd ..
cd ..
vim .Xresources
reboot
sudo reboot
exit
xrandr
xrandr --output HDMI1 --right-of VGA1
xrdb -merge .Xresources 
exit
no shit
exit
xrdb -merge .Xresources
exit
ll dist/void-packages/srcpkgs/
ls -l dist/void-packages/srcpkgs/
xrandr --output VGA1 --left-of HDMI1
vim .xinitrc
exit
[[ -f ~/.Xresources ]]
$?
echo $?
echo $?
[[ -f ~/.Xresources ]]
echo $?
[ -f ~/.Xresources ]
echo $?
[ ! -f ~/.Xresources ]
echo $?
[[ ! -f ~/.Xresources ]]
echo $?
ls -a
ls -al
cat .inputrc
which fc-cache
man fc-cache
vim .bashrc
ls
cd work/
ls
cd xresources/
ls
[ -f ./LICENSE ]
echo $?
echo $SHELL
ls -l
which [
which [[
[[ -f ./LICENSE ]]
echo $?
[[ -f /home/artex2000/work/xresources/LICENSE ]]
echo $?
[ -f /home/artex2000/work/xresources/LICENSE ]
echo $?
[ -d /home/artex2000/work/xresources/LICENSE ]
echo $?
[ -d /home/artex2000/work/xresources ]
echo $?
cd ..
vim tmp
chmod +x tmp 
./tmp 
cd ..
vim .xinitrc
exit
vim .Xresources 
exit
ls /usr/bin |grep xbps
man xbps-install
man xbps-create
du
du -sh
df
ls
mkdir -p mnt/test
mount /dev/sdb3 ~/mnt/test
sudo mount /dev/sdb3 ~/mnt/test
xbps-install -r $HOME/mnt/test base-files
sudo xbps-install -r $HOME/mnt/test base-files
sudo xbps-install -Rr $HOME/mnt/test base-files
sudo xbps-install -R -r $HOME/mnt/test base-files
sudo xbps-install -r $HOME/mnt/test base-files
man xbps-install
sudo xbps-install -R --repository=$HOME/dist/void-packages -r $HOME/mnt/test base-files
ls /bin|grep xbps
man xbps-rindex
cd dist/void-packages/
vim xbps-src 
ls -l srcpkgs/|grep devel
cd srcpkgs/zlib
ls
vim template 
cd zfs
cd ../zfs
ls
vim template 
..
cd ..
cd ..
cd ..
cd ..
cd dist/
git clone https://github.com/void-linux/xbps
cd xbps/
ls
ls bin/
..
cd ..
cd xbps/
ls mk/
vim bin/Makefile 
ls bin/xbps-install/
cd ..
cd ..
vim .Xresources 
lsblk
cd mnt/
mkdir sda1
mkdir sda2
sudo mount /dev/sda1 ~/mnt/sda1
sudo mount /dev/sda2 ~/mnt/sda2
cd ~/mnt/sda1
ls
cd ..
ls sda2
cd sda2/artex2000/
ls
ls -al
cd .fonts/
ls
ls /usr/share/fonts
ls /usr/share/fonts/TTF
ls -l /usr/share/fonts/TTF
sudo cp * /usr/share/fonts/TTF/
ls -l /usr/share/fonts/TTF
fc-cache
fc-list
exit
ls -la
cd work/
mkdir dotfiles
cd dotfiles/
cp ~/mnt/sda2/artex2000/.bash_aliases .
cp ~/mnt/sda2/artex2000/.bashrc .
cp ~/mnt/sda2/artex2000/.dircolors .
cp ~/mnt/sda2/artex2000/.gitconfig 
cp ~/mnt/sda2/artex2000/.gitconfig .
cp ~/mnt/sda2/artex2000/.gitmessage .
cp ~/mnt/sda2/artex2000/.vimrc
cp ~/mnt/sda2/artex2000/.vimrc .
cp -r ~/mnt/sda2/artex2000/.vim .
cp -r ~/mnt/sda2/artex2000/.inputrc .
ls
la
ls -al
ls .vim
ls .vim/autoload/
ls .vim/colors/
ls ~/.vim
cd .vim
cp -r * ~/.vim
cd ..
cp .vimrc ~/
cd ../../
vim
exit
 cat << _EOF
1
2
3
4
5
6
7
8
9
0
1
2
3
4
5
6
7
8
9
0
1
2
3
4
5
6
7
8
9
0
1
2
3
4
5
6
7
8
9
0
_EOF

mount
cd ~/mnt/sda1
ls /usr/local/bin/
ls usr/local/bin/
ls usr/bin/|grep bcomp
./usr/bin/bcompare ~/mnt/sda2/artex2000 ~/mnt/sda2/artex2000/work/cribsheet &
ls -al ~/mnt/sda2/artex2000/
which dircolors
ls -l /usr/bin/|grep dirco
ls /etc |grep compl
ls /usr/share/bash-completion/
ls /usr/share/bash-completion/completions/
exit
ls
pwd
ll
cp work/dotfiles/.dircolors .
cp work/dotfiles/.bash_aliases .
vim .bash_aliases 
chmod +x .ps1 
cp work/dotfiles/.gitmessage .
cp work/dotfiles/.gitconfig .
ll
chmod -x .gitmessage 
exit
ls
cd dist/
cd void-packages/
which setxkbmap
which xmodmap
xbps-query -Rs setxkbmap
xbps-query -Rs xmodmap
sudo xbps-install setxkbmap
..
..
vim .xinitrc 
exit
cd dist/xbps/
xbps-query -Rs ripgrep
sudo xbps-install ripgrep
rg
ls
ls bin/
...
ls
echo $PATH
vim .bash_profile 
xbps-query -Rs fzf
sudo xbps-install fzf
ls /usr/share/doc/fzf/
fzf
rg
which rg
which fzf
exit
echo $PATH
ls
mkdir bin
cd bin/
ls ~/mnt/sda2/artex2000/bin/
cp ~/mnt/sda2/artex2000/bin/ff ffc .
cp ~/mnt/sda2/artex2000/bin/ff .
cp ~/mnt/sda2/artex2000/bin/ffc .
ls
cd ../dist/xbps/
ffc transaction_install
man xbps-query
xbps-query -l
xbps-query -l|less
xbps-query -l|wc -l
ls /var
ll /var
ls /run/runit/runsvdir/current
ll /run/runit/runsvdir/current
ls -al /run/runit/runsvdir/current
ll /etc/runit/runsvdir/current
ls /etc/runit/runsvdir/current/
ls /etc/runit/runsvdir/
ls /etc/runit/runsvdir/default/
ls -al /etc/runit/runsvdir/default/
vim /etc/sv/dhcpcd
vim /etc/sv/udevd/
ls /run/runit/
ls /run/runit/supervise.dhcpcd/
~~
vim .Xresources 
exit
vim
mount
cd mnt/sda2/artex2000/
cd .config/
ls
~~
la
cd /usr/share/bash-completion/completions/
ls
vim git
zsh
ls /bin|grep sh
ll /bin|grep sh
ll
ll /bin
ll /usr/bin/|grep sh
ls /etc
ll /usr/bin/|grep awesom
lua
~~
ls
find . -name "rc.lua"
which gcc
sudo xbps-install gcc
cd dist/xbps/
ls
cd bin/xbps-install/
ls
vim main.c 
exit
ls /usr/share/fonts/TTF/
~~
mkdir -p .config/awesome
cd .config/awesome/
cp ~/work/dotfiles/awesome/rc.lua .
cp ~/work/dotfiles/awesome/theme.lua .
exit
exit
ls
cd dist/
ls
cd xbps/
ls
vim run-tests 
vim configure 
ls mk
vim Makefile 
ls lib
vim lib/Makefile 
cd lib/fetch/
ls
cat ftp.errors 
ls
cat http.errors 
ls
vim errlist.sh 
~~
cd work/
cp -r ~/mnt/sda2/artex2000/work/misc .
ls
cd misc/
ls
git st
..
cat tmp 
rm tmp 
cd misc/
./fp
ls
./fp
ll
rm fp
./b
cat s
rm st
vim font_pack.c 
./b
vim font_pack.c 
./b
vim font_pack.c 
./b
xbps-query -Rs glfw
sudo xbps-install glfw-devel
xbps-install -Su
sudo xbps-install -Su
ls /usr/lib|grep glfw
ls /usr/
ls /usr/libexec/
git st
git add font_pack.c 
git ci -am "fix strips"
./fp
vim font_pack.c 
./b
vim font_pack.c 
./b
vim font_pack.c 
./b
xbps-query -l |grep awesom
..
ls
cd dotfiles/
ls ~/mnt/sda2/artex2000/.config/
ls ~/mnt/sda2/artex2000/work/cribsheet/
ls ~/mnt/sda2/artex2000/work/cribsheet/awesome/
ls ~/mnt/sda2/artex2000/work/cribsheet/awesome/
ls ~/mnt/sda2/artex2000/work/cribsheet/awesome/
cp -r ~/mnt/sda2/artex2000/work/cribsheet/awesome/ .
cd awesome/
vim theme.lua 
vim rc.lua
exit
ls ~
vim .config/awesome/rc.lua 
exit
vim .config/awesome/rc.lua 
exit
exit
vim .config/awesome/rc.lua 
/\
clear
exit
exit
startx
xrandr --output HDMI1 --right-of VGA1
xrandr
ls -a
cat .Xresources 
xrandr
xrdb
sudo xbps-install xrdb
xrandr
xrdb -merge .Xresources 
startx
startx
startx
startx
startx
startx
1
sudo xbps-install firefox
sudo xbps-install opera
xbsp-query -Rs brave
xbps-query -Rs brave
xbps-query -Rs chrome
xbps-query -Rs firefox
xbps-query -Rs opera
sudo xbps-install surf
ps -a
top
clear
man ps
ps -e
ps ax
ps ax |wc -l
cd work/misc/
ls
vim font_pack.c 
..
..
cd dist/
ls
cd void-packages/
ls
cd srcpkgs/base-files/
ls
vim INSTALL 
vim template 
