
<?php
  /***
   * INTRO:
   *   This class provides an interface to redis.
   *
   * DEPENDS
   *   phpredis
   *   You should install phpredis first from https://code.google.com/p/phpredis/  
   *   or https://github.com/nicolasff/phpredis
   *
   * VERSION
   *   2014-02-27  1.0
   *   2014-03-12  1.1   add extension_loaded if possible
   *
   * AUTHOR:
   *   Aborn Jiang
   * 
   * ISSUES:
   *   if ipis error ex. 192.168.0.23, redis->connect will spend
   *   lots of time. this is a bug in phpredis?
   *
   ***/

class iredis 
{
    private $redis;
    private $redis_server = '127.0.0.1';
    private $redis_port = 6379;
    private $status = TRUE;          ## connection status, TRUE or FALSE
    
    public function __construct()
    {
        if (!extension_loaded('redis')) {                                                                                                                              
            ##echo "no load!";
            if (!dl('redis.so')) {
                exit;
            }
        }
        $this->redis = new redis();
        $this->status=$this->redis->connect($this->redis_server, 
                                            $this->redis_port);
        ## $this->status=$this->redis->pconnect($this->redis_server, $this->redis_port);
    }

    public function __destruct() 
    {
        if ($this->status)    ## when the server is open
        {
            $this->redis->close();
        }
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function configure($redis_server, $redis_port)
    {
        $this->redis_server = $redis_server;
        $this->redis_port = $redis_port;
        $this->status=$this->redis->connect($this->redis_server, 
                                            $this->redis_port);
        return $this->status;
    }

    public function ping()
    {
        return $this->redis->ping();
    }
    
    public function set($key, $value)
    {
        return $this->redis->set($key,$value);
    }

    public function get($key)
    {
        return $this->redis->get($key);
    }

    public function release($key)
    {
        return $this->redis->delete($key);
    }

    public function close()
    {
        $this->redis->close();
    }

    public function select($database=0)
    {
        $this->redis->select($database);
    }
    
    public function append($key, $value)
    {
        return $this->redis->append($key, $value);
    }
    
    public function hset($key, $keysub, $value)
    {
        return $this->redis->hSet($key, $keysub, $value);
    }

    public function expire($key, $time) 
    { ## set expire timeout with $time (second).
        return $this->redis->setTimeout($key, $time);
    }
    
    public function del($key)
    {
        return $this->redis->delete($key);
    }

    public function delete($key)
    {
        return $this->redis->delete($key);
    }    

    public function hgetall($key)
    {
        return $this->redis->hGetAll($key);
    }
    
}

?>