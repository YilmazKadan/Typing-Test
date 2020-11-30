<?php

session_start();

$db = new PDO('mysql:host=localhost;dbname=test',"root","");

if ($_POST['postisim'] == "kelime_cek") {
	$sorgu = $db->prepare('Select * from kelime');
	$sorgu->execute();
	if ($sorgu){
		$sonuc = $sorgu->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($sonuc);
	}

}
else if ($_POST['postisim'] == 'kullanici_giris'){
	$sonuc['durum'] = "basarili";
	$_SESSION['id'] = "10";
	echo json_encode($sonuc);
}
else if ($_POST['postisim'] == 'kullanici_cikis'){
	$sonuc['durum'] = "basarili";
	session_destroy();
	echo json_encode($sonuc);
}


?>