<?php

require_once '/vagrant_data/data/rediska/library/Rediska.php';
// Initialize Rediska

$options = array(
    'namespace' => 'Cache_',
    'name'      => 'cache'
);

$rediska = new Rediska($options);

$rediska = Rediska_Manager::get('default');
print $rediska->getName(); #=> cache

$keyName = "key0";
$key = new Rediska_Key($keyName);
$key->setValue("zzzzzzzzzzzzz");



?>