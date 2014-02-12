#!/bin/bash
################################################################
#  NAME
#    postinstall.sh  post install some sw and configure after
#                vagrant virtual machine installed for ubuntu
#  NOTE
#    the base box is ubuntu 12.04 lts, which is download from
#        http://files.vagrantup.com/precise32.box
################################################################
echo "postinstall start."

VAGRANTPATH="/vagrant_data"

# change source list
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp ${VAGRANTPATH}/sources.list /etc/apt/
sudo apt-get update

echo
echo "-----------------------------------"
echo "install some necessary software."
sudo apt-get install -y \
    emacs zsh vim g++ build-essential \
    make git ghostscript

iUser="`whoami`"
echo "now user: ${iUser}"
if [ ${iUser} = "root" ];then
    su vagrant
    echo "changed user, now: `whoami`"
fi

# copy files
cp -r ${VAGRANTPATH}/sw ~

echo
echo "-----------------------------------"
echo "configure this virtual machine"
mkdir ~/github/
cd ~/github/
git clone https://github.com/aborn/configure.git
chmod u+x  ~/github/configure/configure
~/github/configure/configure

echo
echo "-----------------------------------"
echo "configure emacs."
git clone https://github.com/aborn/emacs.lite.git
chmod u+x ~/github/emacs.lite/sh/configure
~/github/emacs.lite/sh/configure

