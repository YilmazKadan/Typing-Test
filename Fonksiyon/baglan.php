<?php 
date_default_timezone_set('Europe/Istanbul');
try {
	$db = new PDO('mysql:host=localhost;dbname=test',"root","");
	$db->query("SET NAMES 'UTF8'");//DİL AYARI İÇİN
} catch (PDOException $e) {
	echo $e->getMessage();
}



?>