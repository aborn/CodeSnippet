#!/bin/sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DIR="$( cd "$( dirname "$0" )" && pwd )"
CURRENT_DIR=`pwd`

echo "script dir $SCRIPT_DIR"
echo "dir $DIR"
echo "CURRENT_DIR $CURRENT_DIR"
cd $DIR
echo "CURRENT_DIR `pwd`"
echo "parameter $#"

echo "$1"

if [ $# = 1 ];then
    DATE=$1
else
    DATE=`date +%Y-%m-%d-%H-%M-%S`
fi


echo $DATE
