#!/bin/bash
###################################################
# for official install vagrant
###################################################

# for linux-32 ubuntu
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.3_i686.deb
dpkg -i vagrant_1.4.3_i686.deb
vagrant init precise32 http://files.vagrantup.com/precise32.box
vagrant up
