<?php 

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
header('Content-type: application/json');

require("core/core.php");

class BdQuery {
    private $conn;
    function __construct($bd) {
        $this->conn = $bd;
    }

    public function chek($idCl , $idAtr) {
        return $this->conn->query(" SELECT * FROM `attraction_q` WHERE  `device_id` = '$idCl'")->fetch();
        
        
    }

    public function setQ($idCl , $idAtr) {
        $q = $this->conn->query("SELECT `id__atr`, `device_id`, `qeue` FROM `attraction_q` ORDER BY `attraction_q`.`qeue` DESC LIMIT 1")->fetch();
        $res = $q['qeue'];
        
        if(isset($res)) {
            $res++;
            $this->conn->query("INSERT INTO `attraction_q`(`id__atr`, `device_id`, `qeue` ) VALUES ('$idCl' , '$idAtr' , '$res')");
            return $res;
        }
        else 
        {
            $res = 0;
            $this->conn->query("INSERT INTO `attraction_q`(`id__atr`, `device_id`, `qeue` ) VALUES ('$idCl' , '$idAtr' , $res)");
            return $res;
            
        }
        
        //return $this->conn->query("INSERT INTO `attraction_q`(`id__atr`, `device_id`, `qeue` ) VALUES ([value-1],[value-2],[value-3],[value-4])");    
    }
}

class qeue extends BdQuery {
    private $lastClient;
    private $atrId;
    private $res;
    function __construct($bd , $res)
    {
        $this->$res = $res;
        $this->atrId = $_GET['id__atr'];
        $this->lastClient = $_GET['device_id'];

        parent::__construct($bd);
    }

    function getQuee() {
        if(isset($this->lastClient) && isset($this->atrId)) {
            $ch = parent::chek ( $this->lastClient , $this->atrId);
            if($ch) {
               return json_encode( $arr[] = array( "id_atr" => $ch['id__atr'] , "device_id" =>  $ch['device_id'] , "qeue" => $ch['qeue'] ) );
            }
            else {
                $res = parent::setQ(  $this->atrId , $this->lastClient);
                return json_encode( $arr[] = array( "id_atr" => $this->atrId , "device_id" =>  $this->lastClient , "qeue" => $res ) );
                //$res->get_info();
            }
        }
        else 
        {
            return json_encode( $arr[] = array( "code" => "800" ) );
        }
    }
}

$qu = new qeue($conn , $res);
print_r($qu->getQuee());

?>