<?php

require_once 'dredis.php';
require_once 'monitor.php';
// Initialize Rediska

echo "<br/>";
echo "dredis test.";

$redis = new dredis();
//$redis->set('linux','is a os');
$redis->set('unix','good bsd');
$redis->set('linux','line us');

$redis->t_print('linux');

$imonitor = new monitor();
echo "<br/>";
echo $imonitor->getSize();


?>

<!--
<script language="JavaScript">
    document.write("\nhello world\n");
</script>
-->