#!/bin/bash
###############################################
# build six instances for clustering
###############################################

nodes=6
for (( i=0; i<${nodes}; i++ ))
do
    port=$(( i+7000 ))
    echo "build an instance, its port=${port}"
    ./create-instance.sh ${port}
    if [ $? -eq 0 ];then
        echo "build ${port} success." 
    else
        echo "build ${port} failed." 
    fi
done
