
# ubuntu mysql password reset
# https://help.ubuntu.com/community/MysqlPasswordReset


# mysql服务操作
sudo /etc/init.d/mysql stop
sudo /etc/init.d/mysql start
sudo /etc/init.d/mysql restart   #重启

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

# 设置远程可访问mysql
# 注意: /etc/mysql/mysql.conf.d/mysqld.cnf
# bind-address           = 127.0.0.1

# centos安装mysql client
yum install mysql

# mysql login
mysql -u codepulse -p
