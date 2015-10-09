#!/usr/bin/env bash

# grep的或操作，查看当前打开的网络链接
lsof -i | grep -E "(LISTEN|ESTABLISHED)"

# 列出当前网络打开的端口号与进程的对应关系
lsof -i :portNumber
