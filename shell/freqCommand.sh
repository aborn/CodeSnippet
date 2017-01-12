#!/usr/bin/env bash
# 常用操作命令
############################################
# grep的或操作，查看当前打开的网络链接
lsof -i | grep -E "(LISTEN|ESTABLISHED)"

# 列出当前网络打开的端口号与进程的对应关系
lsof -i :portNumber

# 列出mvn的依赖树
mvn dependency:tree

# 手动安装jar包到本地
mvn install:install-file -Dfile=/Users/aborn/Downloads/joda-time-2.9.6.jar -DgroupId=joda-time -DartifactId=joda-time -Dversion=2.9.6 -Dpackaging=jar -DgeneratePom=true

# 检查网络端口监听也可以用(linux only)
sudo netstat -tupln

# grep查找，递归查找关键字 Redis
grep -r  "Redis" .
# 对于.gz包的查找
zgrep "xxx" /path/to/zipfile/file.2016-09-10.gz

# 查找文件
sudo find / -name erl_crash.dump
sudo find / -name Gemfile

# 创建用户及创建用户对应的home目录
useradd -m USERNAME
passwd USERNAME

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
