#!/bin/bash
################################################################
#  NAME
#    postinstall.sh  post install some sw in
#                vagrant virtual machine 
#  NOTE
#    the base box is ubuntu 12.04 lts, which is download from
#        http://files.vagrantup.com/precise32.box
################################################################
echo
echo "-----------------------------------"
VAGRANTPATH="/vagrant_data"

# change source list
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp ${VAGRANTPATH}/sources.list /etc/apt/
sudo apt-get update

echo
echo "-----------------------------------"
echo "postinstall start."
echo "install some necessary software."
sudo apt-get install -y \
    emacs zsh vim g++ build-essential \
    make git ghostscript autoconf unzip

# install php5
# sudo apt-get install php5-common php5-cli php5-fpm
# compile install php3 need to install following,
./php-deps.sh

echo "postinstall finished."
echo "-----------------------------------"
echo
