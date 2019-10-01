<?php /**
 *
 */
class AppCore
{
private $conn;
private $response;
  function __construct($conn)
  {
    require_once 'DBconnection.php';
    $this->conn=(new DBconnection())->connect();
    $this->response["success"] = 0;
    $this->response["message"] = "Error ..";
    // code...
  }
public function adduser($name,$baby_name,$age_info_id)
{
  try {
    $stmt = $this->conn->prepare("INSERT INTO users (name, baby_name,age_info_id)
    VALUES (:name, :baby_name,:age_info_id)");
    $stmt->bindParam(':name', $name);
    $stmt->bindParam(':baby_name', $baby_name);
    $stmt->bindParam(':age_info_id', $age_info_id);
    $stmt->execute();
    $id = $this->conn->lastInsertId();
    $response["success"] = 1;
    $response["id"] = $id ;
    $response["message"] = "added successfully";
    // echoing JSON response
  //  echo json_encode($response, JSON_UNESCAPED_UNICODE);
  }
  catch(PDOException $e)
  {
    // echo "Error: " . $e->getMessage();
    $response["success"] = 0;
    $response["message"] = "Fail to add the user ..";

  //  echo json_encode($response, JSON_UNESCAPED_UNICODE);
  }
  return $response;
}

public function initApp()
{
  try {
    $stmt = $this->conn->prepare("SELECT * FROM age_info;");
    $stmt->execute();
    $rows2 =$stmt->fetchAll(PDO::FETCH_ASSOC);
    $response["ageInfos"] = array();
    foreach($rows2 as $row2)
    {
      $age = array();
      $age['id']=$row2['id'];
      $age['title']=$row2['title'];
      $age['days']=$row2['days'];
      $age['days_until_next']=$row2['days_until_next'];
      array_push($response["ageInfos"] , $age);
    }
    $response["success"] = 1;
    $response["message"] = "Fetched successfully";;
    // echoing JSON response
    return $response;
  }
  catch(PDOException $e)
  {
  return  $this->response;
  }
}


public function getInfo($user_id,$age_info_id)
{
  try {
    $stmt = $this->conn->prepare("SELECT *,vaccinations.name as vaccinations_name,vaccinations.id as vaccinations_id FROM users
    inner join age_info on age_info.id=:age_info_id
    inner join vaccination_age_info on users.age_info_id= vaccination_age_info.age_info_id
    inner join vaccinations on vaccination_age_info.vaccination_id=vaccinations.id
         where users.id=:user_id;");
    $stmt->bindParam(':user_id', $user_id);
  $stmt->bindParam(':age_info_id', $age_info_id);

    $stmt->execute();
    $rows2 =$stmt->fetchAll(PDO::FETCH_ASSOC);
    $response["vaccinations"] = array();
    foreach($rows2 as $row2)
    {
      $age = array();
      $age['name']=$row2['vaccinations_name'];
      $age['id']=$row2['vaccinations_id'];
      $age['days']=$row2['days'];
        $age['days_until_next']=$row2['days_until_next'];
        $age['diet']=$row2['diet'];
          $age['length']=$row2['length'];
            $age['weight']=$row2['weight'];
      array_push($response["vaccinations"] , $age);
    }
    $response["success"] = 1;
    $response["message"] = "Fetched successfully";;
    // echoing JSON response
    return $response;
  }
  catch(PDOException $e)
  {
  return  $this->response;
  }
}

}
 ?>
