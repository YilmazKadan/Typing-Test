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
	$email = $_POST['email'];
	$sifre = $_POST['sifre'];
	$sorgu = $db->prepare("Select * from kullanici where kullanici_mail = ? and kullanici_sifre = ? ");
	$sorgu->execute(array($email,$sifre));
	if ($sorgu->rowCount()) {
		$getir = $sorgu->fetch(PDO::FETCH_ASSOC);

		$sonuc['uye_ad'] = $getir['kullanici_adi']." ".$getir['kullanici_soyadi'];
		$_SESSION['id'] = $getir['kullanici_id'];
		$sonuc['durum']="basarili";
	}
	else{
		$sonuc['durum'] = "Kullanıcı adı veya şifre hatalı";
	}
	
	echo json_encode($sonuc);
}
else if ($_POST['postisim'] == 'kullanici_cikis'){
	$sonuc['durum'] = "basarili";
	session_destroy();
	echo json_encode($sonuc);
}
else if($_POST['postisim']  == "sonuc_kaydet"){
	if (isset($_SESSION['id'])) {
		$dks = $_POST['dks'];
		$dks_kullanici_id = $_SESSION['id'];
		$kayit = $db->prepare("Insert into dks_liste set dks_kullanici_id = ? , dks_sonuc = ?");
		$kayit->execute(array($dks_kullanici_id,$dks));
		if ($kayit->rowCount()) {
			$sonuc['durum'] = "basarili";
		}
		else{
			$sonuc['durum'] = "Kayıt işlemi sırasında bir hata ile karşılaşıldı";
		}
		
	}
	else{
		$sonuc['durum'] = "";
	}
	echo json_encode($sonuc);
}
else if ($_POST['postisim'] == "kayit_ol" ){

	try {
		$sorgu = $db->prepare("Select * from kullanici where kullanici_mail = '".$_POST['data']['kayit_email']."' ");
		$sorgu->execute();
		if (!$sorgu->rowCount()) {
			
			$sorgu = $db->prepare("insert into kullanici set kullanici_adi = ? , kullanici_soyadi = ?,  kullanici_mail = ? , kullanici_sifre = ? ");
			$kontrol = $sorgu->execute(array(
				$_POST['data']['kayit_ad'],
				$_POST['data']['kayit_soyad'],
				$_POST['data']['kayit_email'],
				$_POST['data']['kayit_sifre']
			));
			if ($kontrol) {
				$sonuc['durum'] = "basarili";
			}
		}
		else{
			$sonuc['durum'] = "Bu email adresi ile daha önce kayıt olunmuştur.";
		}



	} catch (PDOException $e) {
		$sonuc['durum'] = $e->getMessage();
	}
	
	echo json_encode($sonuc);
}

?>