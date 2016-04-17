#!/usr/bin/env bash
# ----------------------------------------------
# ubuntu 安装oracle-java
# ----------------------------------------------

# for unbutntu 14
sudo apt-get install software-properties-common

# unbuntu加入java源
sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update

# 安装java-7
sudo apt-get install oracle-java7-installer

# 安装java-8
sudo apt-get install oracle-java8-installer 
