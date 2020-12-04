<?php
session_start();
require_once('../Fonksiyon/baglan.php');
require_once("../Fonksiyon/fonksiyon.php");

if ($_POST['postisim'] == "kelime_cek") {
	$sorgu = $db->prepare('Select * from kelime');
	$sorgu->execute();
	if ($sorgu){
		$sonuc = $sorgu->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($sonuc,JSON_UNESCAPED_UNICODE);
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
//SONUÇ KAYDETME FONKSİYONU
else if($_POST['postisim']  == "sonuc_kaydet"){
	if (isset($_SESSION['id'])) {
		//BU KARMAŞA KISACA ŞUNU ANLATIYOR 
		//EĞER OTURUM AÇIKSA KAYITLARA BAKIYOR DAHA ÖNCE TEST YAPILMAMIŞSA SONUCU EKLİYOR EĞER YAPILMIŞ İSE HANGİ SONUCUN DAHA BÜYÜK OLDUĞUNA BAKIYOR VE ONA GÖRE GÜNCELLEME İŞLEMLERİNİ YAPIYOR.
		$tarih = date('Y.m.d H:i:s');
		$dks = $_POST['dks'];
		$dks_kullanici_id = $_SESSION['id'];
		$sorgu = $db->query("select * from dks_liste where dks_kullanici_id = '$dks_kullanici_id'");
		if ($sorgu->rowCount()) {
			$sorgula = $db->query("Select * from dks_liste where dks_sonuc < '$dks' and dks_kullanici_id = '$dks_kullanici_id' ");
			if ($sorgula->rowCount()) {
				$update = $db->query("Update dks_liste set dks_sonuc = '$dks' , dks_tarih = '$tarih' , tekrar = tekrar + 1  where dks_kullanici_id = '$dks_kullanici_id'");
			}
		}
		else{

			$kayit = $db->prepare("Insert into dks_liste set dks_kullanici_id = ? , dks_sonuc = ?");
			$kayit->execute(array($dks_kullanici_id,$dks));
			if ($kayit->rowCount()) {
				$sonuc['durum'] = "basarili";
			}
			else{
				$sonuc['durum'] = "Kayıt işlemi sırasında bir hata ile karşılaşıldı";
			}
		}
	}
}
//SIRALAMA ÇEKME İŞLEMİ
else if ($_POST['postisim'] == "siralama_cek"){
	$sayac = 1;
	$tablo = "";
	
	$gecen_sure = array();
	$sorgu = $db->query("Select *  from 
		dks_liste INNER JOIN kullanici ON 
		dks_liste.dks_kullanici_id = kullanici.kullanici_id

		order by  dks_sonuc DESC",PDO::FETCH_ASSOC);
	foreach ($sorgu as $gelen){
		$aktif = '';
		$gecen_sure = saat_farki($gelen['dks_tarih']);
		if (isset($_SESSION['id'])) {
			if ($_SESSION['id'] == $gelen['kullanici_id']) 
				$aktif = 'class = "table-warning"';
		} 
		$tablo.=
		"
		<tr $aktif >
		<td> $sayac </td>
		<td align='center'><img src='avatar.jpg' width='50'></td>
		<td> ".$gelen['kullanici_adi']." ".$gelen['kullanici_soyadi']."</td>
		<td> ".$gelen['dks_sonuc']." </td>
		<td> ".surefarkyaz($gecen_sure)."</td>
		<td> ".$gelen['tekrar'].".Deneme </td>
		</tr>

		";
		$sayac++; 
	}
	echo $tablo;
}
//KAYIT OLMA İŞLEMLERİ
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