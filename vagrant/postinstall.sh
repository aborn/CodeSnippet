#!/bin/bash
################################################################
#  NAME
#    postinstall.sh  post install some sw and configure after
#                vagrant virtual machine installed for ubuntu
#  NOTE
#    the base box is ubuntu 12.04 lts, which is download from
#        
################################################################
echo "postinstall start."

VAGRANTPATH="/vagrant"

# change source list
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp ${VAGRANTPATH}/sources.list /etc/apt/
sudo apt-get update

# install some necessary sowftware
sudo apt-get install -y emacs zsh
