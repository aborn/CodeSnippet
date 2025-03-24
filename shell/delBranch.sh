#!/bin/sh

# 删除分支
echo "脚本名称: $0"


# 检查是否传入了参数
if [ $# -eq 0 ]; then
    echo "错误：未传入要删除的分支名。用法: $0 <分支名>"
    exit 1
fi

# 打印第一个参数
echo "----------------"
git branch | grep -q "$1"
if [ $? -eq 0 ]; then
    echo "本地分支 $1 存在，删除它"
    git branch --delete $1
else
    echo "本地分支 $1 不存在，无需处理"
fi

echo "----------------"
git branch -r | grep -q "origin/feature/$1"
if [ $? -eq 0 ]; then
    echo "远程分支 $1 存在，删除它"
    git push origin --delete feature/$1
else
    echo "远程分支 $1 不存在，无需处理"
fi
