#!/usr/bin/env bash
#####################################
# 用于popkit的自动更新
# 触发时机为：当popkit项目有push操作时
#####################################

echo "-----------------------"
echo "start exectue:"
echo `date`
cd ~/github/popkit/
echo `pwd`
git pull
echo `date`
echo "finished!"
echo "-----------------------"

