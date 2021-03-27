-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 27 Mar 2021, 22:03:19
-- Sunucu sürümü: 10.4.11-MariaDB
-- PHP Sürümü: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `test`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dks_liste`
--

CREATE TABLE `dks_liste` (
  `dks_id` int(11) NOT NULL,
  `dks_kullanici_id` int(11) NOT NULL,
  `dks_sonuc` int(11) NOT NULL,
  `dks_tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `tekrar` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `dks_liste`
--

INSERT INTO `dks_liste` (`dks_id`, `dks_kullanici_id`, `dks_sonuc`, `dks_tarih`, `tekrar`) VALUES
(11, 14, 88, '2020-12-04 14:41:13', 3),
(12, 15, 80, '2020-12-03 01:03:02', 1),
(13, 16, 91, '2020-12-05 14:06:47', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kelime`
--

CREATE TABLE `kelime` (
  `kelime_id` int(11) NOT NULL,
  `kelime_tur` varchar(250) COLLATE utf8_turkish_ci DEFAULT NULL,
  `kelime_icerik` text COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kelime`
--

INSERT INTO `kelime` (`kelime_id`, `kelime_tur`, `kelime_icerik`) VALUES
(0, 'Türkçe', 'bir \r\nve \r\nbu \r\niçin \r\no \r\nben \r\ndemek \r\nçok \r\nyapmak \r\nne \r\ngibi \r\ndaha \r\nalmak \r\nvar \r\nkendi \r\ngelmek \r\nile \r\nvermek \r\nama \r\nsonra \r\nkadar \r\nyer \r\nen \r\ninsan \r\ndeğil \r\nher \r\nistemek \r\nyıl \r\nçıkmak \r\ngörmek \r\ngün \r\nbiz \r\ngitmek \r\niş \r\nşey \r\nara \r\nki \r\nbilmek \r\nel \r\nzaman \r\nya \r\nçocuk \r\niki \r\nbakmak \r\nçalışmak \r\niçinde \r\nbüyük \r\nyok \r\nbaşlamak \r\nyol \r\nkalmak \r\nneden \r\nsiz \r\nkonu \r\nyapılmak \r\niyi \r\nkadın \r\nev \r\nise \r\ndiye \r\nbulunmak \r\nsöylemek \r\ngöz \r\ngerekmek \r\ndünya \r\nbaş \r\ndurum \r\nyan \r\ngeçmek \r\nsen \r\nonlar \r\nyeni \r\nönce \r\nbaşka \r\norta \r\nsu \r\ngirmek \r\nülke \r\nyemek \r\nhiç \r\nbile \r\nnasıl \r\nbütün \r\nkarşı \r\nbulmak \r\nböyle \r\nyaşamak \r\ndüşünmek \r\naynı \r\niç \r\nancak \r\nkişi \r\nbunlar \r\nveya \r\nilk \r\ngöre \r\nön \r\nson \r\nbiri \r\nşekil \r\nönemli \r\nyüz \r\nhem \r\ngöstermek \r\netmek \r\nalt \r\ngetirmek \r\nkullanmak \r\nçünkü \r\ntaraf \r\nşimdi \r\nadam \r\nonun \r\ndiğer \r\nartık \r\nüzerinde \r\nses \r\nhep \r\ndoğru \r\ndurmak \r\nkız \r\ntüm \r\nçekmek \r\nkonuşmak \r\npara \r\nanlamak \r\nanne \r\naz \r\nbazı \r\nbaba \r\nhayat \r\nsadece \r\nküçük \r\nfazla \r\nbilgi \r\nan \r\nsormak \r\nbunun \r\nöyle \r\nyine \r\nsağlamak \r\nsonuç \r\nkullanılmak \r\ndış \r\nad \r\nyani \r\nsüre \r\ndönmek \r\naçmak \r\noturmak \r\nanlatmak \r\nbırakmak \r\nhemen \r\nsaat \r\nyaş \r\nsorun \r\ndevlet \r\nsahip \r\nsıra \r\nyazmak \r\nyüzde \r\nay \r\natmak \r\ntutmak \r\nbunu \r\nolay \r\ndüşmek \r\nduymak \r\nsöz \r\ngüzel \r\nsevmek \r\nbiraz \r\nzor \r\nçıkarmak \r\nşu \r\nkoymak \r\ntek \r\nsistem \r\nbirlikte \r\nverilmek \r\nkim \r\nalınmak \r\ngenç \r\nkapı \r\nkitap \r\nüzerine \r\nburada \r\ngece \r\nalan \r\nbirbiri \r\nişte \r\nbeklemek \r\nuzun \r\nhiçbir \r\nbugün \r\ndönem \r\narkadaş \r\nürün \r\n'),
(4, 'English', 'from\r\n use\r\n leave\r\n two\r\n America\r\n another\r\n tell\r\n how\r\n add\r\n song\r\n thing\r\n tree\r\n between\r\n never\r\n eye\r\n stop\r\n up\r\n year\r\n why\r\n spell\r\n form\r\n mean\r\n man\r\n never\r\n often\r\n should\r\n sentence\r\n four\r\n men\r\n year\r\n letter\r\n example\r\n sound\r\n letter\r\n it\r\n world\r\n America\r\n quickly\r\n write\r\n some\r\n up\r\n play\r\n took\r\n him\r\n mother\r\n from\r\n follow\r\n can\r\n high\r\n what\r\n your\r\n first\r\n use\r\n she\r\n first\r\n often\r\n end\r\n seem\r\n own\r\n white\r\n had\r\n small\r\n must\r\n along\r\n when\r\n see\r\n find\r\n help\r\n always\r\n it\r\n found\r\n animal\r\n question\r\n paper\r\n well\r\n watch\r\n again\r\n this\r\n open\r\n come\r\n mean\r\n look\r\n own\r\n very\r\n sometimes\r\n picture\r\n later\r\n earth\r\n feet\r\n by\r\n out\r\n even\r\n car\r\n large\r\n each\r\n that\r\n kind\r\n some\r\n over\r\n leave\r\n got\r\n man\r\n her\r\n hard\r\n first\r\n house\r\n they\r\n we\r\n eat\r\n Indian\r\n list\r\n his\r\n who\r\n state\r\n any\r\n us\r\n walk\r\n question\r\n as\r\n its\r\n give\r\n quite\r\n food\r\n were\r\n girl\r\n big\r\n would\r\n there\r\n being\r\n below\r\n page\r\n because\r\n if\r\n country\r\n spell\r\n show\r\n do\r\n school\r\n grow\r\n to\r\n head\r\n any\r\n study\r\n quite\r\n back\r\n try\r\n plant\r\n here\r\n play\r\n will\r\n little\r\n side\r\n might\r\n above\r\n part\r\n write\r\n those\r\n sentence\r\n them\r\n watch\r\n city\r\n another\r\n tell\r\n oil\r\n him\r\n something\r\n good\r\n family\r\n into\r\n learn\r\n made\r\n always\r\n cut\r\n put\r\n together\r\n was\r\n much\r\n quite\r\n by\r\n more\r\n with\r\n only\r\n enough\r\n are\r\n have\r\n you\r\n side\r\n quick\r\n far\r\n same\r\n need\r\n most\r\n boy\r\n thought\r\n carry\r\n keep\r\n give\r\n until\r\n oil\r\n two\r\n hear\r\n eat\r\n about\r\n while\r\n see\r\n letter\r\n with\r\n family\r\n said\r\n open\r\n find\r\n picture\r\n kind\r\n hand\r\n answer\r\n keep\r\n but\r\n your\r\n water\r\n form\r\n make\r\n well\r\n find\r\n these\r\n when\r\n time\r\n it\'s\r\n before\r\n read\r\n or\r\n father\r\n miss\r\n take\r\n car\r\n here\r\n world\r\n part\r\n paper\r\n one\r\n only\r\n begin\r\n far\r\n need\r\n could\r\n did\r\n away\r\n Indian\r\n mother\r\n eat\r\n an\r\n point\r\n way\r\n number\r\n family\r\n three\r\n such\r\n will\r\n people\r\n mean\r\n no\r\n begin\r\n at\r\n other\r\n if\r\n so\r\n without\r\n such\r\n into\r\n face\r\n can\r\n our\r\n about\r\n picture\r\n page\r\n want\r\n example\r\n along\r\n place\r\n plant\r\n so\r\n add\r\n other\r\n the\r\n few\r\n high\r\n it\'s\r\n may\r\n three\r\n let\r\n line\r\n light\r\n be\r\n get\r\n its\r\n and\r\n how\r\n we\r\n next\r\n think\r\n long\r\n are\r\n well\r\n does\r\n under\r\n men\r\n second\r\n every\r\n always\r\n me\r\n end\r\n country\r\n who\r\n get\r\n all\r\n house\r\n old\r\n around\r\n country\r\n once\r\n by\r\n light\r\n new\r\n mile\r\n more\r\n below\r\n life\r\n keep\r\n next\r\n their\r\n want\r\n young\r\n day\r\n off\r\n come\r\n try\r\n took\r\n left\r\n few\r\n could\r\n off\r\n too\r\n between\r\n bo'),
(5, 'Greek', 'για\r\n  τότε\r\n  μέρα\r\n  τους\r\n  είσαι\r\n  κανείς\r\n  σπίτι\r\n  ναι\r\n  ήθελα\r\n  κάθε\r\n  πάει\r\n  έπρεπε\r\n  να\r\n  τις\r\n  ξέρεις\r\n  μόνο\r\n  λάθος\r\n  δε\r\n  περίμενε\r\n  σε\r\n  συμβαίνει\r\n  πολλά\r\n  είμαστε\r\n  κάποιον\r\n  όλα\r\n  τώρα\r\n  μου\r\n  κύριε\r\n  έξω\r\n  έχει\r\n  ωραία\r\n  λυπάμαι\r\n  πως\r\n  τον\r\n  εγώ\r\n  το\r\n  είχε\r\n  της\r\n  όμως\r\n  φαίνεται\r\n  το\r\n  κάθε\r\n  μία\r\n  ίσως\r\n  είπα\r\n  έχουμε\r\n  μπορεί\r\n  γυναίκα\r\n  καλό\r\n  εντάξει\r\n  ένα\r\n  με\r\n  πού\r\n  εκεί\r\n  λέει\r\n  ωραία\r\n  δε\r\n  είχα\r\n  στα\r\n  αλλά\r\n  οι\r\n  έγινε\r\n  μέχρι\r\n  μέσα\r\n  εκεί\r\n  τον\r\n  σας\r\n  έτσι\r\n  θέλεις\r\n  τώρα\r\n  με\r\n  στο\r\n  έτσι\r\n  όπως\r\n  έχουν\r\n  μας\r\n  χρόνια\r\n  πώς\r\n  πιο\r\n  στιγμή\r\n  πίσω\r\n  μετά\r\n  μαζί\r\n  γεια\r\n  γίνει\r\n  έλα\r\n  αυτόν\r\n  άλλο\r\n  μια\r\n  της\r\n  πράγματα\r\n  έκανε\r\n  αλήθεια\r\n  από\r\n  μου\r\n  σου\r\n  πράγματα\r\n  όλα\r\n  νομίζω\r\n  καλό\r\n  μπορεί\r\n  δύο\r\n  πού\r\n  θες\r\n  είστε\r\n  ότι\r\n  φορά\r\n  πας\r\n  λεφτά\r\n  χωρίς\r\n  άλλη\r\n  έκανα\r\n  σε\r\n  σπίτι\r\n  ίσως\r\n  ένας\r\n  τόσο\r\n  στην\r\n  έχω\r\n  καλύτερα\r\n  ξέρεις\r\n  στιγμή\r\n  γιατί\r\n  κι\r\n  μία\r\n  κάνεις\r\n  τι\r\n  πεις\r\n  θεέ\r\n  τίποτα\r\n  μέσα\r\n  πόσο\r\n  ένα\r\n  μπορείς\r\n  έχουμε\r\n  καλή\r\n  αν\r\n  αυτά\r\n  ζωή\r\n  δυο\r\n  πω\r\n  είμαι\r\n  ήθελα\r\n  πάντα\r\n  έχει\r\n  παιδί\r\n  πάω\r\n  λοιπόν\r\n  πιο\r\n  μέρος\r\n  είμαι\r\n  τη\r\n  είμαστε\r\n  αλήθεια\r\n  πες\r\n  πίσω\r\n  κάνεις\r\n  ποιος\r\n  σου\r\n  αυτό\r\n  ακόμα\r\n  αυτή\r\n  όπως\r\n  λες\r\n  είπα\r\n  τους\r\n  πόσο\r\n  λένε\r\n  εσύ\r\n  συγγνώμη\r\n  πες\r\n  τις\r\n  μπορείς\r\n  ας\r\n  καλύτερα\r\n  σαν\r\n  μόλις\r\n  λάθος\r\n  ναι\r\n  ήμουν\r\n  όχι\r\n  πάω\r\n  να\r\n  πριν\r\n  εγώ\r\n  έκανε\r\n  βλέπω\r\n  κι\r\n  κάνει\r\n  όλοι\r\n  κ\r\n'),
(6, 'German', '  schon\r\n  beiden\r\n  ein\r\n  du\r\n  nun\r\n  in\r\n  mich\r\n  sondern\r\n  können\r\n  euch\r\n  ihr\r\n  war\r\n  sehr\r\n  eines\r\n  man\r\n  Hand\r\n  haben\r\n  einem\r\n  sich\r\n  gut\r\n  sehr\r\n  da\r\n  zwar\r\n  worden\r\n  wieder\r\n  welcher\r\n  Jahre\r\n  welcher\r\n  sehen\r\n  weit\r\n  zwei\r\n  immer\r\n  in\r\n  so\r\n  wurde\r\n  sich\r\n  ihrem\r\n  Weise\r\n  Seite\r\n  ein\r\n  meine\r\n  von\r\n  keine\r\n  haben\r\n  doch\r\n  waren\r\n  kein\r\n  die\r\n  ob\r\n  ganz\r\n  dem\r\n  welches\r\n  auf\r\n  gut\r\n  damit\r\n  soll\r\n  diese\r\n  im\r\n  ihre\r\n  Menschen\r\n  dies\r\n  seinen\r\n  denn\r\n  ja\r\n  kommen\r\n  des\r\n  jetzt\r\n  muss\r\n  kann\r\n  bald\r\n  unter\r\n  sehen\r\n  einzelnen\r\n  da\r\n  will\r\n  ganze\r\n  hatten\r\n  vielleicht\r\n  also\r\n  du\r\n  sein\r\n  also\r\n  Weise\r\n  ihnen\r\n  sagen\r\n  Herr\r\n  seinem\r\n  im\r\n  wurden\r\n  bin\r\n  nun\r\n  mehr\r\n  dich\r\n  an\r\n  selbst\r\n  vor\r\n  eine\r\n  um\r\n  dich\r\n  alles\r\n  an\r\n  kann\r\n  wurden\r\n  hat\r\n  anders\r\n  recht\r\n  ersten\r\n  nichts\r\n  am\r\n  was\r\n  werde\r\n  ich\r\n  ganzen\r\n  mit\r\n  doch\r\n  ersten\r\n  einer\r\n  gegen\r\n  machen\r\n  so\r\n  vielleicht\r\n  worden\r\n  Weise\r\n  etwas\r\n  keine\r\n  sie\r\n  ein\r\n  es\r\n  nicht\r\n  gewesen\r\n  darauf\r\n  wir\r\n  unter\r\n  wir\r\n  ganze\r\n  dieses\r\n  kann\r\n  bald\r\n  Hand\r\n  mein\r\n  es\r\n  seinen\r\n  dieser\r\n  ja\r\n  macht\r\n  wollen\r\n  zu\r\n  kein\r\n  weiter\r\n  sollte\r\n  gewesen\r\n  euch\r\n  lange\r\n  mein\r\n  machen\r\n  als\r\n  allein\r\n  auf\r\n  recht\r\n  müssen\r\n  den\r\n  uns\r\n  die\r\n  nach\r\n  allein\r\n  würde\r\n  dass\r\n  mich\r\n  werden\r\n  gewesen\r\n  weil\r\n  er\r\n  dessen\r\n  sein\r\n  gemacht\r\n  würde\r\n  zwei\r\n  mehr\r\n  ihm\r\n  Leben\r\n  lassen\r\n  durch\r\n  ihre\r\n  wo\r\n  da\r\n  ist\r\n  meiner\r\n  mir\r\n  der\r\n  Mann\r\n  sagen\r\n  habe\r\n  allen\r\n  kommen\r\n  ohne\r\n  nur\r\n  nicht\r\n  einzelnen\r\n  hätte\r\n  bald\r\n  konnte\r\n  noch\r\n  über\r\n  wollen\r\n  noch\r\n  welches\r\n  sein\r\n  dieser\r\n  ihrer\r\n  eben\r\n  und\r\n  Seite\r\n  ihr\r\n  vor\r\n  denn\r\n  etwas\r\n  um\r\n  anderen\r\n  diese\r\n  was\r\n  mir\r\n  für\r\n  wird\r\n  ich\r\n  wohl\r\n  ihren\r\n  war\r\n  ganze\r\n  damit\r\n  würde\r\n  nicht\r\n  jetzt\r\n  Leben\r\n  will\r\n  Liebe\r\n  seiner\r\n  und\r\n  lassen\r\n  des\r\n  dann\r\n  auch\r\n  hatte\r\n  für\r\n  als\r\n  ob\r\n  Frau\r\n  wo\r\n  eine\r\n  einem\r\n  mich\r\n  als\r\n  selbst\r\n  ihm\r\n  nun\r\n  welches\r\n  eines\r\n  zu\r\n  Jahre\r\n  werden\r\n  seine\r\n  dann\r\n  meiner\r\n  einmal\r\n  um\r\n  deren\r\n  über\r\n  lange\r\n  habe\r\n  ihrer\r\n  man\r\n  wohl\r\n  meiner\r\n  Leben\r\n  aber\r\n  ihm\r\n  meine\r\n  macht\r\n  gar\r\n  das\r\n  welche\r\n  dem\r\n  würde\r\n  heute\r\n  dass\r\n  gegen\r\n  anderen\r\n  seinen\r\n  nur\r\n  recht\r\n  durch\r\n  gegen\r\n  einer\r\n  können\r\n  mit\r\n  alle\r\n  waren\r\n  das\r\n  seinem\r\n  alle\r\n  ganz\r\n  sie\r\n  nach\r\n  aber\r\n  wie\r\n  diesen\r\n  ohne\r\n  seine\r\n  dies\r\n  mehr\r\n  wer\r\n  ganzen\r\n  uns\r\n  bis\r\n  sind\r\n  ihn\r\n  sie\r\n  Menschen\r\n  werden\r\n  alles\r\n  im\r\n  bei\r\n  dir\r\n  einer\r\n  denen\r\n  konnte\r\n  sind\r\n  der\r\n  zum\r\n  Hand\r\n  kommen\r\n'),
(7, 'Russian', ' что\r\n снова\r\n нога\r\n потому\r\n со\r\n знать\r\n перед\r\n слово\r\n вдруг\r\n я\r\n ночь\r\n тот\r\n сторона\r\n оказаться\r\n лишь\r\n про\r\n там\r\n сидеть\r\n свое\r\n каждый\r\n он\r\n еще\r\n правда\r\n место\r\n деньги\r\n она\r\n новый\r\n свой\r\n себя\r\n рука\r\n тут\r\n говорить\r\n дать\r\n там\r\n вы\r\n через\r\n раз\r\n быть\r\n пока\r\n рабо'),
(8, 'Indonesian', ' kerja\r\n karena\r\n sebuah\r\n tidak\r\n malam\r\n bila\r\n untuk\r\n sama\r\n ada\r\n hati\r\n bagus\r\n untuk\r\n mata\r\n seperti\r\n bahwa\r\n jauh\r\n pula\r\n uang\r\n bisa\r\n perlu\r\n dari\r\n sedikit\r\n mata\r\n kepada\r\n akan\r\n naik\r\n kemudian\r\n mau\r\n sampai\r\n kepala\r\n baru\r\n pusat\r\n dan\r\n dia\r\n telah\r\n sekitar\r\n kecuali\r\n salah\r\n nama\r\n cara\r\n mulai\r\n sementara\r\n banyak\r\n kini\r\n bagus\r\n ingin\r\n'),
(9, 'Hindi', ' पर\r\n तेल\r\n रास्ता\r\n हालत\r\n जोड़ना\r\n होगा\r\n नीचे\r\n पशु\r\n की\r\n दो\r\n जहाँ\r\n चार\r\n भी\r\n इतना\r\n अलग\r\n जोड़ना\r\n लगभग\r\n मदद\r\n शुरू\r\n यहाँ\r\n दिन\r\n कोशिश\r\n अलग\r\n की\r\n दुनिया\r\n जोड़ना\r\n यह\r\n अगर\r\n इतना\r\n सोचा\r\n एक\r\n सकता\r\n देना\r\n चलाना\r\n बात\r\n कहानी\r\n करता\r\n कभी\r\n तीन\r\n जब\r\n था\r\n आया\r\n जीना\r\n कोशिश\r\n आसपास\r\n इसके\r\n छोटा\r\n मीणा\r\n अधिक\r\n खेल\r\n बारे\r\n काम\r\n का\r\n है\r\n बिन्दु\r\n द्वारा\r\n जीना\r\n अभी\r\n दिखाना\r\n जानना\r\n चल\r\n सिर\r\n देखा\r\n खाना\r\n रास्ता\r\n पिता\r\n खोज\r\n ऐसा\r\n बंद\r\n बायाँ\r\n लेना\r\n विद्यालय\r\n का\r\n भूमि\r\n हालत\r\n माँ\r\n कैसे\r\n होना\r\n सूची\r\n चल\r\n सोचा\r\n यहाँ\r\n पास\r\n बिना\r\n किताब\r\n पहाड़\r\n संख्या\r\n दोनों\r\n नाम\r\n नहीं\r\n साल\r\n मेरे\r\n पहले\r\n अन्य\r\n जल्दी\r\n वही\r\n अन्य\r\n तेल\r\n खेल\r\n भारत\r\n बहुत\r\n चाल\r\n आया\r\n सोच\r\n मेरे\r\n अच्छा\r\n घर\r\n नाम\r\n अगर\r\n चलो\r\n अच्छा\r\n नीचे\r\n मिला\r\n साल\r\n नहीं\r\n बाहर\r\n पाया\r\n शायद\r\n उसे\r\n सकते\r\n पूछ\r\n चलना\r\n परिवार\r\n सही\r\n नदी\r\n सूची\r\n शहर\r\n केवल\r\n बनाया\r\n पिता\r\n वही\r\n जवाब\r\n जल्दी\r\n पौधा\r\n वह\r\n बीच\r\n खुद\r\n पहले\r\n कहानी\r\n जाना\r\n एक\r\n चाल\r\n जहाँ\r\n डाल\r\n है\r\n वाक्य'),
(10, 'Albanian', ' i\r\n kohë\r\n shumë\r\n kisha\r\n parë\r\n se\r\n kush\r\n janë\r\n që\r\n cfare\r\n kam\r\n jeni\r\n zoti\r\n deri\r\n çka\r\n prej\r\n vërtetë\r\n jo\r\n asnjë\r\n njeri\r\n pas\r\n kurrë\r\n këto\r\n mire\r\n sepse\r\n sigurisht\r\n dy\r\n kishte\r\n një\r\n gjithë\r\n tij\r\n vdekur\r\n pse\r\n shoh\r\n hej\r\n shpejt\r\n juaj\r\n para\r\n ime\r\n po\r\n ndonjë\r\n mua\r\n dreqin\r\n kete\r\n ja\r\n le\r\n lutem\r\n ju\r\n yt\r\n ishte\r\n u\r\n ky\r\n ku\r\n'),
(11, 'Bulgarian', ' майка\r\n момче\r\n шоу\r\n апартамент\r\n причина\r\n аз\r\n събота\r\n тромпет\r\n защо\r\n събота\r\n стадион\r\n нали\r\n походка\r\n малък\r\n трябва\r\n дума\r\n първи\r\n пенсия\r\n номер\r\n скоро\r\n проблем\r\n момиче\r\n кибрит\r\n тромпет\r\n петък\r\n храна\r\n лесен\r\n дете\r\n баща\r\n скоро\r\n секс\r\n врата\r\n но\r\n къде\r\n име\r\n учител\r\n политика\r\n въпрос\r\n картина\r\n име\r\n врата\r\n кола\r\n село\r\n дума\r\n труден\r\n лято\r\n къща\r\n първи\r\n как\r\n или\r\n България\r\n живот\r\n котка\r\n точка\r\n президент\r\n град\r\n хамбургер\r\n шампоан\r\n глава\r\n петък\r\n България\r\n млад\r\n пример\r\n гледам\r\n един\r\n отново\r\n баща\r\n звук\r\n президент\r\n конституция\r\n картина\r\n движение\r\n но\r\n земя\r\n кога\r\n данък\r\n защо\r\n бой\r\n знам\r\n един\r\n политика\r\n секс\r\n момиче\r\n шоу\r\n лято\r\n брат\r\n трябва\r\n кибрит\r\n голям\r\n причина\r\n нали\r\n слагам\r\n аз\r\n парламент\r\n млад\r\n вода\r\n звук\r\n футбол\r\n мога\r\n отново\r\n пари\r\n шампоан\r\n мисля\r\n млад\r\n дърво\r\n храна\r\n как\r\n нужда\r\n котка\r\n млад\r\n семейство\r\n отговор\r\n къща\r\n цигара\r\n конституция\r\n километър\r\n малък\r\n истина\r\n заедно\r\n футбол\r\n гледам\r\n хора\r\n компютър\r\n проблем\r\n кестен\r\n хора\r\n напускам\r\n любов\r\n брат\r\n есен\r\n труден\r\n парламент\r\n игра\r\n дърво\r\n история\r\n куче\r\n какво\r\n вода\r\n походка\r\n кола\r\n ако\r\n момче\r\n учител\r\n слагам\r\n въпрос\r\n село\r\n истина\r\n защита\r\n движение\r\nплан\r\n'),
(12, 'Danish', ' ned\r\n unge\r\n havde\r\n bliver\r\n denne\r\n ja\r\n tilbage\r\n aldrig\r\n danske\r\n lige\r\n havde\r\n børn\r\n se\r\n sådan\r\n tre\r\n det\r\n er\r\n sig\r\n tid\r\n få\r\n dog\r\n gennem\r\n os\r\n nogle\r\n ingen\r\n tage\r\n give\r\n så\r\n dette\r\n år\r\n altid\r\n som\r\n måde\r\n bliver\r\n siger\r\n tage\r\n to\r\n giver\r\n sidste\r\n tidligere\r\n før\r\n men\r\n går\r\n op\r\n langt\r\n verden\r\n fik\r\n hvordan\r\n på\r\n ned\r\n mange\r\n sit\r\n fordi\r\n dag\r\n lille\r\n synes\r\n arbejde\r\n sige\r\n været\r\n må\r\n mange\r\n været\r\n meget\r\n får\r\n hvordan\r\n før\r\n var\r\n jeg\r\n mest\r\n nogen\r\n kommer\r\n hvor\r\n de\r\n alle\r\n da\r\n give\r\n efter\r\n blandt\r\n nye\r\n hos\r\n gør\r\n hende\r\n jo\r\n god\r\n andre\r\n stor\r\n hun\r\n blev\r\n hos\r\n får\r\n godt\r\n allerede\r\n ser\r\n han\r\n mellem\r\n op\r\n sig\r\n dag\r\n også\r\n kom\r\n allerede\r\n selv\r\n side\r\n ind\r\n det\r\n mens\r\n både\r\n ville\r\n kunne\r\n komme\r\n gang\r\n skal\r\n og\r\n at\r\n dette\r\n vi\r\n først\r\n om\r\n gøre\r\n sine\r\n ligger\r\n folk\r\n stadig\r\n disse\r\n at\r\n har\r\n nogle\r\n den\r\n gik\r\n flere\r\n se\r\n skulle\r\n hvis\r\n flere\r\n siden\r\n mens\r\n tre\r\n kan\r\n netop\r\n ja\r\n mennesker\r\n sine\r\n for\r\n tidligere\r\n end\r\n dem\r\n en\r\n hele\r\n meget\r\n mener\r\n hver\r\n Danmark\r\n både\r\n noget\r\n en\r\n fået\r\n hans\r\n kun\r\n hvis\r\n mellem\r\n hun\r\n hvor\r\n til\r\n går\r\n ca\r\n omkring\r\n mindre\r\n gør\r\n vores\r\n langt\r\n hvad\r\n mand\r\n selv\r\n Danmark\r\n mod\r\n stadig\r\n er\r\n noget\r\n inden\r\n og\r\n under\r\n have\r\n tilbage\r\n hendes\r\n samme\r\n næsten\r\n kom\r\n dig\r\n han\r\n siden\r\n eller\r\n sammen\r\n nye\r\n sit\r\n blevet\r\n med\r\n om\r\n dansk\r\n skal\r\n tror\r\n samme\r\n med\r\n unge\r\n sagde\r\n have\r\n lidt\r\n min\r\n endnu\r\n ca\r\n ud\r\n lidt\r\n skulle\r\n danske\r\n sin\r\n år\r\n blandt\r\n nogen\r\n af\r\n folk\r\n af\r\n altså\r\n gennem\r\n nu\r\n fire\r\n sammen\r\n komme\r\n jo\r\n den\r\n anden\r\n få\r\n ham\r\n store\r\n mere\r\n arbejde\r\n ny\r\n vi\r\n når\r\n min\r\n ud\r\n andet\r\n gøre\r\n under\r\n denne\r\n over\r\n står\r\n blevet\r\n fået\r\n hendes\r\n netop\r\n tale\r\n København\r\n altid\r\n måske\r\n lille\r\n måtte\r\n jeg\r\n måde\r\n dansk\r\n ikke\r\n gå\r\n blive\r\n derfor\r\n som\r\n her\r\n par\r\n første\r\n København\r\n igen\r\n ny\r\n bare\r\n først\r\n dem\r\n uden\r\n kun\r\n god\r\n synes\r\n stor\r\n gå\r\n mener\r\n måtte\r\n tid\r\n blev\r\n frem\r\n os\r\n gang\r\n tror\r\n verden\r\n her\r\n blive\r\n dog\r\n mand\r\n eller\r\n hende\r\n deres\r\n fra\r\n mindre\r\n aldrig\r\n måske\r\n alt\r\n man\r\n ind\r\n fordi\r\n sidste\r\n godt\r\n nok\r\n være\r\n frem\r\n lige\r\n må\r\n ved\r\n andet\r\n par\r\n bare\r\n være\r\n vil\r\n dig\r\n mig\r\n nok\r\n i\r\n ved\r\n igen\r\n mig\r\n var\r\n over\r\n uden\r\n også\r\n de\r\n alt\r\n mest\r\n sige\r\n gamle\r\n hver\r\n da\r\n side\r\n fik\r\n deres\r\n to\r\n der\r\n fra\r\n ville\r\n du\r\n et'),
(13, 'Italian', ' qui\r\n parere\r\n piccolo\r\n primo\r\n vostro\r\n lei\r\n e\r\n per\r\n quanto\r\n fra\r\n aprire\r\n tenere\r\n un\r\n lontano\r\n chiedere\r\n politico\r\n dove\r\n contro\r\n prima\r\n quanto\r\n salvare\r\n correre\r\n parte\r\n povero\r\n normale\r\n meglio\r\n capire\r\n un\r\n lui\r\n bello\r\n rimanere\r\n continuo\r\n loro\r\n vi\r\n italiano\r\n vita\r\n ci\r\n perfetto\r\n capire\r\n riuscire\r\n noi\r\n arrivare\r\n il\r\n diverso\r\n casa\r\n sereno\r\n continuo\r\n mi\r\n mezzo\r\n guardare\r\n ricordare\r\n dopo\r\n sotto\r\n bene\r\n nessuno\r\n conoscere\r\n bene\r\n costruire\r\n sì\r\n contro\r\n uomo\r\n rendere\r\n alcuno\r\n fra\r\n tornare\r\n si\r\n dire\r\n scrivere\r\n parere\r\n stare\r\n loro\r\n che\r\n meglio\r\n questo\r\n lungo\r\n cominciare\r\n di\r\n sentire\r\n venire\r\n seguire\r\n stesso\r\n quasi\r\n latino\r\n giovane\r\n vivere\r\n ne\r\n parte\r\n nero\r\n molto\r\n voi\r\n portare\r\n noi\r\n camminare\r\n stupido\r\n essere\r\n nuovo\r\n anche\r\n lontano\r\n tra\r\n ora\r\n di\r\n più\r\n lo\r\n andare\r\n politico\r\n alcuno\r\n giorno\r\n rispondere\r\n giorno\r\n in\r\n camminare\r\n impossibile\r\n caratteristico\r\n tanto\r\n altro\r\n morire\r\n alto\r\n nostro\r\n mentre\r\n buono\r\n vestire\r\n diventare\r\n potere\r\n vicino\r\n volere\r\n aspettare\r\n tuo\r\n bisognare\r\n invece\r\n mano\r\n sotto\r\n li\r\n esso\r\n proprio\r\n nessuno\r\n reale\r\n bianco\r\n bastare\r\n russo\r\n li\r\n vero\r\n da\r\n ora\r\n tra\r\n portare\r\n lungo\r\n sentire\r\n mano\r\n nero\r\n rispondere\r\n sembrare\r\n anche\r\n credere\r\n perfetto\r\n vero\r\n volta\r\n buono\r\n stare\r\n lei\r\n mettere\r\n pure\r\n costruire\r\n chi\r\n tu\r\n vedere\r\n riuscire\r\n sì\r\n italiano\r\n uno\r\n aprire\r\n mio\r\n scrivere\r\n passare\r\n si\r\n o\r\n casa\r\n anno\r\n uomo\r\n senza\r\n oggi\r\n che\r\n volere\r\n donna\r\n no\r\n troppo\r\n ma\r\n anno\r\n cosa\r\n parlare\r\n attuale\r\n sereno\r\n volta\r\n tuo\r\n bianco\r\n sapere\r\n vecchio\r\n sapere\r\n cominciare\r\n chiudere\r\n aspettare\r\n forse\r\n vedere\r\n dovere\r\n grande\r\n egli\r\n tu\r\n mio\r\n tutto\r\n forse\r\n rendere\r\n ricordare\r\n dopo\r\n bello\r\n quale\r\n finire\r\n essere\r\n dire\r\n salvare\r\n nuovo\r\n cui\r\n tanto\r\n restare\r\n se\r\n mentre\r\n allora\r\n vita\r\n trovare\r\n secondo\r\n no\r\n senza\r\n proprio\r\n correre\r\n lui\r\n tale\r\n caro\r\n tutto\r\n qualche\r\n suo\r\n mi\r\n allora\r\n puro\r\n qui\r\n molto\r\n dove\r\n invece\r\n stesso\r\n conoscere\r\n povero\r\n stupido\r\n per\r\n rimanere\r\n latino\r\n come\r\n con\r\n lasciare\r\n da\r\n fino\r\n su\r\n caratteristico\r\n fino\r\n diventare\r\n prendere\r\n io\r\n in\r\n finire\r\n restare\r\n tale\r\n mezzo\r\n questo\r\n bisognare\r\n nostro\r\n bastare\r\n perdere\r\n pure\r\n già\r\n arrivare\r\n sembrare\r\n impossibile\r\n ma\r\n estremo');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

CREATE TABLE `kullanici` (
  `kullanici_id` int(11) NOT NULL,
  `kullanici_adi` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `kullanici_soyadi` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `kullanici_mail` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `kullanici_sifre` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `kullanici_bandurumu` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`kullanici_id`, `kullanici_adi`, `kullanici_soyadi`, `kullanici_mail`, `kullanici_sifre`, `kullanici_bandurumu`) VALUES
(14, 'Yılmaz', 'Kadan', 'kadan8080@gmail.com', '1', 0),
(15, 'Hüseyin', 'Doğan', 'hüseyin@gmail.com', '1234', 0),
(16, 'Mehmet', 'Zafer', 'zafer@gmail.com', '12', 0);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `dks_liste`
--
ALTER TABLE `dks_liste`
  ADD PRIMARY KEY (`dks_id`);

--
-- Tablo için indeksler `kelime`
--
ALTER TABLE `kelime`
  ADD PRIMARY KEY (`kelime_id`);

--
-- Tablo için indeksler `kullanici`
--
ALTER TABLE `kullanici`
  ADD PRIMARY KEY (`kullanici_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `dks_liste`
--
ALTER TABLE `dks_liste`
  MODIFY `dks_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `kelime`
--
ALTER TABLE `kelime`
  MODIFY `kelime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `kullanici`
--
ALTER TABLE `kullanici`
  MODIFY `kullanici_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
