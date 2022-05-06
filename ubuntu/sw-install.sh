#!/bin/bash
####################################################################
## NAME
##   sw-install.sh
##       install softwares in a new machine
## NOTE
##   you should configure /etc/apt/source.list first
####################################################################

sudo apt-get install -y \
git vim emacs fcitx scrot cmake g++ gcc chromium-browser \
zsh lftp gnome gnome-shell evince w3m kmplayer xclip \
python virtualbox nmon iconv make ghostscript \
virtualbox-guest-additions-iso virtualbox-guest-utils\
terminator pepperflashplugin-nonfree python-scrapy \
autoconf autogen libtool markdown pandoc latex-beamer \
texlive-latex3 texlive-latex-extra texlive-fonts-recommended \
texlive-fonts-extra texlive-lang-cjk texlive-full \
scm clisp mit-schem libgtk2.0-dev libxpm-dev libgif-dev \
libncurses-dev 

# 下面为 VPS 基本安装软件
sudo apt-get install -y git vim screen zsh nginx

# 安装oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# 修改默认shell,如果出现 You may not change the shell for 'aborn'.
chsh -s /bin/zsh
sudo usermod -s /bin/zsh aborn

# sudo apt-get install -y texlive-full
# sudo apt-get install -y clisp
# sudo apt-get install -y lispbox

# 查看nginx是否安装成功
nginx -v

# 启动nginx
sudo service nginx start

# 安装java11环境
sudo apt install openjdk-11-jdk openjdk-11-jre

# 安装mysql
sudo apt install mysql-server
# 启动mysql
sudo systemctl start mysql.service
# 配置mysql
sudo mysql_secure_installation

/home/sancai/github/smes/docs/dump-sanmes-20220506.sq
/home/sancai/github/smes/docs/sys-log.sql

source /home/sancai/github/smes/docs/mes-materiel.sql

报错:
ERROR 1118 (42000): Row size too large (> 8126). Changing some columns to TEXT or BLOB or using ROW_FORMAT=DYNAMIC or ROW_FORMAT=COMPRESSED may help. In current row format, BLOB prefix of 768 bytes is stored inline.
Query OK, 0 rows affected (0.00 sec)

解决方案:
https://mariadb.com/kb/en/troubleshooting-row-size-too-large-errors-with-innodb/


# reload nginx config
sudo service nginx reload


# 备案  https://beian.aliyun.com/pcContainer/orderdetail?baOrderId=2035082396933
# 网址  http://smes.popkit.org/


https://www.jianshu.com/p/4eb59bb62a32
ip处理
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
