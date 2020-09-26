<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: X-Requested-With,Origin,Content-Type,Cookie,Accept');
header('Content-type: application/json');

require("core/core.php");


class bdQuery {
    private $sql;
    private $conn;

    function __construct($bd )
    {
       
        $this->conn = $bd;
    }

    public function checkUser($id) { //смотрим есть ли такой юзер
        $stmt = $this->conn->prepare("SELECT * FROM `users` WHERE `device_id` = '$id'");
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_NUM);
    }

    public function checkAttr($chek) {
        if(!isset($chek[2]) && !isset($chek[4])) {
            return false;
        }
        else 
        {
            return true;
        }
    }

    public function getUserInfo($id) { // получаем инфу
        return $this->conn->query("SELECT * FROM `users` WHERE `device_id` = '$id'"); 
    }

    public function setUserInfo($age , $gender , $id) { // устанваливаем атрибуты юзера
        return $this->conn->query("UPDATE `users` SET `age` = '$age' , `rights` = 1 , `gender` = '$gender' WHERE `device_id` = '$id'"); 
    }

    public function setID($id) { // добовляем id юзера
        if($this->setCab($id)) {
            return  $this->conn->query("INSERT INTO `users`(`device_id`) VALUES ('$id')");
        } 
    }
    private function setCab($id) {
        return $this->conn->query("INSERT INTO `users_cab`(`device_id`) VALUES ('$id')"); 
    }
}


class userAgent extends bdQuery {
    public $info;
    private $device_id;
    private $gender;
    private $age;
    function __construct($bd )
    {
        $this->device_id = $_GET['device_id'];
        $this->gender = $_GET['age'];
        $this->age = $_GET['gender'];        
        parent::__construct($bd);
    }

    public function getInfo() { //выдает всю инфу
        $id = $this->device_id;
        $chek = $this->info = parent::checkUser($id);
        
        if($chek) { //если есть айди в базе
            if(parent::checkAttr($chek)) {
                return json_encode( $array[] = array( "code" => 101 ) );
            }
            elseif(!isset($this->age) && !isset($this->gender)) {
                return json_encode( $array[] = array( "code" => 102 ) );
            }
            elseif(isset($this->age) && isset($this->gender)) {
                if(parent::setUserInfo( $this->age , $this->gender , $id)) {
                    return json_encode( $array[] = array( "code" => 103 ) );
                }
            }
            $cache = parent::getUserInfo($id);    
        }
        else 
        { // если нет
            if(isset($id)) {
                if(parent::setID($this->device_id)) {
                    return json_encode( $array[] = array( "code" => 104 ) );
                }
                else {
                    return json_encode( $array[] = array( "code" => 105 ) );
                }
            }
            else {
                return json_encode( $array[] = array( "code" => 800) );
            }
        }
    }
}

$result = new userAgent($conn );


print_r($result->getInfo());

    exit();
?>
