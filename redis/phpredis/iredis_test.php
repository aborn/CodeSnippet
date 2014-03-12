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
echo "<br/>";


echo "下面为测试redis的php接口类iredis的各种命令.";

$rf = new iredis();
$ipaddr='192.168.122.10';
#$ipaddr='127.0.0.1';
$port=7000;
#$status=$rf->configure($ipaddr, $port);

if ($rf->getStatus()) 
{
    echo "<br/>";
    echo "connect server success";
} else {
    echo "<br/>";
    echo "connect server:port ($ipaddr:$port) failed.";
    return;
}

$status=$rf->set('lenovo','shanghai777');
judge($status, "set");

# $status=$rf->del('lenovo');
# judge($status, "del");
# $status=$rf->hset('go','shanghai','e2e2');
# judge($status, "hset");
# $status=$rf->delete('go');
# judge($status, "delete");

?>