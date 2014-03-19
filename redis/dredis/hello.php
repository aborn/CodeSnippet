<?php

require_once 'dredis.php';
// Initialize Rediska

echo "<br/>";
echo "dredis test.";

$redis = new dredis();
//$redis->set('linux','is a os');
$redis->set('unix','good bsd');
$redis->set('linux','line us');

$redis->t_print('linux');

?>

<!--
<script language="JavaScript">
    document.write("\nhello world\n");
</script>
-->