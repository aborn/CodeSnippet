<?php
  /***
   * INTRO:
   *     this class is used to operate mysql 
   *     database such as connect, query, release etc.
   *
   * USAGE: $idbops = new dbops();
   *        $dataArr = $idbops->query("sql sentence")
   *
   * VERSION:
   *        v0.1
   * Guobao Jiang   2014-1-15
   */

class dbops {
    private $host = '127.0.0.1:3306';
    private $user = 'root';
    private $pwd  = 'linuxabornmysql';
    private $dbname = 'test';
    private $tbname = 'temp';
    private $data = array();
    private $mysqli = null;

    public function connect()
    {
        $this->mysqli = new mysqli($this->host, $this->user, $this->pwd, $this->dbname);
        if (mysqli_connect_errno()) {
            echo "connect mysql and use table failed.";
            die("connect error".mysql_error());
            return false;
        } else {
            return true;
        }
    }

    public function query($sql)
    {
        if ($this->connect()) {
            $result = $this->mysqli->query($sql);
            if (gettype($result) == 'boolean')
            {
                return $result;
            } elseif (gettype($result) == 'object' &&
                      $result->num_rows == 0) {
                echo "</br>"; echo "$sql";
                echo "000no nummmmmmmmmmm0000";
                echo "</br>";
                return NULL;
            }
            
            while($row = $result->fetch_array()){
                $this->data[] = $row;
            }
            return $this->getData();
        } else {
            return false;
        }
    }

    public function close() 
    {
        $this->mysqli->close();
    }

    public function getData()
    {
        return $this->data;
    }

    public function getDBname(){
        return $this->dbname;
    }

    public function getTBname()
    {
        return $this->tbname;
    }
    
    public function setDBname($dbname)
    {
        $this->dbname = $dbname;
    }
    
    public function setTBname($tbname)
    {
        $this->tbname = $tbname;
    }
    
    public function connect_old()
    {   # this function use old api, it will deprecated in the future
        $link=mysql_connect($this->host,$this->user,$this->pwd);
        if (!$link) { 
            echo "connect mysql failed.";
            return false ;
        }
        if (!mysql_select_db($this->dbname, $link)) {
            echo "select database failed.";
            return false;
        }
        return $link;
    }
    
    public function query_old($mysql, $link)
    {  # corresponding connect_old, it will deprecated in the future
        $result = mysql_query($mysql, $link);
        if (!$result) {
            die('Query error.' . mysql_error());
            return false;
        }
        while ($row = mysql_fetch_array($result, MYSQL_NUM)) {
            $this->data[] = $row;
        }
        mysql_free_result($result);
        return $this->getData();
    }
    
    public function release($link)
    {
        mysql_close($link);
    }

  }
?>
