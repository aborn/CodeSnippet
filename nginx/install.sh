#!/bin/bash
###############################################################
# NAME
#    install.sh       install nginx in server
#
# USAGE
#    ./install.sh
# 
# AUTHOR
#    Aborn Jiang (aborn.jiang@gmail.com)
#
# VERSION
#    v0.1   2014-03-01
###############################################################

## download the latest version 1.4.5 (2014-2-11)
## wget http://nginx.org/download/nginx-1.4.5.tar.gz
## unzip nginx-1.4.5.zip

## iUser="`whoami`"
iUser="vagrant"
INS_PATH="/home/${iUser}"
DPS_PATH="/vagrant_data/sw"    # depend 3pp path

make clean

## depends modules
## wget http://sourceforge.net/projects/pcre/files/pcre/8.34/pcre-8.34.zip
## wget http://zlib.net/zlib-1.2.8.tar.gz
## wget http://www.openssl.org/source/openssl-1.0.1c.tar.gz
## wget http://www.memcached.org/files/memcached-1.4.17.tar.gz
## following is recommanded configure and modules.
cp ${DPS_PATH}/memcached-1.4.17/configure ${DPS_PATH}/memcached-1.4.17/config
./configure  \
    --prefix=${INS_PATH}/nginx \
    --sbin-path=${INS_PATH}/nginx/sbin/nginx \
    --conf-path=${INS_PATH}/nginx/conf/nginx.conf \
    --pid-path=${INS_PATH}/nginx/pid/nginx.pid   \
    --error-log-path=${INS_PATH}/nginx/log/error.log \
    --http-log-path=${INS_PATH}/nginx/log/access.log \
    --user=${iUser} --group=${iUser} \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-pcre=${DPS_PATH}/pcre-8.34 \
    --with-zlib=${DPS_PATH}/zlib-1.2.8 \
    --with-openssl=${DPS_PATH}/openssl-1.0.1c  
#    --add-module=${DPS_PATH}/memcached-1.4.17

## compile nginx form source code
make

## install nginx
[ -f install ] && rm install 
make install

