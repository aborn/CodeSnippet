<?php
  /***
   * use to test the clasee redis_face.php
   */
require_once('iredis.php');

function judge($status, $cmd)
{    if ($status==0 || $status == true) {
        echo "<br/>";
        echo $cmd." success.";
    } else {
        echo "<br/>";
        echo $cmd." failed.";
        var_dump($status);
    }
}

echo "下面为测试redis的php接口类redis_face的各种命令.";

$rf = new iredis();

$status=$rf->set('lenovo','shanghai');
judge($status, "set");
$status=$rf->del('lenovo');
judge($status, "del");
$status=$rf->hset('go','shanghai','e2e2');
judge($status, "hset");
$status=$rf->delete('go');
judge($status, "delete");

?>