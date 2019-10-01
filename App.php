<?php
ini_set('default_charset', 'UTF-8');
header('Content-type:application/json;charset=utf-8');
//error_reporting(E_ALL ^ E_DEPRECATED);
$response = array();
$json;
if (isset($_GET['json'])||isset($_POST['json'])) {
  if(isset($_GET['json'])) $json = json_decode($_GET['json'],true);
  else if(isset($_POST['json'])) $json = json_decode($_POST['json'],true);
  if ($json !== null && json_last_error() === JSON_ERROR_NONE) {
    //do something with $json. It's ready to use
    $response["success"] = 1;
    $response["message"] ="";
    $root = realpath($_SERVER["DOCUMENT_ROOT"]);
    if(array_key_exists('method', $json)){
      $method=$json['method'];
      require_once 'AppCore.php';
      $appCore=new AppCore($json);
      switch ($method) {
        case 'addUser':
        $response["data"]=  $appCore->adduser($json['name'],$json['baby_name'],$json['age_info_id']);
        break;
        case 'initApp':
       $response["data"]=  $appCore->initApp();
        break;

        case 'getInfo':
       $response["data"]=  $appCore->getInfo($json['user_id'],$json['age_info_id']);
        break;
        default:
        // code...
        $response["success"] = 0;
        $response["message"] ="Error, Method not found";
        break;
      }
    }else {
      // code...
      $response["success"] = 0;
      $response["message"] ="Error, Handler or lang Pram  not found";
    }

  } else {
    //yep, it's not JSON. Log error or alert someone or do nothing
    $response["success"] = 0;
    $response["message"] ="Error, Query is not Json object";
  }
  echo json_encode($response, JSON_UNESCAPED_UNICODE);
  $conn = null;
} else {
  // required field is missing
  $response["success"] = 0;
  $response["message"] = "App Required field(s) is missing..";
  // echoing JSON response
  echo json_encode($response, JSON_UNESCAPED_UNICODE);
}
?>
