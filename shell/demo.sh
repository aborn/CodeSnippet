#!/bin/sh

echo "parameter $#"

echo "$1"

if [ $# = 1 ];then
    DATE=$1
else
    DATE=`date +%Y-%m-%d-%H-%M-%S`
fi


echo $DATE
