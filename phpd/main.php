<?php
  /***
   * this main.php is main process and call other
   * class and functions
   */

#require_once('mysql_info.php');
require_once('dbops.php');

echo "数据库测试页面\n <br/>";
date_default_timezone_set('PRC');
echo "当前时间:".date("Y-m-d H:i:s")."<br/>";
echo "数据库表如下:<br/>";

## following show the mysql database operation
$ops = new dbops();
#$ops->setDBname("greentea");    # change database
#$ops->setTBname("light_app");

$sql = sprintf("select * from %s", $ops->getTBname());
$data = $ops->query($sql);
$ops->close();

## show the $data in a form 
$rows=count($data);
$cols=count($data[0])/2;     # two kinds of index: id and type 
#$cols=count($data[0]);
$td_width=floor(100/$cols)."%";
$tab_str="<table border=\"1\" width=\"80%\" align=\"left\">\n";

var_dump($data);

for($i=0;$i<$rows;$i++){
    $tab_str.="<tr>\n";
    $row_i = $data[$i];
    for($k=0;$k<$cols;$k++){
        $tab_str.="<td width=\"$td_width\">$row_i[$k]</td>\n";
    }
    $tab_str.="</tr>\n";
}
$tab_str.="</table>\n <br/>";

#echo "name  *  id  *  title <br/>";
#echo $_SERVER['DOCUMENT_ROOT'];

$image="test.jpg";
echo "<br/>";
echo '<img src="'.$image.'" height ="100"/><br />';

print $tab_str;
#echo "<p/>";
#var_dump($data);

echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";
echo "<br/>";

echo "follow test redis:";
$redis = new redis();  
$result = $redis->connect('127.0.0.1', 6379);  
#var_dump($result); //结果：bool(true)  
$redis->set('test', 'hello world!');
echo $redis->get('test');

?>
