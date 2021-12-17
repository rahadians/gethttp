<?php

include 'conn.php';

	$id = $_POST['id']
	$itemcode = $_POST ['itemcode'];
	$itemname = $_POST ['itemname'];
	$price = $_POST ['price'];
	$stock = $_	POST ['stock'];

	$connecdt->query("UPDATE tb_item SET item_code='".$itemcode."',item_name='".$itemname."',price='".$price."',stock='".$stock."' WHERE id=". $id");
?>