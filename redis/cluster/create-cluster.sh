#!/bin/bash
######################################################
# NAME
#  create-cluster.sh
#        set-up redis cluster(distributed) environment
#
# VERSION
#  v0.1   2014-03-11
######################################################

ABSPATH=$(cd $(dirname $0); pwd);
cd ${ABSPATH}

# pls modify TRIBPATH depen on your system
TRIBPATH="/home/vagrant/sw/redis-3.0.0-beta1/src" 
SLAVES=$(cat slaves.node |grep -v \#)

# boot redis-cluster using redis-trib.rb
#${TRIBPATH}/redis-trib.rb create --replicas 1 ${SLAVES}
echo $SLAVES