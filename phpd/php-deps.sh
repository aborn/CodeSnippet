#!/bin/bash
#################################
# install php depends
#################################

# bzip2 need src install
# cd bzip2; make; sudo make install
wget http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz
tar zxvf bzip2-1.0.6.tar.gz
cd cd bzip2-1.0.6/
make
sudo make install

## install other depends 3pp
sudo apt-get update
sudo apt-get install -y libxml2 libxml2-dev  \
libcurl4-openssl-dev curl openssl \
libmcrypt-dev  libjpeg-dev  libpng12-dev \
libxpm-dev  libfreetype6-dev libt1-dev \
libmcrypt-dev libmysql++-dev libxslt1-dev

## for redhat 5.9
sudo yum install libmcrypt libmcrypt-devel -y
sudo yum install t1lib t1lib-devel -y

## for yum software source
## wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
