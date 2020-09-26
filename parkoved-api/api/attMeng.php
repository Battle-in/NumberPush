<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
header('Content-type: application/json');

require("core/core.php");

class BdQuery {
    public $conn;

    function __construct($bd)
    {
        $this->conn = $bd;
    }

    function getAtr() {
        return $this->conn->query("SELECT * FROM `attraction`");
    }

    function getQeue($id) {
        return $this->conn->query("SELECT `qeue` FROM `attraction_q` WHERE `id__atr` = '$id'")->rowCount();
    }
}

class atr extends BdQuery {

    function __construct($bd)
    {
        parent::__construct($bd);
    }

    function getData() {
        $cache = parent::getAtr();
        $test = array();
        $i = 0;
        foreach($cache as $row) {
            $arr[$i] = array(
               
                  "title" => $row['title'], 
                  "description"  => $row['description'],
                  "age_raitng" => $row['age_raitng'] ,
                  "raiting" => 0,
                  "id__atr" => $row['id__atr'] ,
                  "price_old" => $row['price_old'] ,
                  "price_kid" => $row['price_kid'] ,
                  "img_url" => $_SERVER['HTTP_REFERER']  . $row['img_url'] ,
                  
                
            );
            $i++;
        }
        for($i = 0; $i < count($arr); $i++) {
            $arr[$i]['raiting'] = parent::getQeue($arr[$i]['id__atr']);
        }
        return $arr;
    }

}

$res = new atr($conn);


echo json_encode($res->getData());

?>
