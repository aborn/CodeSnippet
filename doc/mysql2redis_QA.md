mysql2redis_QA
==========

## 安装mysql2redis遇到的问题解决之道

### 安装lib_mysqludf_json遇到的问题
#### 安装过程
1. 下载:git clone https://github.com/mysqludf/lib_mysqludf_json.git
2. 将.so文件copy到mysqlplug_dir下
3. 在mysql中注册函数:mysql -uroot -p < install_json_udf.sql

####lib_mysqludf_json.so: wrong ELF class: ELFCLASS32)
产生原因是: lib_mysqludf_json.so 是32位的文件  
解决方法：重新编译  
gcc -Wall -m64 -I/data/greentea/mysql/mysql8801/include -I. -shared
lib_mysqludf_json.c -o ./lib_mysqludf_json.so -fPIC  
注意：-I 为mysql的include目录

### 安装hiredis
#### 安装过程
1. 下载:git clone https://github.com/redis/hiredis.git
2. 编译: cd hiredis; make
4. 安装：sudo make install
3. 将libhiredis.so文件copy到mysqlplugin_dir下

### 安装mysql2redis
#### 安装过程
1. 下载: git clone https://github.com/aborn/mysql2redis.git
2. 修改Makefile
   * mysql_config 所在目录
   * 修改PLUGINDIR参数
   * 添加mysql的include 如-I/data/greentea/mysql/mysql8801/include
3. 编译：cd mysql2redis; make
4. 安装：将lib_mysqludf_redis_v2.so文件copy到mysqlplugin_dir下
5. 在mysql中注册函数:mysql -uroot -p < install

#### lib_mysqludf_redis.c:271:13: error: format not a string literal
     and no format arguments
将271行的 fprintf(pFile, buf) 改为 fputs(buf, pFile)

#### libhiredis.so.0.10: cannot open shared object file
执行以下命令:  
sudo cp /usr/local/lib/libhiredis.so.0.10 /lib

