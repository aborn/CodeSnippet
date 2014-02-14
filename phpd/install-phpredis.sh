#!/bin/bash
#############################################
# install phpredis 
#############################################

wget https://github.com/nicolasff/phpredis/tarball/master
cd src
~/php5/bin/phpize
./configure --with-php-config=/home/vagrant/php5/bin/php-config
