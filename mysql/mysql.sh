
# ubuntu mysql password reset
# https://help.ubuntu.com/community/MysqlPasswordReset


# 停止mysql服务
sudo /etc/init.d/mysql stop
sudo /etc/init.d/mysql start

# ubuntu中删除mysql -- remove mysql from ubuntu
sudo apt-get purge mysql-server mysql-client mysql-common mysql-server-core-5.6 mysql-client-core-5.6 mysql-server-core-5.7 mysql-client-core-5.7
sudo apt-get remove --purge mysql-server mysql-client mysql-common

sudo rm -rf /etc/mysql /var/lib/mysql

sudo apt-get autoremove
sudo apt-get autoclean

# ubuntu install mysql
sudo apt-get install mysql-server mysql-client

# 学用mysql命令

# 查看数据引擎
show engines;

# 注意: /etc/mysql/mysql.conf.d/mysqld.cnf
# bind-address           = 127.0.0.1

# centos安装mysql client
yum install mysql
