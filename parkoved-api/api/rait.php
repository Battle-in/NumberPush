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

    function getRait($id) {
        return $this->conn->query("SELECT `raiting` FROM `attraction` WHERE `id__atr` = '$id'")->fetch();
    }

    function setRait($id , $newrat) {
        return $this->conn->query("UPDATE `attraction` SET `raiting`= '$newrat' WHERE `id__atr` = '$id'");
    }
}

class rait extends BdQuery {
    private $raits;
    private $id_atr;
    function __construct($bd)
    {
        $this->id_atr = $_GET['id_atr'];
        $this->raits = $_GET["new_rait"];
        parent::__construct($bd);
    }

    function getInfo () {

        if( isset( $this->id_atr) && isset($this->raits) ) {
            $cahe = parent::getRait($this->id_atr);
            $oldRat = $cahe['raiting'];
            $newRat = $this->raits;
            $newRat =  floatval(($oldRat + $newRat ) / 2);
            $res = parent::setRait( $this->id_atr , $newRat );
            return json_encode( $arr[] = array( "id_atr" => $this->id_atr , "raiting" => floor($newRat)) );
        }
        else
        {
            return json_encode( $arr[] = array( "code" => 300) );
        }
    }
}

$res = new rait($conn);

print_r($res->getInfo());


?>