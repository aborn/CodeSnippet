#!/bin/bash
##################################################################
# NAME
#    rsyncclient.sh  ---- running in client machine, which
#                      is used to backup data in client machine
#
# USAGE 
#    ./rsyncclient.sh
#
# AUTHOR
#   Aborn Jiang (aborn.jiang@gmail.com)
#
# NOTE    
#   pls configure the file client.conf and rsyncd.scrt
# 
##################################################################
ABSPATH=$(dirname $0)
source ${ABSPATH}/client.conf

function get-user-pwd()
{
# obtain usrname and password
    iUSR=$(cat ${ABSPATH}/rsyncd.scrt|tr -d ' ' |grep  -v "^$" | \
        grep -v "^#"|head -n 1|awk -F : '{print $1}')
    iPWD=$(cat ${ABSPATH}/rsyncd.scrt|tr -d ' ' |grep  -v "^$" | \
        grep -v "^#"|head -n 1|awk -F : '{print $2}')
    if [ -z ${iUSR} ] || [ -z ${iPWD} ];then
        echo "iUSR=$iUSR   iPWD=$iPWD" 
        echo "rsyncd.scrt format illegal, please check!";
        exit -1;
    fi

# produce password file
    echo "$iPWD" > ${ABSPATH}/.pass
    chmod 600 ${ABSPATH}/.pass
    [ ! -d $BACKUPPATH ] && mkdir -p ${BACKUPPATH}
}


function backup-module()
{
# print key information
    iModule=$1
    echo
    echo "---------------------------------------------------"
    echo "---- backup module ${iModule}@${SERVERIP} begin "
    echo "---- TIME=`date`----"
    echo "ABSPATH=${ABSPATH}"   
    echo "BACKUPPATH=${BACKUPPATH}"
    echo "iUSR=$iUSR   iPWD=$iPWD" 
    echo "OPTIONS=${OPTIONS}"
    iModuleBackpath=${BACKUPPATH}/${iModule};
    [ ! -d ${iModuleBackpath} ] && mkdir -p ${iModuleBackpath}

# begin backup
    rsync  ${OPTIONS}  ${iUSR}@${SERVERIP}::${iModule}  ${iModuleBackpath} \
        --password-file=${ABSPATH}/.pass
    if [ $? != 0 ];then
        echo "---- backup module ${iModule}@${SERVERIP} failed."
    else
        echo "---- backup module ${iModule}@${SERVERIP} succuess. "
    fi
    echo "---- TIME=`date`----"
    echo "---------------------------------------------------"
    echo 
}

function __main__()
{
    get-user-pwd
    for md in $MODULE
    do
        backup-module $md
    done
}

__main__