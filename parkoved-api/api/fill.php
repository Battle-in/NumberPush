<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
header('Content-type: application/json');

require("core/core.php");

class BdQuery {
    private $conn;

        function __construct($db)
        {
            $this->conn = $db;
        }

        function getBalance ($id) {
        return $this->conn->query(" SELECT `balance` FROM `users_cab` WHERE `device_id` = '$id' ");
    }

        function payAt($id , $newB) {
            return $this->conn->query("UPDATE `users_cab` SET `balance`= '$newB' WHERE `device_id` = '$id' ");
        }

}

class pay extends BdQuery {
    private $summ;
    private $device_id;

    function __construct($bd)
    {
        $this->summ = $_GET['summ'];
        $this->device_id = $_GET['device_id'];
        parent::__construct($bd);
    }

    function payItem() {
        if(isset($this->device_id)) {
        $cahe = parent::getBalance($this->device_id)->fetch();
        $bl = $cahe[0] - 0;
            if($bl >= $this->summ) {
                $newBal = $bl + $this->summ;
                parent::payAt($this->device_id , $newBal);
                return json_encode( $arr[] = array( "bal"  => $newBal) );
            }
            else 
            {
                return json_encode( $arr[] = array( "code"  => 500) );
            }
        }
        else 
        {
            return json_encode( $arr[] = array( "code"  => 300) );
        }
    }
    
}

$res = new pay($conn);

print_r( $quqer = $res->payItem() );

?>