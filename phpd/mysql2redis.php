<?php
  /***
   * INTRO:
   *  this class provide an interface to redis
   * 
   *  2014-02-27
   */

require_once('dbops.php');
require_once('iredis.php');

class mysql2redis
{
    private $dbname = 'test';
    private $tbname = 'account';
    private $keycol = 0;    # for mysql key
    private $mysql;
    private $mysql_data;
    private $redis_data;
    private $no_of_row;
    private $no_of_col;
    private $iredis;
    
    public function __construct()
    {
        $this->iredis = new iredis();
        
        $this->mysql = new dbops();
    }

    function __destruct() 
    {
        if ( $this->mysql != NULL )
            $this->mysql->close();
    }

    public function bench($items_number, $bench='bench')
    {   ## 测试前创建数据表格操作
##        $del_sql = sprintf("delete from %s where idx>0;", $bench);
        $del_sql = sprintf("delete from %s;", $bench);
        $this->mysql->query($del_sql);
##        $this->mysql->query("select * from bench;");
        for ($i=0; $i < $items_number; $i++)
        {
            $value = sprintf("(%d,\"name%d\",\"%s\")", $i, $i, $bench);
            $insert_sql = sprintf("insert into %s values%s;",$bench,$value);
            $this->mysql->query($insert_sql);
        }
    }

    public function mysql2redis($keycol = 0, $sql = NULL)
    {
        $dbname = $this->dbname;
        $tbname = $this->tbname;
        $iredis = $this->iredis;

        $this->mysql->setDBname($dbname);
        $this->mysql->setTBname($tbname);

        if ($sql == NULL)
        {        
            $sql = sprintf("select * from %s", $tbname);
        }
        
        $this->mysql_data = $this->mysql->query($sql);
        if ($this->mysql_data == NULL) 
        {
            return NULL;
        }
        
        $this->no_of_row = count($this->mysql_data);
        $this->no_of_col = count($this->mysql_data[0])/2;     

        $iredis->del($tbname);
        for($i = 0; $i < $this->no_of_row; $i++){
            $row_i = $this->mysql_data[$i];
            $keyi = $row_i[$this->keycol];
            $coni = "";
            for($k = 0; $k < $this->no_of_col; $k++){
                $coni .= "  $row_i[$k]";
            }
            $iredis->hset($tbname, $keyi, $coni);
        }
        $this->redis_data=$iredis->hgetall($tbname);
        return $this->redis_data;
    }


    
    public function print_mysql_table()
    {
        $td_width = floor(100/$this->no_of_col)."%";
        $tab_str = "<table border=\"1\" width=\"80%\" align=\"left\">\n";

        for($i = 0; $i < $this->no_of_row; $i++){
            $tab_str .= "<tr>\n";
            $row_i = $this->mysql_data[$i];
            for($k = 0; $k < $this->no_of_col; $k++){
                $tab_str .= "<td width=\"$td_width\">$row_i[$k]</td>\n";
            }
            $tab_str .= "</tr>\n";
        }
        $tab_str.="</table>\n <br/>";
        print $tab_str;
        for($i = 0; $i < $this->no_of_row + 5; $i++){
            echo "<br/>";
        }
    }
    
    public function setTBname($tbname)
    {
        return $this->tbname = $tbname;
    }

    public function setDBname($dbname)
    {
        $this->dbname = $dbname;
    }
}

?>