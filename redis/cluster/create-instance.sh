#!/bin/bash
#######################################################
# NAME
#    ./create-instance.sh
#    create an create a redis instance (node)
# 
# USAGE
#     create-instance.sh PORT
# 
# VERSION
#   v 0.1  2014-03-12
#######################################################

if [ "$#" -eq 0 ];then
    echo "error: need port for input."
    echo "USAGE:"
    echo "     create-instance.sh PORT"
    exit 1
fi

PORT=$1
if [[ ! $PORT =~ ^[0-9]+$ ]];then
    echo "error: port must be a number."
    exit 1
fi

## create instance directory and configure file
echo "instance port is $1"
mkdir -p $PORT
cd $PORT

cpath=`pwd`
pidpathsed="${cpath}/redis.pid"
pidpath=$(echo ${pidpathsed} |sed -e 's/\//\\\//g' ) 

echo "pidpath=${pidpathsed}"
cat ../redis-template.conf |sed -e "s/PORTVALUE/${PORT}/g" \
    | sed -e "s/PIDFILEPATH/${pidpath}/g" > redis.conf

## boot-up the instance

../redis-server redis.conf

