try{
	var hangisatir = 0;
	var tekrar_basla = document.getElementById('tekrar_basla');
	var yenile = document.getElementById('yenile');
	var giris = document.getElementById('giris');
	var kelime_turu = document.getElementById('kelime_turu');
	var kelime = 0;//Bu değişken yazılmakta olan kelimeyi belirtir.
	var anlikuzunluk_giris = 0,anlik_uzunlukkelime,topdegeri=0,sayac_kontrol = true;
	var deger = document.getElementsByClassName('kelime');
	var sonuc_alani = document.getElementById('sonuc_alani');
	var satir = document.getElementById('satir');
	var sutun = document.getElementById("sutun");
	var giris_alani = document.getElementById('giris_alani');
	var sonuc_basilan_toplamtus = document.getElementById('basilan_toplamtus');
	var sonuc_yanliskelime = document.getElementById('yanliskelime');
	var sonuc_dogrukelime = document.getElementById('dogrukelime');
	var sonuc_basilan_dogrutus = document.getElementById('basilan_dogrutus');
	var sonuc_basilan_yanlistus = document.getElementById('basilan_yanlistus');
	var sonuc_dogrulukorani= document.getElementById('dogrulukorani');
	var sonuc_dks = document.getElementById('sonuc_dks');
	var gerisayim = document.getElementById("gerisayim");
	var yazilar_alani = document.getElementById('yazilar');
	var yukleme = document.getElementById('yukleme');
	var giris_btn = document.getElementById('giris_btn');
	var cikis_btn = document.getElementById('cikis_btn');
	var session = document.getElementById('session');
	var ses = document.getElementById('ses');
	var kelime_tur_id = 0;
	var f5kontrol = true;
	var downloadTimer;
	var basilan_yanlistus = 0;
	var basilan_dogrutus = 0;
	var dogru_kelime = 0;
	var yanliskelime = 0;
	var basilan_toplamtus = 0;
	var dks = 0;
	sonuc_alani.style.display = "none";
	var sayac = 60;
	var kelimeler;
	var gelen_metin;
	if (session.value == "1") {
		giris_btn.style.display = "none";
	}
	else{
		cikis_btn.style.display = "none";
	}
	giris_btn.addEventListener("click",()=>{
		giris_yap()
	});
	cikis_btn.addEventListener("click",()=>{
		cikis_yap()
	});
	//KELİME TÜR, DİL VS OLUŞTURMA ALANI SELECT NESNESİ ONCHANGE OLDUĞUNDA BURASI TETİKLENİYOR
	function kelime_tur_sec(){
		kelime_tur_id = kelime_turu.value;
		kelimeler = gelen_metin[kelime_tur_id]['kelime_icerik'].split(" ");
		oyun_olustur();
	}

	//AJAX İLE VERİ TABANINDAN KELİME SEÇME İŞLEMİ
	//VERİ TABANINI YORMAMAK İÇİN BİR DEĞİŞKENE AKTARILIP PROGRAM İÇERİSİNDE O DEĞİŞKENDEN KELİME TÜRÜ SEÇİLİYOR
	function kelime_cek(){
		$.ajax(
		{
			type: "post",
			url: 'Ajax/veri.php',
			dataType:"json",
			data: {postisim:"kelime_cek"},
			success: function (data){
				gelen_metin = data;
				for (var i = 0 ; i<gelen_metin.length; i++){
					var secenek = new Option (gelen_metin[i]['kelime_tur'],i);
					kelime_turu.appendChild(secenek);
				}
				kelime_tur_id = kelime_turu.value;
				kelimeler = gelen_metin[kelime_tur_id]['kelime_icerik'].split(" ");
			},
		}
		);
	}

	function giris_yap(){
		$.ajax({
			type:"POST",
			url:'Ajax/veri.php',
			dataType:"json",
			data:{postisim:"kullanici_giris",email:"kadan8080@gmail.com",sifre:"1234"},
			success:function(data){
				if (data.durum == "basarili") {
					Swal.fire({
						position:'top-end',
						title:'Giris Başarılı!',
						icon:'success'
					}
					);
					//giris_btn.style.display = "none";
					setTimeout(() =>{location.reload()},1000);
				}

			}

		});
	}

	function cikis_yap(){
		$.ajax({
			type:"POST",
			url:'Ajax/veri.php',
			dataType:"json",
			data:{postisim:"kullanici_cikis",email:"kadan8080@gmail.com",sifre:"1234"},
			success:function(data){
				if (data.durum == "basarili") {
					Swal.fire({
						position:'top-end',
						title:'Çıkış Başarılı!',
						icon:'success'
					}
					);
					//giris_btn.style.display = "none";
					setTimeout(() =>{location.reload()},1000);
				}

			}

		});
	}


	kelime_cek();
	oyun_olustur();

	//DEĞİŞKEN SIFIRLAMA FONKSİYONU
	function degisken_sifirlama(){
		hangisatir = 0;
		kelime = 0;
		topdegeri = 0;
		basilan_yanlistus = 0;
		basilan_dogrutus = 0;
		dogru_kelime = 0;
		yanliskelime = 0;
		basilan_toplamtus = 0;
		sayac = 60;
		sonuc_alani.style.display = "none";
		satir.style.display = "";
		giris_alani.style.display = "";
		kelime_turu.style.display = "";
		giris.value = "";
		giris.disabled = false;
		giris.focus();
		sutun.innerHTML = "";
		yazilar_alani.style.top = 0;
		gerisayim.innerText = "1:00"; 
		sayac_kontrol = true;
		yukleme.style.display = "none";
		clearInterval(downloadTimer);
	}

	//METİN OLUŞTURMA FONKSİYONU
	function metin_olustur(kelimeler){
		//Kelime kelimelersinin elemanlarının karıştığı yer.
		for (let i = kelimeler.length - 1; i > 0; i--) {
			let j = Math.floor(Math.random() * (i + 1)); 

			[kelimeler[i], kelimeler[j]] = [kelimeler[j], kelimeler[i]];
		}

	//Kelimeleri yazdırma alanı.
	for (var i = 0;i<kelimeler.length;i++){

		var kelime_ekle = document.createElement("span");
		kelime_ekle.classList.add("kelime");
		if (kelimeler[i].trim() != ""){ //BAZI KELİMELER VERİ TABANINDAN BOŞ GELİYORSA EKLEME
			kelime_ekle.innerHTML = kelimeler[i];
			sutun.appendChild(kelime_ekle);

		}
	}
	$('#sutun span:first').addClass("arkaplan");
	
}
function oyun_olustur(){
	yukleme.style.display = "";
	satir.style.display = "none";
	sonuc_alani.style.display = "none";
	setTimeout(function(){
		degisken_sifirlama();
		metin_olustur(kelimeler);
	},200);
	
}
// F5 tuşu iptali 
document.onkeydown = function(e) {
	if (e.keyCode == 116) {	
		e.preventDefault();
		oyun_olustur();
	}

}
//TEKRAR BAŞLATMA BUTONU
tekrar_basla.addEventListener("click",function(){
	oyun_olustur();
});
//YENİLEME BUTONU
yenile.addEventListener("click",function(){
	oyun_olustur();
	
});

//TUŞ BASMA EVENTİ
giris.addEventListener('keypress',function(event){
	
		//Sayaç başlama alanı
		if (sayac_kontrol) {

			downloadTimer = setInterval(function(){
				if(sayac -1 <= 0){
					clearInterval(downloadTimer);
					giris.disabled = true;
					sonuc_alani.style.display = "";
					satir.style.display = "none";
					giris_alani.style.display = "none";
					kelime_turu.style.display = "none";
					gerisayim.innerHTML = "0:00"; 
					//Sonuçları yazdırma
					basilan_toplamtus = basilan_dogrutus + basilan_yanlistus;
					sonuc_basilan_toplamtus.innerHTML = basilan_toplamtus;
					sonuc_basilan_yanlistus.innerHTML = basilan_yanlistus;
					sonuc_basilan_dogrutus.innerHTML = basilan_dogrutus;
					sonuc_dogrukelime.innerHTML = dogru_kelime;
					sonuc_yanliskelime.innerHTML = yanliskelime;
					sonuc_dks.innerHTML = Math.floor((basilan_dogrutus/5)) +" DKS";
					sonuc_dogrulukorani.innerHTML = "%"+parseInt((100 * basilan_dogrutus ) / basilan_toplamtus);
				} else {
					if (sayac <10) {
						gerisayim.innerHTML = "0:0" + (sayac-1);
					}
					else{
						gerisayim.innerHTML = "0:" + (sayac-1);
					}
					
				}
				sayac -= 1;
			}, 1000);
		}
		sayac_kontrol = false;
		//Sayaç alanı bitiş
		var basilantus = event.which || event.keyCode;
		if(giris.value.trim() != "" ){//Giriş alanı boş değilse çalışacak kodlar.

			if(basilantus == 32){//Boşluk tuşuna basıldığında olacak olaylar
				deger[kelime].classList.remove("yanlis_anlik");	

				if (giris.value == deger[kelime].innerText) {
					deger[kelime].classList.remove("arkaplan");
					deger[kelime].classList.add("dogru");
					giris.value = "";
					dogru_kelime++;
					basilan_dogrutus += (deger[kelime].innerText.length +1);//+1 boşluk hesabıdır.
				}
				else{
					deger[kelime].classList.remove("arkaplan");
					deger[kelime].classList.add("yanlis");
					giris.value = "";
					yanliskelime++;
					basilan_yanlistus += (deger[kelime].innerText.length +1);
				}
				kelime++;
				if (deger[kelime].offsetTop > hangisatir) {
					var satir_yuksekligi = window.getComputedStyle(deger[kelime]);
					topdegeri += (-1)*parseInt(satir_yuksekligi.getPropertyValue("line-height"));
					hangisatir = deger[kelime].offsetTop;
					yazilar_alani.style.top = topdegeri;
				}				
				deger[kelime].classList.add("arkaplan");		
			}
		}
		else{
			giris.value = "";
		}	
		//Tuştan baskıyı çektiğimizde kalan boşluğu silme alanı.
		giris.addEventListener('keyup',function(event){
			//Anlik kontrol alanı
			anlikuzunluk_giris = giris.value.length ;
			anlik_uzunlukkelime = deger[kelime].innerText.substr(0,anlikuzunluk_giris );
			if(giris.value == anlik_uzunlukkelime)
			{
				deger[kelime].classList.remove("yanlis_anlik");		
			}
			else{
				deger[kelime].classList.add("yanlis_anlik");
			}
		//Anlik kontrol alanı son
		if(giris.value == " " )
			giris.value = "";
	});		
	});
}
catch (mesaj){
	alert(mesaj.message);
}