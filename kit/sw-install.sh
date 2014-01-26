#!/bin/bash
####################################################################
## NAME
##   sw-install.sh
##       install softwares in a new machine
## NOTE
##   you should configure /etc/apt/source.list first
####################################################################

sudo apt-get install -y \
git vim emacs fcitx scrot cmake g++ gcc chromium-browser \
zsh lftp gnome gnome-shell evince w3m kmplayer xclip \
python virtualbox nmon

# sudo apt-get install -y texlive-full
# sudo apt-get install -y clisp
# sudo apt-get install -y lispbox



