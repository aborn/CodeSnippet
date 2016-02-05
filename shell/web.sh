#!/usr/bin/env bash

# web压力测试

# webbench
# webbench -c 并发数 -t 运行测试时间 URL
webbench -c 5000 -t 120 http://localhost:4000/


# siege
#  安装 brew install siege
#  siege -c 并发数 -t 运行测试时间 URL
siege -c 1000 -t 5s http://localhost:4000/
