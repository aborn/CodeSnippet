#!/bin/bash
#####################################################
# NAME
#   gbk2utf8.sh
#      conv file encoding form gbk to utf-8 or reverse
# USAGE
#   ./gbk2utf8.sh FILENAME
#   ./gbk2utf8.sh -r FILENAME
#####################################################

if [ $# -eq 0 ];then
    echo "need filename for argument."
    exit 1;
fi

if [ "$1" == "-r" ];then
#    echo "-r option"
    [ $# -eq 1 ] && echo "need filename." && exit 1;
    filename=$2
    sourcecode="UTF-8"
    descode="GBK"
else 
#    echo "default option."
    filename=$1
    sourcecode="GBK"
    descode="UTF-8"
fi

if [ -f ${filename} ];then
    echo "file name: ${filename}  ${sourcecode} to ${descode}"
    echo "iconv -f ${sourcecode} -t ${descode} ${filename} -o \"${filename}.out\" >>/dev/null"
    iconv -f ${sourcecode} -t ${descode} ${filename} -o "${filename}.out" >>/dev/null
    mv "${filename}.out" ${filename}
    echo "conv file ${filename} form ${sourcecode} to ${descode} succes."
else
    echo "file: ${filename} does not exists."
    exit 1;
fi


