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
python virtualbox nmon iconv make ghostscript \
virtualbox-guest-additions-iso virtualbox-guest-utils\
terminator pepperflashplugin-nonfree python-scrapy \
autoconf autogen libtool markdown pandoc latex-beamer \
texlive-latex3 texlive-latex-extra texlive-fonts-recommended \
texlive-fonts-extra texlive-lang-cjk texlive-full \
scm clisp mit-schem libgtk2.0-dev libxpm-dev libgif-dev \
libncurses-dev 

# sudo apt-get install -y texlive-full
# sudo apt-get install -y clisp
# sudo apt-get install -y lispbox



