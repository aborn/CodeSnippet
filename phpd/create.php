<?php
require_once('mysql2redis.php');
$items_number=2000000;
$tab_redis = new mysql2redis();
$tab_redis->setDBname('test');
$tab_redis->setTBname('bench');
$tab_redis->bench($items_number);
$tab_redis->bench($items_number, 'bench_no_index');
?>
