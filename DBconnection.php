<?php
/**
 *
 */
class DBconnection {
  private $servername = "localhost";
  private $username = "root";
  private $password = "";
  private $conn ;
  public function connect()
  {
    try {
        $this->conn = new PDO("mysql:host=$this->servername;dbname=pediatric_health;charset=utf8",$this->username, $this->password);
        // set the PDO error mode to exception
        $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      //  echo "Connected successfully";
        }
    catch(PDOException $e)
        {
      //  echo "Connection failed: " . $e->getMessage();
      echo "Connection failed: " ;
        }
  return $this->conn;
  }
  public function disconnect()
  {
  $this->conn=null;
  }
}
?>
