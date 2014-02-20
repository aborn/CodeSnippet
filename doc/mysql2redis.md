mysql2redis
==========

## STATUS
draft

## INTRO
This doc tells users how to install mysql2redis in linux
env. Mysql2redis is mysql UDF(user-defined function) dynamic library,
which is used to update redis when mysql update.

## DENPENDENCY
1. jemalloc
2. apr
3. apr-util
4. hiredis
5. lib_mysqludf_json

## INSTALL DEPS
* install jemalloc
  1. sudo apt-get install libjemalloc1 libjemalloc-dev (Ubuntu)
  2. or source install, which can be download from
     [here](http://www.canonware.com/download/jemalloc/jemalloc-3.5.0.tar.bz2).
* install apr
  1. download: wget http://mirror.bit.edu.cn/apache//apr/apr-1.5.0.tar.gz
  2. ./configure
  3. make
  4. make test
  5. sudo make install
* install apr-util
  1. download
  2.  ./configure --with-apr=/usr/local/apr
  3. make
  4. sudo make install
* install lib_mysqludf_json
  1. download: wget https://github.com/mysqludf/lib_mysqludf_json
  2. copy lib_mysqludf_json.so to /usr/lib/mysql/plugin
* install hiredis
  1. download: git clone https://github.com/redis/hiredis.git
  2. cd hiredis;
  3. make
  4. sudo make install #or copy libhiredis.so in mysql plugin dir
* install mysql2redis
  1. download git clone https://github.com/aborn/mysql2redis.git
  2. cd mysql2redis
  3. modify Makefile
     * make Makefile sytax right.
     * modify mysqlplugindir (PLUGINDIR)
  4. make

## QA

#### Install apr error
1.  /usr/local/apr/include/apr-1/apr.h:358:1: error: unknown type name
  ‘off64_t’
  * sudo vi /usr/local/apr/include/apr-1/apr.h in line 358
  * add line       typedef long    off64_t;
  * before         typedef  off64_t           apr_off_t;
  * message as follow:
> . vagrant@precise32 ~/mysql2redis
>  % make
> gcc -Werror -O2 -g `/usr/bin/mysql_config --include` -I/usr/local/include  -I/usr/local/apr/include  -I. -fPIC -shared -rdynamic lib_mysqludf_redis.c utils.c\
>		-lhiredis -L"/usr/lib64/mysql/plugin"  -L/usr/local/apr/lib  -lapr-1  -laprutil-1 -ljemalloc -o "/usr/lib64/mysql/plugin"/lib_mysqludf_redis_v2.so
> In file included from lib_mysqludf_redis.c:50:0:
> /usr/local/apr/include/apr-1/apr.h:358:1: error: unknown type name ‘off64_t’
> lib_mysqludf_redis.c: In function ‘check_error’:
> lib_mysqludf_redis.c:271:13: error: format not a string literal and no format arguments [-Werror=format-security]
> cc1: all warnings being treated as errors
> make: *** [linux] Error 1

#### Install mysql2redis
2. lib_mysqludf_redis.c:271:13: error: format not a string literal and
   no format arguments [-Werror=format-security]
   * vi lib_mysqludf_redis.c  in line 271
   * /*fprintf(pFile,buf)*/
   * fputs(buf, pFile);
   * message append follow:
>  % make
> gcc -Werror -O2 -g `/usr/bin/mysql_config --include` -I/usr/local/include  -I/usr/local/apr/include  -I. -fPIC -shared -rdynamic lib_mysqludf_redis.c utils.c\
>		-lhiredis -L"/usr/lib64/mysql/plugin"  -L/usr/local/apr/lib  -lapr-1  -laprutil-1 -ljemalloc -o "/usr/lib64/mysql/plugin"/lib_mysqludf_redis_v2.so
> lib_mysqludf_redis.c: In function ‘check_error’:
> lib_mysqludf_redis.c:271:13: error: format not a string literal and no format arguments [-Werror=format-security]
> cc1: all warnings being treated as errors
> make: *** [linux] Error 1


#### Install hiredis
3. install hiredis
   * make: Nothing to be done for `all'.
   * sudo make install

## APPEND


3. vagrant@precise32 ~/sw/hiredis
 % sudo make install
mkdir -p /usr/local/include/hiredis /usr/local/lib
cp -a hiredis.h async.h adapters /usr/local/include/hiredis
cp -a libhiredis.so /usr/local/lib/libhiredis.so.0.10
cd /usr/local/lib && ln -sf libhiredis.so.0.10 libhiredis.so.0
cd /usr/local/lib && ln -sf libhiredis.so.0 libhiredis.so
cp -a libhiredis.a /usr/local/lib

4. mysql> CREATE FUNCTION redis_servers_set_v2 RETURNS int SONAME "lib_mysqludf_redis_v2.so";
ERROR 1126 (HY000): Can't open shared library
'lib_mysqludf_redis_v2.so' (errno: 0 libhiredis.so.0.10: cannot open
shared object file: No such file or directory)
 * copy libhiredis.so.0.10 to /lib and libexpat.so to /lib
 * or check  echo $LD_LIBRARY_PATH
 * ref http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html
 * follow error is the same:
  1.  vagrant@precise32 ~ % mysql -u root -p < mysql_cmd.sql
  2.  Enter password: 
  3.  ERROR 1126 (HY000) at line 5: Can't open shared library 'lib_mysqludf_redis_v2.so' (errno: 0 libexpat.so.0: cannot open shared object file: No such file or directory)

 
5. % sudo make
gcc -Werror -O2 -g `/usr/bin/mysql_config --include` -I/usr/local/include  -I/usr/local/apr/include  -I. -fPIC -shared -rdynamic lib_mysqludf_redis.c utils.c\
:		-lhiredis -L"/usr/lib/mysql/plugin"  -L/usr/local/apr/lib
        -lapr-1  -laprutil-1 -ljemalloc -o
        "/usr/lib/mysql/plugin"/lib_mysqludf_redis_v2.so
 /usr/local/apr/lib
 /usr/lib
 ldd /usr/lib/mysql/plugin/lib_mysqludf_redis_v2.so
