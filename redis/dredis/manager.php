<?php
  /***
   * CLASS NAME
   *   dmanager
   *          this class is used for manage the distributed system.
   * 
   *  DATE
   *    2014-03-18
   *
   ***/

class dmanager
{
    private $rediska;
    private $options = array(
        'namespace' => 'Application_',
        'servers'   => array(
            array('host' => '127.0.0.1', 'port' => 6379, 'alias' => 'mas01'),
            array('host' => '127.0.0.1', 'port' => 6380, 'alias' => 'ins01'),
            array('host' => '127.0.0.1', 'port' => 6381, 'alias' => 'ins02'),
            array('host' => '192.168.122.10', 'port' => 6379, 'alias' => 'sla01'),
            array('host' => '192.168.122.10', 'port' => 6380, 'alias' => 'ins03'),
            array('host' => '192.168.122.10', 'port' => 6381, 'alias' => 'ins04'),
            )
        );

    public function __construct()
    {
        $this->rediska = new Rediska($this->options);
    }
    
    public function getOptions()
    {
        return $this->options;
    }

    public function addServer($serverIp,$serverPort)
    {
        return $this->rediska->addServer($serverIp, $serverPort);
    }

    public function removeServer($aliasOrConnection)
    {
        return $this->rediska->removeServer($aliasOrConnection);
    }
}


?>