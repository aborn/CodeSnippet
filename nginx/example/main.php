<?php
  /***
   * this main.php is main process and call other
   * class and functions
   */

require_once('dbops.php');
require_once('iredis.php');
require_once('table.php');

## following show the mysql database operation
$ops = new dbops();
#$ops->setDBname("greentea");    # change database
#$ops->setTBname("light_app");

$sql = sprintf("select * from %s", $ops->getTBname());
$data = $ops->query($sql);
$ops->close();
database_table($data);

?>

<h1>follow test redis:<h1/>;

<?php
$redis = new iredis();  
$result = $redis->configure('127.0.0.1', 6379);  
#var_dump($result); //结果：bool(true)  
#$redis->set('test', 'hello world!');
#$redis->select(1);
echo $redis->get('test');

?>
