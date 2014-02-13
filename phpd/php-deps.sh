#!/bin/bash
#################################
# install php depends
#################################

# bzip2 need src install
# cd bzip2; make; sudo make install
sudo apt-get install -y libxml2 libxml2-dev  \
libcurl4-openssl-dev curl openssl bzip2   \
libmcrypt-dev  libjpeg-dev  libpng12-dev \
libxpm-dev  libfreetype6-dev libt1-dev \
libmcrypt-dev libmysql++-dev libxslt1-dev

