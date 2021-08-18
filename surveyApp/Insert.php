<?php
require_once "Config.php";

$name=$_POST["names"];
$foreigner=$_POST["foreigners"];
$person=$_POST["persons"];

$query="insert into survey (name,foreigner,person) values ('$name','$foreigner','$person')";
$result = mysqli_query($con,$query);

if($result){
	echo "done";
}
else{
	echo "error";
}
?>