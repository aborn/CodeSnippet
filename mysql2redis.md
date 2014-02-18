mysql2redis
==========

## INSTALL DEPS
* sudo apt-get install libjemalloc1 libjemalloc-dev
  or source download install
* install apr: 1. download 2. ./configure 3. make 4. make test 5. make
  install
* install apr-util: 1. download 2.  ./configure
  --with-apr=/usr/local/apr 3. make 4. make install
* install lib_mysqludf_json
  1. download: wget https://github.com/mysqludf/lib_mysqludf_json
  2. copy lib_mysqludf_json.so to /usr/lib/mysql/plugin
* configure Makefile
  1. modify its format.
  2. modify mysqlplugindir i.e. PLUGINDIR
* install mysql2redis:
  1. make (note QA)


## QA
  
1.  /usr/local/apr/include/apr-1/apr.h:358:1: error: unknown type name
  ‘off64_t’
  
  sudo vi /usr/local/apr/include/apr-1/apr.h in line 
  add line       typedef long    off64_t;
  before         typedef  off64_t           apr_off_t;
  
2. lib_mysqludf_redis.c:271:13: error: format not a string literal and
   no format arguments [-Werror=format-security]
   vi lib_mysqludf_redis.c  in line 271
   /*fprintf(pFile,buf)*/
   fputs(buf, pFile); 

## APPEND
1. vagrant@precise32 ~/mysql2redis
 % make
gcc -Werror -O2 -g `/usr/bin/mysql_config --include` -I/usr/local/include  -I/usr/local/apr/include  -I. -fPIC -shared -rdynamic lib_mysqludf_redis.c utils.c\
		-lhiredis -L"/usr/lib64/mysql/plugin"  -L/usr/local/apr/lib  -lapr-1  -laprutil-1 -ljemalloc -o "/usr/lib64/mysql/plugin"/lib_mysqludf_redis_v2.so
In file included from lib_mysqludf_redis.c:50:0:
/usr/local/apr/include/apr-1/apr.h:358:1: error: unknown type name ‘off64_t’
lib_mysqludf_redis.c: In function ‘check_error’:
lib_mysqludf_redis.c:271:13: error: format not a string literal and no format arguments [-Werror=format-security]
cc1: all warnings being treated as errors
make: *** [linux] Error 1

2.  % make
gcc -Werror -O2 -g `/usr/bin/mysql_config --include` -I/usr/local/include  -I/usr/local/apr/include  -I. -fPIC -shared -rdynamic lib_mysqludf_redis.c utils.c\
		-lhiredis -L"/usr/lib64/mysql/plugin"  -L/usr/local/apr/lib  -lapr-1  -laprutil-1 -ljemalloc -o "/usr/lib64/mysql/plugin"/lib_mysqludf_redis_v2.so
lib_mysqludf_redis.c: In function ‘check_error’:
lib_mysqludf_redis.c:271:13: error: format not a string literal and no format arguments [-Werror=format-security]
cc1: all warnings being treated as errors
make: *** [linux] Error 1

  
