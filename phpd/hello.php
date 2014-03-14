<?php

require_once '/vagrant_data/data/rediska/library/Rediska.php';
// Initialize Rediska

$options = array(
    'namespace' => 'Cache_',
    'name'      => 'cache'
);

$rediska = new Rediska($options);

$rediska = Rediska_Manager::get('cache');
print $rediska->getName(); #=> cache

?>