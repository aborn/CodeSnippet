<?php
$options = array(
   'namespace' => 'Application_',
   'servers'   => array(
       array('host' => '127.0.0.1', 'port' => 6379, 'alias' => '9'),
       array('host' => '127.0.0.1', 'port' => 6380, 'alias' => '0')
   )
 );

require_once '/vagrant_data/data/rediska/library/Rediska.php';
$rediska = new Rediska($options);
print $rediska->getName();
// Initialize key with name 'keyName'

for ($i=0; $i<10; $i++)
{
    $keyName="key$i";
    $key = new Rediska_Key($keyName);
    $keyValue="value444____$i";
    echo "<br/>";
    echo "old value";
    print $key->getValue($keyValue);
    
    $key->setValue($keyValue);
    echo "<br/>";
    echo "new value";
    print $key; #=> value
}

$rediska->addServer('192.168.122.10', 6379);

$connection=$rediska->getConnectionByAlias ('0');
#$rediska->slaveOf($connection);
$rediska->removeServer($connection);



for ($i=0; $i<10; $i++)
{
    $keyName="key$i";
    $key = new Rediska_Key($keyName);
    $keyValue="value444____$i";
    echo "<br/>";
    echo "changed value";
    print $key->getValue($keyValue);
    
#    $key->setValue($keyValue);
#    echo "<br/>";
#    echo "new value";
#    print $key; #=> value
}


// Initialize Set with name 'setKeyName' and specified Rediska instance
$set = new Rediska_Key_Set('setKeyName', array('rediska' => $rediska));

// Print all elements
foreach($set as $element) {
    print $element;
}


 ?>
