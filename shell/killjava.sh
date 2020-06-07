#!/bin/sh

## 干掉java进程
sudo kill -9 `ps -ef |grep java|grep -v grep |awk '{print $2}'`
