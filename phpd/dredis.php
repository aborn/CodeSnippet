<?php
  /***
   * INTRO
   *    The class provides an universal interface 
   *    for call distributed redis system 
   *
   * DATE
   *    2014-03-15
   */

class  dredis
{
    $options = array(
        'namespace' => 'Application_',
        'servers'   => array(
            array('host' => '127.0.0.1', 'port' => 6379, 'alias' => 'mas01'),
            array('host' => '127.0.0.1', 'port' => 6380, 'alias' => 'ins01')
            array('host' => '127.0.0.1', 'port' => 6380, 'alias' => 'ins02')
            array('host' => '10.8.8.10', 'port' => 6380, 'alias' => 'sla01')
            array('host' => '10.8.8.10', 'port' => 6380, 'alias' => 'ins03')
            array('host' => '10.8.8.10', 'port' => 6380, 'alias' => 'ins04')
            )
        );

}


require_once '/vagrant_data/data/rediska/library/Rediska.php';
$rediska = new Rediska($options);

var_dump(Rediska_Manager::getAll());

// Initialize key with name 'keyName'
if(Rediska_Manager::has('default')){
    echo "<br/>";
    echo "exist@@@@@@@@@@@@@@@";
    echo "<br/>";
}


if(Rediska_Manager::add($rediska))
{
    echo "add success";
} else {
    echo "add failed";
}



$rediska->flushdb();

#return;

for ($i=0; $i<10; $i++)
{
    $keyName="key$i";
    $key = new Rediska_Key($keyName);
    $keyValue="value_$i"."_first";
    echo "<br/>";
    $key->setValue($keyValue);
    print "key:$keyName"." value:".$key->getValue(); #=> value
}

# $rediska->addServer('192.168.122.10', 6379);
$rediska->addServer('10.8.8.10', 6379);

$connection=$rediska->getConnectionByAlias ('0');
# $rediska->slaveOf($connection);
$rediska->removeServer($connection);

echo "<br/>";echo "<br/>";
echo "follow add 10.8.8.10 and delete 6380";
echo "<br/>";


for ($i=0; $i<10; $i++)
{
    $keyName="key$i";
    $key = new Rediska_Key($keyName);
    $keyValue="value_$i"."_second";
    echo "<br/>";
    $oldValue = $key->getValue();
    
    $key->setValue($keyValue);
    print "key:$keyName"." value:".$key->getValue()."  old value:$oldValue";
}


// Initialize Set with name 'setKeyName' and specified Rediska instance
$set = new Rediska_Key_Set('setKeyName', array('rediska' => $rediska));

// Print all elements
foreach($set as $element) {
    print $element;
}


 ?>
