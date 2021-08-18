<?php
header("Access-Control-Allow-Headers:Access-Control-Allow-Origin, Accept");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-type:application/json;charset=utf-8"); 
header("Access-Control-Allow-Methods: GET");

require_once('Config.php');



 $sql = "SELECT * FROM survey where order_date > now() - INTERVAL 7 day";
 $r = mysqli_query($con,$sql);
 $result = array();
 while ($row = mysqli_fetch_array($r)) {
  array_push($result,array("id"=>$row['0'],"name"=>$row['1'],"foreigner"=>$row['2'],"person"=>$row['3']));
}
echo json_encode(array("result"=>$result));

mysqli_close($con);
?>