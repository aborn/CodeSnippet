#!/bin/bash
# shell 的常用语法

# for 循环
for item in `ls`;
do
	  echo ${item} ;
done

# 判断文件夹是否存在
if [ ! -d "/data/" ];then
    mkdir /data
else
    echo "文件夹已经存在"
fi

# 判断文件是否存在
if [ ! -f "/data/filename" ];then
    echo "文件不存在"
else
    rm -rf /data/filename
fi

# 常见的判断
# -e filename  如果 filename存在，则为真  [ -e /var/log/syslog ]
# -d filename  如果 filename为目录，则为真  [ -d /tmp/mydir ]
# -f filename  如果 filename为常规文件，则为真  [ -f /usr/bin/grep ]
# -L filename  如果 filename为符号链接，则为真  [ -L /usr/bin/grep ]
# -r filename  如果 filename可读，则为真  [ -r /var/log/syslog ]
# -w filename  如果 filename可写，则为真  [ -w /var/mytmp.txt ]
# -x filename  如果 filename可执行，则为真  [ -L /usr/bin/grep ]
# filename1-nt filename2  如果 filename1比 filename2新，则为真  [ /tmp/install/etc/services -nt /etc/services ]
# filename1-ot filename2  如果 filename1比 filename2旧，则为真  [ /boot/bzImage -ot arch/i386/boot/bzImage ]
