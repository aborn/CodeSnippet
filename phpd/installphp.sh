#!/bin/bash
#############################################
# install php
#############################################

# please install php-deps before 

make clean;
./configure \
	--prefix=/home/vagrant/php5 \
    --with-config-file-path=/home/vagrant/php5/etc \
    --with-curl \
    --with-pear \
    --with-gd \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib \
    --with-xpm-dir \
    --with-freetype-dir \
    --with-t1lib \
    --with-mcrypt \
    --with-mhash \
    --with-mysql \
    --with-mysqli \
    --with-pdo-mysql \
    --with-openssl \
    --with-xmlrpc \
    --with-xsl \
    --with-bz2 \
    --with-gettext \
    --with-fpm-user=arch \
    --with-fpm-group \
    --with-t1lib=/usr/local/share/t1lib/ \
    --enable-fpm \
    --enable-exif \
    --enable-wddx \
    --enable-zip \
    --enable-bcmath \
    --enable-calendar \
    --enable-ftp \
    --enable-mbstring \
    --enable-soap \
    --enable-sockets \
    --enable-shmop \
    --enable-dba \
    --enable-sysvmsg \
    --enable-sysvsem \
    --enable-sysvshm
make
make test
make install

# after install
# sudo cp php.ini-development /home/vagrant/php5/etc/php.ini
# sudo cp sapi/fpm/init.d.php-fpm.in /home/vagrant/php5/etc/init.d.php-fpm
# sudo cp sapi/fpm/php-fpm.conf.in /home/vagrant/php5/etc/php-fpm.conf 