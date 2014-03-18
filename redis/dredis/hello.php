<?php

require_once 'dredis.php';
// Initialize Rediska

echo "<br/>";
echo "dredis test.";

$redis = new dredis();
//$redis->set('linux','is a os');
$redis->t_print('linux');

?>