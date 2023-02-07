#!/usr/bin/env bash
# 常用操作命令
############################################
# grep的或操作，查看当前打开的网络链接
lsof -i | grep -E "(LISTEN|ESTABLISHED)"

# 列出当前网络打开的端口号与进程的对应关系
lsof -i :portNumber

# 安装 (跳过测试)
mvnshell install -DskipTests

# 列出mvn的依赖树
mvn dependency:tree

# 手动安装jar包到本地
mvn install:install-file -Dfile=/Users/aborn/Downloads/joda-time-2.9.6.jar -DgroupId=joda-time -DartifactId=joda-time -Dversion=2.9.6 -Dpackaging=jar -DgeneratePom=true

# 检查网络端口监听也可以用(linux only)
sudo netstat -tupln

# mac下查看端口号占用情况，如以下查看端口号20881被占用情况
# https://stackoverflow.com/questions/4421633/who-is-listening-on-a-given-tcp-port-on-mac-os-x
sudo lsof -nP -i:20881

# grep查找，递归查找关键字 Redis
grep -r  "Redis" .
# 对于.gz包的查找
zgrep "xxx" /path/to/zipfile/file.2016-09-10.gz

# 查找文件
sudo find / -name erl_crash.dump
sudo find / -name Gemfile

# 创建用户及创建用户对应的home目录
useradd -m USERNAME -d /path/to/home   # useradd -m sancai -d /home/sancai
passwd USERNAME
usermod -d /home/path/to/newhome username
sudo adduser username sudo  # 添加给用户添加sudo group

# change zsh
chsh -s $(which zsh)
# You may not change the shell for 'popkit'
sudo usermod -s /bin/zsh popkit


# 按文件大小排序
ls -lhtr --sort=size
# 查看当前目录下所占空间
du -h --max-depth=0 .  # linux
du -h -d=0 .           # mac
du -h --max-depth=1 .  |sort -h   # 从小到大排序
# 找到当前文件夹下大于10M的文件
find . -type f -size +10M
find . -maxdepth 1 -type f -size +10M  # 递归
# 找出当前builds目录下,时间超过7天的文件并删除之(不加 -delete选项表示查看)
sudo find ./builds -mtime +7 -type f -delete

# 解压.gz文件
gunzip -c abc.gz >abc16
# 解压.xz文件
xz -d <filename>.tar.xz
# 解压.tar文件
tar -xvf emacs-25.0.95.tar
# 打.tar包
tar -cvf FileName.tar DirName

# 查看上一条命令执行的状态 determine last command status
echo $?

# 用curl下载远程文件
curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.0.2.zip

# 修改用户密码
sudo passwd USERNAME

# 拨出U盘
sudo umount /dev/sdb1


https://unix.stackexchange.com/questions/151689/how-can-i-instruct-yum-to-install-a-specific-version-of-package-x


# 查看Log文件a.log 在 2018-05-15T13:40:00+08:00 到 2018-05-15T13:55:00+08:00 的日志，并将其保存在out.log文件中
sed -n '/2018-05-15T13:40:00+08:00/,/2018-05-15T13:55:00+08:00/p' a.log >> out.log

screen mix eeb.deploy  # C-a d
# screen -ls
# screen -r id
# screen -X -S id quit #(Attached)

# 通过ls找到需要的文件名，再将其移动到outdir路径下
ls |grep "keyword"| while read f; do mv "$f" outdir; done
eslint --fix Home.js
eslint --fix --ext .js src/


# npm树结构
npm list
npm list --depth=[depth]  # 深度

# 具体某个包的依赖
npm list [dependency]

# procs 代替 ps
cargo install procs

# dust 代替 du
cargo install du-dust

# exa 代替 ls
cargo install exa

# bottom 代替 top  (btm)
cargo install bottom

# bat 代替cat
cargo install bat

# 列出当前源&切换源
nrm ls
nrm use

## 软连接，将/opt目录下软件连接到/usr下
ln -s  /opt/homebrew/bin/ispell /usr/local/bin/ispell
