<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
header('Content-type: application/json');

require("core/core.php");

class BdQuery {
    private $conn;

    function __construct($bd)
    {
        $this->conn = $bd;
    }

    function getBalance ($id) {
        return $this->conn->query(" SELECT `balance` FROM `users_cab` WHERE `device_id` = '$id' ");
    }
    function getHistory ($id) {
        return $this->conn->query(" SELECT  `hist` FROM `history` WHERE `device_id` = '$id' ");
    }
}

class meneg extends BdQuery {
    private $device_id; 
    function __construct($bd)
    {
        $this->device_id = $_GET['device_id'];
        parent::__construct( $bd);
    }

    public function getInfo() {
        $arr[] = array();
        $hst = parent::getHistory($this->device_id)->fetch();
        if($bl = parent::getBalance($this->device_id)->fetch()) {
            return json_encode($arr = array( "bl" => $bl[0] , "hst" => $hst[0] ));  
        }
        else 
        {
            return json_encode($arr = array( "code" => "301" ));
        } 
    }
}

$balance = new meneg($conn);

$res = $balance->getInfo();

print_r($res);

?>