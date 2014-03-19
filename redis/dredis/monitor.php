<?php
  /***
   * INTRO
   *   This class uses to monitor all redis cluster pool
   *
   * DEPENDS
   *   phpredis and iredis
   *
   * VERSION
   *   2014-03-19 1.0
   *
   * AUTHOR
   *   Aborn Jiang
   *
   ***/

require_once 'iredis.php'

class monitor
{
    private $redis;
    private $iredis;
    
    public function __construct()
    {
        $this->iredis = new iredis();
        $this->redis = $this->iredis->getRedis();
    }

    public function __destruct()
    {
    }
    
    // get how many keys in the current redis 
    public function getSize()
    {
        return $this->redis->dbSize();
    }
    
}


?>