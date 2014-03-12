#!/bin/bash
######################################################
# NAME
#  create-cluster.sh
#        set-up redis cluster(distributed) environment
#
# VERSION
#  v0.1   2014-03-12
######################################################

ABSPATH=$(cd $(dirname $0); pwd);
cd ${ABSPATH}

nodes=6
IPADDR="192.168.122.10"

## create slaves.node file contents
echo "# this file contains all slave redis node" > slaves.node
echo "# ip_address:port" >> slaves.node
for (( i=0; i<${nodes}; i++ ))
do
    port=$(( i+7000 ))
    echo "${IPADDR}:${port}" >> slaves.node
done

## pls modify TRIBPATH depen on your system
TRIBPATH="/home/vagrant/sw/redis-3.0.0-beta1/src" 
SLAVES=$(cat slaves.node |grep -v '#')

## boot redis-cluster using redis-trib.rb
${TRIBPATH}/redis-trib.rb create --replicas 1 ${SLAVES}
echo $SLAVES