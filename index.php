<?php session_start();

if (isset($_SESSION['id'])) {
	echo '<input style = "display:none;" id = "session_kontrol" value = "1">';
}
else {
	echo '<input  style = "display:none;" id = "session_kontrol" value = "0">';
}
?>
<html>
<head>

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Bitter:wght@100;400&display=swap" rel="stylesheet">
	<!-- reference your copy Font Awesome here (from our CDN or by hosting yourself) -->
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	
	<!--  Bootstrap/ !-->
	<link rel="stylesheet" href="Bootstrap/css/bootstrap.min.css" >
	<link rel = "stylesheet" type = "text/css" href = "stil.css">

	<!-- Swett Alert !-->
	<link rel = "stylesheet" href = "node_modules\sweetalert2\dist\sweetalert2.css">
	<meta charset = "utf8">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light container" style="background-color:#e3f2fd;">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="index.php">ON PARMAK YAZ</a>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
			<ul class="nav navbar-nav">
				<li class="nav-item"><a href="" class="nav-link">Anasayfa</a></li>
			</ul>
			<ul class="nav  navbar-nav ml-auto ">
				<li class="nav-item">
					<a href="#" id="giris_icon" onclick="giris_yap();" class="nav-link"><span class="fas fa-user"></span>Giriş</a>
				</li>
				<li class="nav-item">
					<a href="#" id="kayit_icon" onclick="kayit_ol()" class="nav-link"><span class="fas fa-user"></span>Kayıt Ol</a>
				</li>
				<li class="nav-item">
					<a href="#"  id="cikis_icon" onclick = "cikis_yap()" class="nav-link"><span class="fas fa-sign-out-alt"></span>Çıkış</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container" >
		<div class="row mt-5">
			<div class="col col-md-12">
				<div class="row mb-2 ">
					<div class="col col-md-2 p-0">	
						<select class="custom-select form-control custom-select-lg mb-3 " id = "kelime_turu" onchange="kelime_tur_sec()">
						</select>
					</div>
					<div class="col col-md-2 p-0 ">	
						<button class="btn btn-primary btn-lg"  id = "giris_btn">Giriş Yap</button>
						<button class="btn btn-danger btn-lg"  id = "cikis_btn">Çıkış Yap</button>
						
					</div>	
				</div>
				<div class="row" >
					<img class="mx-auto" style="display:none;" id = "yukleme"    width="100" src="yukleme.gif">
				</div>
				<div class="row satir  unselectable" id = "satir">
					<div  id = "yazilar" class="yazilar  ">
						<div id = "sutun" class = "col col-md-12 ">
						</div>
					</div>
				</div>

				<div class="row giris_alani mt-5 " id = "giris_alani">
					<div class = "col col-md-8 p-0 ">
						<input id = "giris" class = "giris form-control" type = "text" autocomplete="off" autofocus>
					</div>
					<div class = "col-md-2 p-0 m-0">
						<button id = "gerisayim" class = "btn btn-primary saniye form-control buton">1:00</button>
					</div>
					<div class = "col-md-2 p-0 m-0">
						<button id = "yenile" class = "btn btn-primary saniye form-control buton"><i class="fas fa-sync "></i></button>
					</div>
				</div>
				<!--  SONUÇ ALANI !-->
				<div class="row  mt-5" id = "sonuc_alani">
					<div  class="col col-md-6 ">
						<div class="card shadow-lg" style="width: 26rem;min-height: 230px;">

							<div class="card-body">
								<h3 class="card-title">Tebrikler testi başarıyla bitirdiniz!</h3>
								<div class="row">
									<div class="col">
										<p id = "sonuc_dks" class="card-text"></p>
									</div>
								</div>
								<div class="row">
									<div class="col col-md-6">
										<p  class="card-text">Tuş Vuruşu:</p>
									</div>
									<div class="col col-md-6">
										(<span id="basilan_dogrutus" class="text-success">6</span>-<span id="basilan_yanlistus" class="text-danger">6</span>) <span style = "font-size:18px;" id="basilan_toplamtus">17</span>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col col-md-6">
										<p id = "dogruluk" class="card-text">Doğruluk:</p>
									</div>
									<div class="col col-md-6">
										<span style="font-size:26px;" id="dogrulukorani" class="text-dark"></span>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col col-md-6">
										<p class="card-text">Doğru Kelime:</p>
									</div>
									<div class="col col-md-6">
										<span style="font-size:20px;" id="dogrukelime" class="text-success"></span>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col col-md-6">
										<p class="card-text">Yanlış Kelime:</p>
									</div>
									<div class="col col-md-6">
										<span style="font-size:20px;" id="yanliskelime" class="text-danger">6</span>
									</div>
								</div>
								<hr>
								<button id = "tekrar_basla"  class="btn btn-primary">Tekrar Başla</button>
							</div>
						</div>
					</div>
				</div>
				<!--  SONUÇ ALANI BİTİŞ !-->
				<!-- SIRALAMA !-->
					<div class="row mt-5">
						<div class="col col-md-7" >
							<h2>Son 24 saat klavye hızlı sıralaması</h2>
						</div>
					</div>
					<div class="row ">
						<div class="col-md-7">
							<table class="table  table-info table-bordered table-striped">
								<thead class="thead-dark">
									<tr>
										<th></th>
										<th></th>
										<th>Kullanıcı Adı</th>
										<th>DKS</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1.</td>
										<td align="center"><img src="avatar.jpg" width="50"></td>
										<td>Alper Gürbüz</td>
										<td>120</td>
									</tr>
									<tr>
										<td>2.</td>
										<td align="center"><img src="avatar.jpg" width="50"></td>
										<td>Yılmaz Kadan</td>
										<td>80</td>
									</tr>
									<tr>
										<td>3.</td>
										<td align="center"><img src="avatar.jpg" width="50"></td>
										<td>Hüseyin Doğan</td>
										<td>75</td>
									</tr>
									<tr>
										<td>4.</td>
										<td align="center"><img src="avatar.jpg" width="50"></td>
										<td>Mehmet Emin Koç</td>
										<td>65</td>
									</tr>
									<tr>
										<td>5.</td>
										<td align="center"><img src="avatar.jpg" width="50"></td>
										<td>Halil Kadan</td>
										<td>45</td>
									</tr>
								</tbody>

							</table>
						</div>
					</div>
			</div>
		</div>
	</div>	
</body>
</html>
<script src="jquery.js"></script>
<script  src = "node_modules\sweetalert2\dist\sweetalert2.all.min.js"> </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="Bootstrap/js/bootstrap.min.js" ></script>
<script type="text/javascript" src = "js.js"></script>