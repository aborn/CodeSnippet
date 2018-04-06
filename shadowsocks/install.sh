#!/usr/bin/env bash

sudo apt-get install python-pip
sudo pip install shadowsocks


sudo ssserver -p 443 -k password -m aes-256-cfb --user nobody -d start
https://pypi.python.org/packages/02/1e/e3a5135255d06813aca6631da31768d44f63692480af3a1621818008eb4a/shadowsocks-2.8.2.tar.gz
sudo ./server.py -p PORT -k PASSWORD -m aes-256-cfb --user nobody -d start
#md5=65dc9b47fbf7534576fad2145a340982
