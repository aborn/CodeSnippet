<?php

function database_table($data)
{
    $rows=count($data);
    $cols=count($data[0])/2;     # two kinds of index: id and type 
    #$cols=count($data[0]);
    $tab_str="";

    for($i=0;$i<$rows;$i++){
        $tab_str.='<div class="row">';
        $row_i = $data[$i];
        for($k=0;$k<$cols;$k++){
            $tab_str.='<div class="col-md-'.$cols.'">'.$row_i[$k].'</div>';
        }
        $tab_str.="</div>";
    }
    $tab_str.="</table>\n <br/>";
    print $tab_str;    
}

?>