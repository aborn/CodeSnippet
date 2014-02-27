<?php
  /***
   * redis.php is used to test redis's benchmark
   * 2014-02-25
   */

require_once('dbops.php');
require_once('mysql2redis.php');
require_once('looptest.php');

#$tbname="account";
$tbname="bench_no_index";
$dbname="test";
$loop_times=10;
$items_number=30000;

$tab_redis = new mysql2redis();
$tab_redis->setTBname($tbname);
$tab_redis->setDBname($dbname);
$tab_redis->mysql2redis($tbname);
#$tab_redis->bench($items_number);

$lptest = new looptest();
$lptest->configure($tbname, $dbname);

echo "<br/>";
echo "redis性能测试页面";
$dbtime=$lptest->test_mysql($loop_times);
echo "<br/>"; echo "<br/>";
echo "[数据库".$dbname."表".$tbname."]执行 $loop_times 次循环时间为:";
echo $dbtime;


$rstime=$lptest->test_mysql($loop_times);
echo "<br/>"; echo "<br/>";
echo "[redis对应表".$tbname." ]执行 $loop_times 次循环时间为:";
echo $rstime;

echo "<br/>"; echo "<br/>";
echo "item=$items_number [数据库]/[redis]比值为：";
echo $dbtime/$rstime;

#$tab_redis->print_mysql_table();
# var_dump($data);

?>
