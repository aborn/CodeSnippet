#!/bin/sh

# 删除分支
echo "脚本名称: $0"


# 检查是否传入了参数
if [ $# -eq 0 ]; then
    echo "错误：未传入要删除的分支名。用法: $0 <分支名>"
    exit 1
fi

# 打印第一个参数
echo "删除本地分支: $1"

git branch --delete $1

echo "删除远程分支: $1"

git push origin --delete $1
