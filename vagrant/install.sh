#!/bin/bash
###############################################################
## NAME
##    install.sh       install nginx in server
##
## USAGE
##    ./install.sh
###############################################################


## following is recommanded configure and modules.
iUser="`whoami`"

make clean

./configure  \
    --prefix=/home/${iUser}/nginx \
    --sbin-path=/home/${iUser}/nginx/sbin/nginx \
    --conf-path=/home/${iUser}/nginx/conf/nginx.conf \
    --pid-path=/home/${iUser}/nginx/pid/nginx.pid   \
    --error-log-path=/home/${iUser}/nginx/log/error.log \
    --http-log-path=/home/${iUser}/nginx/log/access.log \
    --user=${iUser} --group=${iUser} \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-pcre=/home/${iUser}/sw/pcre-8.34 \
    --with-zlib=/home/${iUser}/sw/zlib-1.2.8 \
    --with-openssl=/home/${iUser}/sw/openssl-1.0.1c 

## compile nginx form source code
make

## install nginx
make install
    
