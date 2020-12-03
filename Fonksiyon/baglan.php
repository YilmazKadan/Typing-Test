<?php 
date_default_timezone_set('Europe/Istanbul');
try {
	$db = new PDO('mysql:host=localhost;dbname=test',"root","");
} catch (PDOException $e) {
	echo $e->getMessage();
}



?>