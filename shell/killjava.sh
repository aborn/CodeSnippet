#!/bin/sh

## 干掉java进程
sudo kill -9 `ps -ef |grep java|grep -v grep |awk '{print $2}'`


## 干掉端口号为 xx的 java程序
# sudo kill -9 `lsof -nP -i:8060 |grep java|awk '{print $2}'`
