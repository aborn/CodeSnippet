<?php
  /***
   * loop to test the redis
   *
   */
require_once('dbops.php');
class looptest 
{
    private $tbname;
    private $dbname;

    
    public function configure($tbname,$dbname)
    {
        $this->tbname = $tbname;
        $this->dbname = $dbname;
    }
    
    public function test_mysql($loop_times, $sql = NULL)
    {
        $tbname = $this->tbname;
        $dbname = $this->dbname;
        $start_time=microtime(true);
        if ($sql == NULL) {
            $sql = sprintf("select * from %s", $ops->getTBname());
        }
        
        for ($i = 0; $i < $loop_times; $i++) {
            $ops = new dbops();
            $ops->setTBname($tbname);
            $ops->setDBname($dbname);
            $start=$i*128;
            $conditions = sprintf("idx > %d and idx < %d;", 
                                  $start, $start + 1000);
            $sql = sprintf("select * from %s where %s", 
                           $tbname, $conditions);
            $data = $ops->query($sql);
            $ops->close();
        }
        $end_time=microtime(true);
        $dbtime=$end_time - $start_time;
        return $dbtime;
    }

    public function test_redis($loop_times)
    {
        $tbname = $this->tbname;
        $dbname = $this->dbname;
        $start_time=microtime(true);
        for ($i = 0; $i < $loop_times; $i++) {
            ##   for ($j = 0; $j < 5; $j++){
            $redis = new redis();
            $redis->connect('127.0.0.1', 6379);
            $redis->hGetAll("$tbname");
            ##    }
        }
        $end_time=microtime(true);
        $rstime=$end_time - $start_time;
        return $rstime;
    }
}

?>