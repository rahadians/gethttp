<?php
include 'conn.php';

 $queryResult=$connect->query("select * from mystore");

 $result=array();
 
 while ($fetchData=$queryResult -> fetch_assoc()){

	 $result[]=$fetchData;


 }

echo json_encode($result); 	
// echo $result;
?>