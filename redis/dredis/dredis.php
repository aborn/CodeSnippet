<?php
  /***
   *
   * INTRO
   *    The class provides an universal interface 
   *    for call distributed redis system. 
   *
   * NOTE
   *    function name begin with t_, only use for test
   *
   * DATE
   *    2014-03-18
   *
   ***/

require_once '/vagrant_data/data/rediska/library/Rediska.php';
require_once '/vagrant_data/data/rediska/manager.php';

class  dredis
{

    private $rediska;
    private $options;

    public function __construct()
    {
        $dm = new dmanager();
        $this->options = $dm->getOptions();
        $this->rediska = new Rediska($this->options);
    }

    public function __destruct()
    {
        ## destruct function
    }

    public function set($keyName, $keyValue)
    {
        $key = new Rediska_Key($keyName);
        $key->setValue($keyValue);
    }
    
    public function get($keyName)
    {
        $key = new Rediska_Key($keyName);
        return $key->getValue();
    }

    public function t_print($keyName)
    {
        echo "<br/>";
        print "key:$keyName"." value:".$this->get($keyName); 
    }
}

?>
