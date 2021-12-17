<?php

// $connect = new mysqli("http://mikoroonline.com","mikoroon_admin","hK+K.N{V2AFl","“mikoroon_my_store");

// User “mikoroon_admin” was added to the database “mikoroon_my_store”.
 $connect = new mysqli("localhost","root","","my_store");

if ($connect){
echo "Connection Success";	
}else{
	echo "Connection Failed";
	exit();	
}
	
?>