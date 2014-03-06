<?php
  /***
   * use to test the clasee redis_face.php
   */
require_once('iredis.php');

function judge($status, $cmd)
{    if ($status==0 || $status == true) {
        echo "<p class=\"lead\">";
        echo $cmd." success.";
        echo "<p/>";
    } else {
        echo "<p class=\"lead\">";
        echo $cmd." failed.";
        echo "<p/>";
#        var_dump($status);
    }
}

echo "<h1>下面为测试redis的php接口类iredis的各种命令.</h1>";

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
