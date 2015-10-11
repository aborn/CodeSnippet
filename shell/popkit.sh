#!/usr/bin/env bash
#################################
# 用于popkit的自动更新
#################################

echo "-----------------------"
echo "start exectue:"
echo `date`
cd ~/github/popkit/
echo `pwd`
git pull
echo `date`
echo "finished!"
echo "-----------------------"

