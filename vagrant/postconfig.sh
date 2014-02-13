#!/bin/bash
###################################################
# NAME
#   postconfig.sh post configure after vagrant
#       virtual machine installed for ubuntu
# NOTE
# 
###################################################

iUser="`whoami`"
if [ ${iUser} = "root" ];then
    echo "running user is root, exit now!"
    exit 1;
fi

iHome="/home/vagrant"
VAGRANTPATH="/vagrant_data"

# copy files
cp -r ${VAGRANTPATH}/sw ${iHome}

echo
echo "postconfig start."
echo
echo "-----------------------------------"
echo "configure this virtual machine"
echo "user:`whoami`, home=$HOME"

if [ ! -d ${iHome}/github/ ];then
    mkdir ${iHome}/github/
fi

cd ${iHome}/github/
git clone https://github.com/aborn/configure.git
chmod u+x  ${iHome}/github/configure/configure
${iHome}/github/configure/configure

echo
echo "-----------------------------------"
echo "configure emacs."
git clone https://github.com/aborn/emacs.lite.git
chmod u+x ${iHome}/github/emacs.lite/sh/configure
${iHome}/github/emacs.lite/sh/configure


echo "postconfig finished."
