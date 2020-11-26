<?php


$db = new PDO('mysql:host=localhost;dbname=test',"root","");



$sorgu = $db->prepare('Select * from kelime');
$sorgu->execute();
if ($sorgu){
	$sonuc = $sorgu->fetchAll(PDO::FETCH_ASSOC);
	 echo json_encode($sonuc);
}


?>