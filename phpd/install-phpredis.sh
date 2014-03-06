#!/bin/bash
#############################################
# install phpredis 
#############################################

sudo apt-get install autoconf
wget https://github.com/nicolasff/phpredis/tarball/master
cd src
~/php5/bin/phpize
./configure --with-php-config=/home/vagrant/php5/bin/php-config
make
make install

## then  add two lines in php5/etc/php.in
# extension=redis.so
# extension_dir = "/home/aborn/php5/lib/php/extensions/no-debug-non-zts-20121212"