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
echo "postinstall start."
VAGRANTPATH="/vagrant_data"

# change source list
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp ${VAGRANTPATH}/sources.list /etc/apt/
sudo apt-get update

echo
echo "install some necessary software."
sudo apt-get install -y \
    emacs zsh vim g++ build-essential \
    make git ghostscript

echo "postinstall finished."
echo "-----------------------------------"
echo