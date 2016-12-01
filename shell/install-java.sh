#!/usr/bin/env bash
# ----------------------------------------------
# ubuntu 安装oracle-java
# install oracle java7/java8 in ubuntu linux
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

## 强制切换到java-7
sudo update-java-alternatives -s java-7-oracle

# add JAVA_HOME and JAVA_BIN env in .bshrc or .zshrc
# export JAVA_HOME=/usr/lib/jvm/java-7-oracle
# export JAVA_BIN=$JAVA_HOME/bin
