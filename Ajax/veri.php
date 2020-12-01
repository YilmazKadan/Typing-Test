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
	
	if ($_POST['email'] == "kadan8080@gmail.com" and $_POST['sifre'] == "1234") {
		$sonuc['durum'] = "basarili";
		$_SESSION['id'] = "10";
	}
	else{
		$sonuc['durum'] = "basarisiz";	
	}
	echo json_encode($sonuc);
}
else if ($_POST['postisim'] == 'kullanici_cikis'){
	$sonuc['durum'] = "basarili";
	session_destroy();
	echo json_encode($sonuc);
}


?>