#!/bin/bash
#################################################
# clear all instances for clustering
#################################################

for (( i=0; i<6; i++ ))
do 
    port=$(( i+7000 ))
    echo "warning: clear an instance, its port=${port}"
    cd ${port}
    if [ -f redis.pid ];then
        kill -9 `cat redis.pid`
        cd ..
        rm -r ${port}
        echo "clear ${port} success.!"
    else
        cd ..
        echo "doesn't exist redis.pid, clear failed."
    fi
done