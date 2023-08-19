#!/bin/sh

## 干掉端口号为 xx的 java程序
# sudo kill -9 `lsof -nP -i:8060 |grep java|awk '{print $2}'`

sudo kill -9 `lsof -nP -i:8010 |grep java|awk '{print $2}'`
sudo kill -9 `lsof -nP -i:8081 |grep java|awk '{print $2}'`
sudo kill -9 `lsof -nP -i:8082 |grep java|awk '{print $2}'`
sudo kill -9 `lsof -nP -i:8086 |grep java|awk '{print $2}'`
sudo kill -9 `lsof -nP -i:8088 |grep java|awk '{print $2}'`
