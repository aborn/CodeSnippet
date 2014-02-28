<?php
  /***
   * INTRO:
   *   This class provides an interface to redis.
   *
   * VERSION
   *   2014-02-27  1.0
   *
   * NOTE
   *   You should install phpredis first from
   *   https://code.google.com/p/phpredis/  or
   *   https://github.com/nicolasff/phpredis
   *
   * AUTHOR:
   *   Aborn Jiang
   *
   ***/

class iredis 
{
    private $redis;
    private $redis_server = '127.0.0.1';
    private $redis_port = '6379';
    
    public function __construct()
    {
        $this->redis = new redis();
        $this->redis->pconnect($this->redis_server, $this->redis_port);
    }

    public function __destruct() 
    {
        $this->redis->close();
    }

    public function configure($redis_server, $redis_port)
    {
        $this->redis_server = $redis_server;
        $this->redis_port = $redis_port;
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