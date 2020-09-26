<?php

class BdQuery {
    private $conn;

    function __construct($bd)
    {
        $this->conn = $bd;
    }

    function rait($id) {

    }
}

class rait extends BdQuery {
    private $rait;
    private $id_atr;
    function __construct($bd)
    {
        $this->id_atr = $_GET['id_atr'];
        $this->rait = $_GET("new_rait");
        parent::__construct($bd);
    }

    function getInfo () {
        
    }
}


?>