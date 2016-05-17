#!/usr/bin/env bash

# grep的或操作，查看当前打开的网络链接
lsof -i | grep -E "(LISTEN|ESTABLISHED)"

# 列出当前网络打开的端口号与进程的对应关系
lsof -i :portNumber

# 列出mvn的依赖树
mvn dependency:tree

# 检查网络端口监听也可以用(linux only)
sudo netstat -tupln

# grep查找，递归查找关键字 Redis
grep -r  "Redis" .

# 查找文件
sudo find / -name erl_crash.dump

# 创建用户
useradd -m USERNAME
passwd USERNAME

# change zsh
chsh -s $(which zsh)
# You may not change the shell for 'popkit'
sudo usermod -s /bin/zsh popkit
