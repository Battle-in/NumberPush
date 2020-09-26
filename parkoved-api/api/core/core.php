<?php

class Bd {
    private static $datasourse = "mysql:host=localhost;dbname=park_system";
    private static $login = "root";
    private static $pass = "";
    private static $base;
        function __contstruct() {}

        public static function getBd() {
            if(!isset(self::$base)) {
                try {
                    self::$base = new PDO(self::$datasourse , self::$login , self::$pass);
                }
                catch(PDOExceptin $e) {
                    $error=$e->getMessage();
                    include('database_error.php');
                    exit();
                }
                return self::$base;
            }
        }
}
$conn = Bd::getBd();



?>