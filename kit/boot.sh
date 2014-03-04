#!/bin/bash
###################################################
# NAME
#   boot.sh
#       boot all service when machine start up
#       nginx, php5, redis 
#
# NOTE
#   please all this script in /etc/rc.local
# 
# AUTHOR
#   Aborn Jiang (aborn.jiang@gmail.com)
#
###################################################

NGINXPATH="/home/vagrant/nginx"
PHPPATH="/home/vagrant/php5"
REDISPATH="/home/vagrant/sw/redis-2.8.5"
echo "begin to boot up service nginx php-fpm and redis"
sudo ${NGINXPATH}/sbin/nginx 
sudo ${PHPPATH}/sbin/php-fpm
sudo ${REDISPATH}/src/redis-server ${REDISPATH}/redis.conf 
echo "all serivces boot up finish."
