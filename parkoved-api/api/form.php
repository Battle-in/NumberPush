<?php 

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
header('Content-type: application/json');

require("core/core.php");


class BdQuery {
    private $bd;
    function __construct($bd) {
        $this->conn = $bd;
    }

    function send($id , $text) {
        return $this->conn->query("INSERT INTO `form`(`device_id`, `text`) VALUES ( '$id' , '$text' )");
    }
}

class send extends BdQuery {
    private $text;
    private $id;
    public function __construct($bd) {
        parent::__construct($bd);
        $this->text = $_GET['text'];
        $this->id = $_GET['device_id'];
    }

    function getInfo () {
        if(isset($this->text) && isset($this->id)) {
        parent::send($this->id,$this->text);
        echo json_encode($arr[] = array( "code" => 101 ));
        }
        else 
        {
            echo json_encode($arr[] = array( "code" => 800 ));
        }
    }
}

$res = new send($conn);

$res->getInfo();
?>