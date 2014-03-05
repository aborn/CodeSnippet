<?php
  /***
   * redis.php is used to test redis's benchmark
   * 2014-02-25
   */

require_once('dbops.php');
require_once('mysql2redis.php');
require_once('looptest.php');

#$tbname="account";
#$tbname="temp";
#$tbname="bench_no_index";
#$tbname="bench";
$dbname="test";
$loop_times=20;

$tab_redis = new mysql2redis();
$tab_redis->setTBname($tbname);
$tab_redis->setDBname($dbname);
# $tab_redis->bench($items_number, $tbname);   ## 创建数据表格

$startI=9000;     ## 29000
$endI=10000;      ## 30000
$sql = sprintf("select * from %s where idx > %d and idx < %d", $tbname, $startI, $endI);
$tab_redis->mysql2redis($tbname, $sql);

######### 下面为测试调用
echo "</br>";
echo $sql;
echo "</br>";

$lptest = new looptest();
$lptest->configure($tbname, $dbname);

echo "<br/>";
echo "redis性能测试页面";
$dbtime=$lptest->test_mysql($loop_times, $sql);
echo "<br/>"; echo "<br/>";
echo "[数据库".$dbname."表".$tbname."]执行 $loop_times 次循环(单次时间 ms)为:";
echo ($dbtime/$loop_times)*1000;


$rstime=$lptest->test_redis($loop_times);
echo "<br/>"; echo "<br/>";
echo "[redis对应表".$tbname." ]执行 $loop_times 次循环（单次时间 ms)为:";
echo ($rstime/$loop_times)*1000;

$items_number = $tab_redis->tabsize($tbname);

echo "<br/>"; echo "<br/>";
echo "item=$items_number [数据库]/[redis]比值为：";
echo $dbtime/$rstime;

######### 下面为测试输出

#$tab_redis->print_mysql_table($tbname);
# var_dump($data);

?>
