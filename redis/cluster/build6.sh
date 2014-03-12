#!/bin/bash
###############################################
# build six instances for clustering
###############################################

for (( i=0; i<6; i++ ))
do
    port=$(( i+7000 ))
    echo "build an instance, its port=${port}"
    ./create-instance.sh ${port}
    ## rm -r ${port}
done
