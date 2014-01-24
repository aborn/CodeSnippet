#!/bin/bash
###############################################################
## NAME
##    install.sh       install nginx in server
##
## USAGE
##    ./install.sh
###############################################################


## following is recommanded configure and modules.
./configure  \
    --prefix=/home/aborn/nginx \
    --sbin-path=/home/aborn/nginx/sbin/nginx \
    --conf-path=/home/aborn/nginx/conf/nginx.conf \
    --pid-path=/home/aborn/nginx/pid/nginx.pid   \
    --error-log-path=/home/aborn/nginx/log/error.log \
    --http-log-path=/home/aborn/nginx/log/access.log \
    --user=aborn --group=aborn \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-pcre=/home/aborn/sw/pcre-8.34 \
    --with-zlib=/home/aborn/sw/zlib-1.2.8 \
    --with-openssl=/home/aborn/sw/openssl-1.0.1c 

## compile nginx form source code
make

## install nginx
make install
    
