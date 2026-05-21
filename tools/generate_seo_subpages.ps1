$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$Site = "https://musiknyadimas.com"
$Date = "2026-05-21"
$CssVersion = "17"

$Images = @{
  arrange = "../../IMAGE/BG jasa aransemen musik & orkestrasi.png"
  orchestra = "../../IMAGE/GD jasa aransemen musik & orkestrasi.png"
  score = "../../IMAGE/BG penulisan partitur & notasi musik.png"
  mix = "../../IMAGE/BG jasa mixing mastering.png"
  record = "../../IMAGE/BG jasa rekording.png"
  studio = "../../IMAGE/card studio rekaman.jpg"
  cta = "../../IMAGE/background-cta.jpg"
}

$Parents = @{
  "aransemen-orkestrasi" = @{
    title = "Aransemen Musik & Orkestrasi"
    headline = "Pilihan turunan jasa aransemen dan orkestrasi"
    copy = "Setiap kebutuhan aransemen punya tujuan yang berbeda. Karena itu halaman ini dipecah menjadi beberapa layanan turunan agar pencarian seperti aransemen lagu pop, orkestrasi musik, string section, jingle, mars, dan film scoring punya konteks yang lebih jelas."
  }
  "penulisan-partitur-notasi" = @{
    title = "Penulisan Partitur & Notasi"
    headline = "Pilihan turunan jasa partitur dan notasi"
    copy = "Kebutuhan partitur bisa datang dari rekaman audio, file MIDI, lagu pop, choir, orkestra, atau kebutuhan latihan. Halaman turunan ini membantu pengunjung menemukan format penulisan notasi yang paling sesuai."
  }
  "mixing-mastering" = @{
    title = "Mixing & Mastering"
    headline = "Pilihan turunan jasa mixing dan mastering"
    copy = "Proses audio bisa difokuskan pada vokal, mastering rilis digital, cover song, jingle, atau editing vokal. Setiap halaman turunan memberi penjelasan yang lebih spesifik agar pencarian Google lebih terarah."
  }
  "recording-studio-on-location" = @{
    title = "Recording Studio & On Location"
    headline = "Pilihan turunan jasa recording"
    copy = "Rekaman studio dan rekaman panggilan punya kebutuhan teknis yang berbeda. Percabangan ini memudahkan pengunjung memilih recording vokal, instrumen, choir, podcast, live session, atau on location."
  }
}

$Pages = @(
  @{ parent="aransemen-orkestrasi"; slug="jasa-aransemen-lagu"; title="Jasa Aransemen Lagu Profesional"; keyword="jasa aransemen lagu"; image="arrange"; hero=@("Jasa Aransemen","Lagu Profesional","untuk Karya","yang Lebih","Matang"); desc="Jasa aransemen lagu profesional untuk mengembangkan melodi, chord, struktur, intro, interlude, dan musik pengiring agar lagu siap produksi."; focus="mengubah voice note, melodi sederhana, chord dasar, atau demo kasar menjadi lagu utuh dengan struktur yang lebih jelas"; cards=@("Pengembangan chord dan harmoni","Pembuatan intro, interlude, dan ending","Pemilihan instrumen sesuai genre","File siap lanjut recording dan mixing") }
  @{ parent="aransemen-orkestrasi"; slug="jasa-orkestrasi-musik"; title="Jasa Orkestrasi Musik Profesional"; keyword="jasa orkestrasi musik"; image="orchestra"; hero=@("Jasa Orkestrasi","Musik Profesional","untuk Nuansa","Megah dan","Emosional"); desc="Jasa orkestrasi musik untuk string, brass, woodwind, percussion, full orchestra, scoring, mars, hymn, dan kebutuhan musik megah."; focus="membagi ide musikal ke instrumen orkestra seperti string, brass, woodwind, dan percussion agar terdengar megah namun tetap seimbang"; cards=@("Full orchestra arrangement","String, brass, dan woodwind section","Cinematic dan scoring","Siap dibuatkan full score") }
  @{ parent="aransemen-orkestrasi"; slug="aransemen-string-section"; title="Jasa Aransemen String Section"; keyword="aransemen string section"; image="orchestra"; hero=@("Aransemen","String Section","untuk Lagu","yang Lebih","Hangat"); desc="Jasa aransemen string section untuk violin, viola, cello, string quartet, pop ballad, worship, cinematic, dan orchestra layer."; focus="menambahkan lapisan violin, viola, dan cello untuk memperkuat emosi lagu tanpa membuat aransemen terdengar penuh berlebihan"; cards=@("String quartet atau ensemble","Counter melody emosional","Layer string untuk chorus","Partitur string sesuai kebutuhan") }
  @{ parent="aransemen-orkestrasi"; slug="aransemen-lagu-pop"; title="Jasa Aransemen Lagu Pop"; keyword="jasa aransemen lagu pop"; image="arrange"; hero=@("Jasa Aransemen","Lagu Pop","untuk Single","yang Siap","Rilis"); desc="Jasa aransemen lagu pop untuk single, demo, cover, lagu original, pop ballad, pop modern, dan produksi musik siap rilis."; focus="membuat lagu pop lebih radio-friendly melalui pemilihan groove, bass, piano, gitar, beat, dan dinamika chorus yang kuat"; cards=@("Pop ballad dan pop modern","Beat, bass, piano, dan gitar","Struktur lagu lebih radio-friendly","Cocok untuk single original") }
  @{ parent="aransemen-orkestrasi"; slug="aransemen-lagu-rohani"; title="Jasa Aransemen Lagu Rohani"; keyword="jasa aransemen lagu rohani"; image="arrange"; hero=@("Jasa Aransemen","Lagu Rohani","untuk Ibadah","dan Produksi","Musik"); desc="Jasa aransemen lagu rohani, worship, choir, hymn, mars gereja, pelayanan ibadah, dan produksi musik rohani profesional."; focus="membangun aransemen worship, choir, piano string, atau full band yang mendukung makna lirik dan suasana ibadah"; cards=@("Worship band dan choir","Piano string lembut","Dinamika ibadah lebih terarah","Bisa lanjut partitur paduan suara") }
  @{ parent="aransemen-orkestrasi"; slug="aransemen-jingle-iklan"; title="Jasa Aransemen Jingle Iklan"; keyword="jasa aransemen jingle iklan"; image="arrange"; hero=@("Jasa Aransemen","Jingle Iklan","untuk Brand","yang Mudah","Diingat"); desc="Jasa aransemen jingle iklan untuk brand, sekolah, perusahaan, campaign, radio, video promosi, dan kebutuhan audio komersial."; focus="membuat hook musik pendek yang mudah diingat, jelas membawa pesan brand, dan siap dipakai di video promosi maupun media sosial"; cards=@("Jingle brand dan sekolah","Hook mudah diingat","Durasi pendek atau full version","Siap untuk iklan dan konten") }
  @{ parent="aransemen-orkestrasi"; slug="aransemen-mars-hymne"; title="Jasa Aransemen Mars dan Hymne"; keyword="jasa aransemen mars hymne"; image="orchestra"; hero=@("Jasa Aransemen","Mars dan Hymne","untuk Acara","Resmi dan","Institusi"); desc="Jasa aransemen mars dan hymne untuk sekolah, instansi, komunitas, organisasi, paduan suara, dan acara resmi."; focus="menyusun mars dan hymne yang tegas, mudah dinyanyikan bersama, serta cocok untuk identitas sekolah, instansi, atau organisasi"; cards=@("Mars sekolah dan instansi","Hymne organisasi","Format choir atau orkestra","Siap untuk latihan dan rekaman") }
  @{ parent="aransemen-orkestrasi"; slug="film-scoring-cinematic"; title="Jasa Film Scoring dan Musik Cinematic"; keyword="jasa film scoring cinematic"; image="orchestra"; hero=@("Jasa Film","Scoring Cinematic","untuk Visual","yang Lebih","Bercerita"); desc="Jasa film scoring dan musik cinematic untuk video, film pendek, dokumenter, company profile, opening ceremony, dan konten visual."; focus="membuat musik latar yang mengikuti emosi gambar, adegan, tempo visual, dan kebutuhan storytelling film atau video"; cards=@("Scoring film pendek","Company profile dan dokumenter","Opening ceremony","Cinematic orchestration") }

  @{ parent="penulisan-partitur-notasi"; slug="jasa-penulisan-not-balok"; title="Jasa Penulisan Not Balok"; keyword="jasa penulisan not balok"; image="score"; hero=@("Jasa Penulisan","Not Balok","untuk Partitur","yang Rapi","dan Jelas"); desc="Jasa penulisan not balok profesional untuk lagu, latihan, konser, rekaman, sekolah musik, guru, dan dokumentasi karya."; focus="menulis nada, ritme, tanda istirahat, dinamika, artikulasi, dan tempo agar musik lebih mudah dibaca pemain"; cards=@("Layout partitur rapi","Notasi mudah dibaca","Format PDF siap cetak","Cocok untuk latihan dan konser") }
  @{ parent="penulisan-partitur-notasi"; slug="transkripsi-audio-ke-notasi"; title="Jasa Transkripsi Audio ke Notasi"; keyword="jasa transkripsi audio ke notasi"; image="score"; hero=@("Transkripsi Audio","ke Notasi Musik","dari Rekaman","menjadi","Partitur"); desc="Jasa transkripsi audio ke notasi dari MP3, voice note, video, demo lagu, rekaman live, MIDI, dan referensi musik."; focus="mengubah MP3, voice note, video, atau demo menjadi notasi musik yang bisa dibaca, dipelajari, dan dimainkan ulang"; cards=@("Dari MP3 atau video","Melodi, chord, dan ritme","Bisa untuk vokal dan instrumen","Siap lanjut aransemen") }
  @{ parent="penulisan-partitur-notasi"; slug="jasa-partitur-orkestra"; title="Jasa Partitur Orkestra"; keyword="jasa partitur orkestra"; image="score"; hero=@("Jasa Partitur","Orkestra","Full Score","dan Part","Instrumen"); desc="Jasa pembuatan partitur orkestra, full score, individual part, string, brass, woodwind, percussion, dan format ensemble."; focus="membuat full score dan individual part yang rapi untuk conductor, pemain string, woodwind, brass, dan percussion"; cards=@("Full score orkestra","Individual part pemain","Transposisi instrumen","Format siap cetak") }
  @{ parent="penulisan-partitur-notasi"; slug="jasa-partitur-paduan-suara"; title="Jasa Partitur Paduan Suara"; keyword="jasa partitur paduan suara"; image="score"; hero=@("Jasa Partitur","Paduan Suara","untuk Choir","yang Rapi","dan Harmonis"); desc="Jasa partitur paduan suara SATB, choir, vocal group, lagu rohani, mars, hymne, sekolah, gereja, dan komunitas."; focus="menulis partitur SATB, SSA, TTB, unison, atau vocal group dengan lirik dan harmoni yang nyaman untuk latihan"; cards=@("SATB dan vocal group","Lirik tertata rapi","Cocok untuk gereja dan sekolah","Siap latihan choir") }
  @{ parent="penulisan-partitur-notasi"; slug="midi-ke-partitur"; title="Jasa MIDI ke Partitur"; keyword="jasa MIDI ke partitur"; image="score"; hero=@("Jasa MIDI","ke Partitur","Rapi Siap","Cetak dan","Latihan"); desc="Jasa merapikan MIDI ke partitur PDF, not balok, full score, individual part, dan notasi musik siap baca."; focus="merapikan hasil MIDI yang biasanya terlalu padat menjadi notasi yang lebih natural, terbaca, dan siap dipakai latihan"; cards=@("Merapikan quantize notasi","PDF siap cetak","Bisa full score","Cocok dari hasil DAW") }
  @{ parent="penulisan-partitur-notasi"; slug="partitur-lagu-pop"; title="Jasa Partitur Lagu Pop"; keyword="jasa partitur lagu pop"; image="score"; hero=@("Jasa Partitur","Lagu Pop","untuk Vokal","Piano dan","Band"); desc="Jasa partitur lagu pop untuk vokal, piano, gitar, chord, melodi, band, latihan, cover, dan dokumentasi lagu original."; focus="membuat lead sheet, piano vocal score, chord, lirik, atau part band sederhana untuk kebutuhan lagu pop"; cards=@("Lead sheet melodi chord","Piano vocal score","Part band sederhana","Dokumentasi lagu original") }

  @{ parent="mixing-mastering"; slug="jasa-mixing-vokal"; title="Jasa Mixing Vokal"; keyword="jasa mixing vokal"; image="mix"; hero=@("Jasa Mixing","Vokal","untuk Suara","yang Jernih","dan Hadir"); desc="Jasa mixing vokal untuk lagu, cover, voice over, backing vocal, tuning, EQ, compression, reverb, delay, dan vocal clarity."; focus="membuat vokal utama terdengar jelas, stabil, tidak tenggelam, dan menyatu dengan musik secara natural"; cards=@("Vokal lebih jelas","Tuning natural","Reverb dan delay sesuai genre","Siap lanjut mastering") }
  @{ parent="mixing-mastering"; slug="jasa-mastering-lagu"; title="Jasa Mastering Lagu"; keyword="jasa mastering lagu"; image="mix"; hero=@("Jasa Mastering","Lagu","untuk Rilis","Digital yang","Stabil"); desc="Jasa mastering lagu profesional untuk single, album, cover, Spotify, YouTube, Apple Music, TikTok, dan rilis digital."; focus="menyiapkan hasil akhir agar loudness, tonal balance, stereo image, dan format file lebih siap untuk rilis digital"; cards=@("Loudness lebih stabil","Tonal balance rapi","Siap distribusi digital","Format WAV dan MP3") }
  @{ parent="mixing-mastering"; slug="mixing-mastering-cover"; title="Jasa Mixing Mastering Cover Lagu"; keyword="jasa mixing mastering cover lagu"; image="mix"; hero=@("Mixing Mastering","Cover Lagu","untuk Konten","yang Lebih","Profesional"); desc="Jasa mixing mastering cover lagu untuk YouTube, TikTok, Instagram, Spotify, band cover, acoustic cover, dan vocal cover."; focus="merapikan vokal, gitar akustik, piano, backing track, atau band cover agar konten terdengar lebih profesional"; cards=@("Cover akustik dan band","Vokal lebih menonjol","Noise reduction ringan","Siap upload konten") }
  @{ parent="mixing-mastering"; slug="mixing-mastering-spotify"; title="Jasa Mixing Mastering untuk Spotify"; keyword="mixing mastering Spotify"; image="mix"; hero=@("Mixing Mastering","untuk Spotify","dan Platform","Streaming","Digital"); desc="Jasa mixing mastering untuk Spotify, Apple Music, YouTube Music, TikTok, dan platform streaming digital."; focus="menyiapkan lagu agar tetap nyaman setelah normalisasi loudness di Spotify, YouTube Music, Apple Music, dan platform lain"; cards=@("Siap distributor musik","Loudness terkontrol","Aman untuk playlist digital","File final rapi") }
  @{ parent="mixing-mastering"; slug="editing-tuning-vokal"; title="Jasa Editing dan Tuning Vokal"; keyword="jasa tuning vokal"; image="mix"; hero=@("Editing dan","Tuning Vokal","untuk Take","yang Lebih","Rapi"); desc="Jasa editing dan tuning vokal untuk pitch correction, timing, napas, noise, comping take, dan persiapan mixing vokal."; focus="merapikan pitch, timing, napas, noise kecil, dan comping take agar performa vokal lebih siap masuk mixing"; cards=@("Pitch correction natural","Timing vokal lebih rapi","Comping take terbaik","Siap masuk mixing") }
  @{ parent="mixing-mastering"; slug="mixing-jingle-iklan"; title="Jasa Mixing Jingle dan Iklan"; keyword="jasa mixing jingle iklan"; image="mix"; hero=@("Jasa Mixing","Jingle Iklan","untuk Audio","Brand yang","Jelas"); desc="Jasa mixing jingle, iklan, voice over, audio brand, radio spot, company profile, dan video promosi."; focus="menyeimbangkan musik, voice over, sound effect, dan brand message agar tetap jelas di video promosi atau media sosial"; cards=@("Voice over lebih jelas","Musik tidak menutup pesan","Siap video promosi","Cocok untuk brand dan sekolah") }

  @{ parent="recording-studio-on-location"; slug="recording-vokal-studio"; title="Jasa Recording Vokal Studio"; keyword="jasa recording vokal studio"; image="studio"; hero=@("Jasa Recording","Vokal Studio","untuk Take","yang Bersih","dan Fokus"); desc="Jasa recording vokal studio untuk lagu original, cover, jingle, mars, rohani, voice over, dan produksi musik profesional."; focus="merekam vokal di ruang yang lebih terkontrol agar suara bersih, fokus, dan mudah diproses ke mixing"; cards=@("Rekaman vokal original","Cover song dan jingle","Arahan take vokal","Siap mixing mastering") }
  @{ parent="recording-studio-on-location"; slug="recording-instrumen"; title="Jasa Recording Instrumen"; keyword="jasa recording instrumen"; image="record"; hero=@("Jasa Recording","Instrumen","untuk Track","yang Bersih","dan Detail"); desc="Jasa recording instrumen untuk gitar, bass, piano, strings, brass, percussion, band, dan kebutuhan produksi musik."; focus="merekam gitar, bass, piano, string, brass, percussion, atau instrumen lain dengan karakter suara yang lebih detail"; cards=@("Gitar, bass, piano","String dan brass","Track bersih siap mixing","Cocok untuk aransemen lagu") }
  @{ parent="recording-studio-on-location"; slug="recording-choir"; title="Jasa Recording Choir dan Paduan Suara"; keyword="jasa recording choir"; image="record"; hero=@("Jasa Recording","Choir dan","Paduan Suara","untuk Harmoni","yang Rapi"); desc="Jasa recording choir, paduan suara, vocal group, backing vocal, gereja, sekolah, komunitas, mars, dan hymne."; focus="merekam paduan suara dengan penempatan penyanyi dan microphone yang menjaga balance harmoni antar suara"; cards=@("SATB dan vocal group","Recording di studio atau lokasi","Balance harmoni","Siap mixing choir") }
  @{ parent="recording-studio-on-location"; slug="recording-on-location"; title="Jasa Recording On Location"; keyword="jasa recording on location"; image="record"; hero=@("Jasa Recording","On Location","Tim Datang","ke Lokasi","Anda"); desc="Jasa recording on location untuk acara, ibadah, seminar, live session, choir, podcast, dokumentasi, dan produksi video."; focus="merekam acara, ibadah, choir, seminar, live session, atau konten di lokasi dengan peralatan yang disesuaikan"; cards=@("Rekaman di lokasi acara","Peralatan disesuaikan kebutuhan","Cocok untuk live session","Bisa lanjut editing audio") }
  @{ parent="recording-studio-on-location"; slug="recording-podcast-voice-over"; title="Jasa Recording Podcast dan Voice Over"; keyword="jasa recording podcast voice over"; image="studio"; hero=@("Recording Podcast","dan Voice Over","untuk Konten","yang Lebih","Jelas"); desc="Jasa recording podcast dan voice over untuk narasi, iklan, company profile, video pembelajaran, konten digital, dan audio branding."; focus="merekam suara narasi, podcast, iklan, video pembelajaran, dan company profile agar terdengar dekat dan jelas"; cards=@("Podcast single atau multi host","Voice over iklan","Narasi company profile","Editing audio konten") }
  @{ parent="recording-studio-on-location"; slug="live-session-recording"; title="Jasa Live Session Recording"; keyword="jasa live session recording"; image="record"; hero=@("Jasa Live","Session Recording","untuk Performa","yang Natural","dan Hidup"); desc="Jasa live session recording untuk band, acoustic session, worship session, video musik live, konten YouTube, dan dokumentasi performa."; focus="menangkap energi performa band, acoustic session, worship, atau video musik live dengan audio yang tetap rapi"; cards=@("Band dan acoustic session","Worship live","Audio untuk video musik","Siap mixing live") }
)

function Html($Text) {
  return [System.Net.WebUtility]::HtmlEncode([string]$Text)
}

function BranchCard($Page, $Prefix) {
  $img = $Images[$Page.image]
  if ($Prefix -eq "../") { $img = $img.Replace("../../", "../") }
  @"
          <a class="branch-card" href="/$($Page.parent)/$($Page.slug)" style="--branch-image: url('$img')">
            <span class="branch-card-inner">
              <span>
                <h3>$(Html $Page.title)</h3>
                <p>$(Html $Page.desc)</p>
              </span>
              <span class="branch-card-link">Baca halaman ini</span>
            </span>
          </a>
"@
}

function FeatureCard($Title, $Index) {
  $icons = @(
    '<path d="M4 12h16" /><path d="M7 8v8M12 5v14M17 9v6" />',
    '<path d="M5 5h14v14H5z" /><path d="M8 12h8" /><path d="M12 8v8" />',
    '<path d="M6 4h9l3 3v13H6z" /><path d="M15 4v4h3" /><path d="M9 12h6M9 15h6" />',
    '<path d="M4 19h16" /><path d="M6 15l4-4 3 3 5-7" /><path d="M15 7h3v3" />'
  )
  $icon = $icons[$Index % $icons.Count]
  @"
            <article>
              <h3><span class="item-icon" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none">$icon</svg></span><span>$(Html $Title)</span></h3>
              <p>$(Html $Title) dikerjakan dengan pendekatan yang menyesuaikan materi, genre, target penggunaan, dan karakter musik agar hasilnya terasa natural serta siap masuk tahap produksi berikutnya.</p>
            </article>
"@
}

function RelatedFor($Page) {
  @($Pages | Where-Object { $_.parent -eq $Page.parent -and $_.slug -ne $Page.slug } | Select-Object -First 4)
}

function PageHtml($Page) {
  $parent = $Parents[$Page.parent]
  $canonical = "$Site/$($Page.parent)/$($Page.slug)"
  $spanLines = New-Object System.Collections.Generic.List[string]
  foreach ($line in $Page["hero"]) {
    $spanLines.Add("          <span>$(Html $line)")
  }
  $spans = ($spanLines | ForEach-Object { "$_</span>" }) -join "`n"
  $image = $Images[$Page.image]
  $related = RelatedFor $Page
  $relatedLinkLines = New-Object System.Collections.Generic.List[string]
  foreach ($item in ($related | Select-Object -First 3)) {
    $relatedLinkLines.Add("              <li><a href=""/$($item.parent)/$($item.slug)"">$(Html $item.title)</a></li>")
  }
  $relatedLinks = $relatedLinkLines -join "`n"
  $relatedCardLines = New-Object System.Collections.Generic.List[string]
  foreach ($item in $related) {
    $relatedCardLines.Add((BranchCard $item "../../"))
  }
  $relatedCards = $relatedCardLines -join "`n"
  $cardsA = @($Page.cards | Select-Object -First 2)
  $cardsB = @($Page.cards | Select-Object -Skip 2)
  $featureALines = New-Object System.Collections.Generic.List[string]
  for ($i = 0; $i -lt $cardsA.Count; $i++) {
    $featureALines.Add((FeatureCard $cardsA[$i] $i))
  }
  $featureA = $featureALines -join "`n"
  $featureBLines = New-Object System.Collections.Generic.List[string]
  for ($i = 0; $i -lt $cardsB.Count; $i++) {
    $featureBLines.Add((FeatureCard $cardsB[$i] ($i + 2)))
  }
  $featureB = $featureBLines -join "`n"

@"
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>$(Html $Page.title) | Musiknya Dimas</title>
  <meta name="description" content="$(Html $Page.desc)">
  <link rel="canonical" href="$canonical">
  <meta property="og:title" content="$(Html $Page.title) | Musiknya Dimas">
  <meta property="og:description" content="$(Html $Page.desc)">
  <meta property="og:type" content="website">
  <meta property="og:url" content="$canonical">
  <meta property="og:image" content="$Site/favicon.png">
  <meta name="twitter:card" content="summary">
  <link rel="icon" type="image/png" href="/favicon.png">
  <link rel="apple-touch-icon" href="/favicon.png">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../../CSS/aransemen-orkestrasi.css?v=$CssVersion">
</head>
<body class="partitur-page seo-branch-page">
  <header class="hero parallax-section">
    <div class="page-container">
      <nav class="navbar" aria-label="Navigasi utama">
        <button class="mobile-menu-icon" type="button" aria-label="Buka menu" aria-controls="mobileMenu" aria-expanded="false">
          <span></span>
          <span></span>
          <span></span>
        </button>

        <div class="menu">
          <a href="/">Home</a>
          <a href="/#layanan-kami">Layanan Kami</a>
          <a href="/#portfolio">Portofolio</a>
          <a href="/#konsultasi">Konsultasi</a>
        </div>

        <a class="logo" href="/" aria-label="Musiknya Dimas">
          <img src="../../IMAGE/logo dimas and friends.png" alt="Logo Musiknya Dimas">
        </a>
      </nav>

      <div class="audio-preview" aria-label="Preview audio">
        <article class="audio-card">
          <div class="audio-title">Galenna - Ibuku</div>
          <div class="audio-controls">
            <div class="play-btn" aria-label="Putar preview audio">
              <div class="icon play"></div>
            </div>
            <div class="waveform"></div>
            <div class="duration">04:40</div>
          </div>
          <audio src="../../MUSIK/Jasa aransemen lagu - Kang Deden - Ibuku.mp3" preload="metadata"></audio>
        </article>

        <a class="btn-more" href="#apa-itu">
          <span class="btn-text-front">Selengkapnya</span>
          <span class="btn-text-back">Selengkapnya</span>
        </a>
      </div>

      <div class="hero-content">
        <div class="breadcrumb-links">
          <a href="/">Home</a>
          <a href="/$($Page.parent)">$(Html $parent.title)</a>
        </div>
        <h1>
$spans
        </h1>
      </div>
    </div>
  </header>

  <main>
    <section class="summary-section">
      <div class="page-container intro-grid">
        <p><strong>$(Html $Page.title)</strong> adalah halaman turunan dari <a href="/$($Page.parent)">$(Html $parent.title)</a> yang dibuat untuk menjawab kebutuhan pencarian yang lebih spesifik. Fokus utamanya adalah $(Html $Page.keyword) dengan proses yang tetap menyatu dengan ekosistem produksi Musiknya Dimas.</p>
        <p>Jika Anda datang dari halaman utama, alurnya tetap sederhana: pilih kebutuhan, siapkan bahan awal, lalu proses bisa dilanjutkan ke aransemen, partitur, recording, mixing, atau mastering sesuai target karya.</p>
      </div>
    </section>

    <section class="content-section white-section" id="apa-itu">
      <div class="page-container page-visual-split">
        <div class="section-image" role="img" aria-label="$(Html $Page.title)" style="--section-image: url('$image')"></div>
        <div>
          <h2>$(Html $Page.title)</h2>
          <div class="copy-stack">
            <p>Layanan ini berfokus pada $(Html $Page.focus). Pendekatan pengerjaan dibuat fleksibel agar bisa menyesuaikan bahan awal, referensi musik, dan tujuan akhir karya.</p>
            <p>Untuk hasil yang lebih matang, halaman ini juga terhubung dengan layanan lain seperti <a href="/aransemen-orkestrasi">aransemen musik</a>, <a href="/penulisan-partitur-notasi">penulisan partitur</a>, <a href="/recording-studio-on-location">recording</a>, dan <a href="/mixing-mastering">mixing mastering</a>.</p>
            <p>Dengan struktur halaman yang lebih spesifik, pengunjung bisa langsung memahami layanan yang dicari tanpa harus membaca semua topik produksi musik dari awal.</p>
          </div>
        </div>
      </div>
    </section>

    <section class="dark-section parallax-section">
      <div class="page-container">
        <section class="content-section dark-content page-visual-split">
          <div>
            <h2>Hubungan dengan layanan lain</h2>
            <p class="related-copy">Agar struktur SEO tidak berdiri sendiri, halaman $(Html $Page.keyword) ini memberi backlink kontekstual ke layanan yang masih satu rumpun. Pengunjung bisa lanjut membaca topik terkait tanpa kembali ke halaman awal.</p>
            <ul class="inline-link-list">
$relatedLinks
              <li><a href="/$($Page.parent)">$(Html $parent.title)</a></li>
            </ul>
          </div>
          <div class="section-image tall" role="img" aria-label="Produksi musik Musiknya Dimas" style="--section-image: url('$($Images.cta)')"></div>
        </section>
      </div>
    </section>

    <section class="benefit-section">
      <div class="page-container benefit-grid">
        <div class="benefit-copy">
          <h2>Yang bisa dikerjakan di layanan ini</h2>
          <p>Setiap proyek tetap disesuaikan dengan bahan awal, genre, referensi, deadline, dan output akhir yang Anda butuhkan.</p>
        </div>

        <div class="benefit-cards feature-cards">
          <div class="benefit-card-column">
$featureA
          </div>
          <div class="benefit-card-column">
$featureB
          </div>
        </div>
      </div>
    </section>

    <section class="related-cluster">
      <div class="page-container">
        <h2>Layanan terkait yang masih satu kebutuhan</h2>
        <div class="branch-grid">
$relatedCards
        </div>
      </div>
    </section>
  </main>
  <script src="../../JS/mobile-menu.js?v=10"></script>
  <script src="../../JS/subpage-sections.js?v=2"></script>
  <script src="../../JS/script.js?v=11"></script>
</body>
</html>
"@
}

function ParentHub($Slug) {
  $parent = $Parents[$Slug]
  $cards = ($Pages | Where-Object { $_.parent -eq $Slug } | ForEach-Object { BranchCard $_ "../" }) -join "`n"
@"
    <section class="branch-hub-section" id="pilihan-layanan">
      <div class="page-container">
        <div class="branch-hub-head">
          <h2>$(Html $parent.headline)</h2>
          <p>$(Html $parent.copy)</p>
        </div>
        <div class="branch-grid">
$cards
        </div>
      </div>
    </section>
"@
}

foreach ($page in $Pages) {
  $dir = Join-Path $Root "$($page.parent)\$($page.slug)"
  New-Item -ItemType Directory -Force -Path $dir | Out-Null
  $html = PageHtml $page
  [System.IO.File]::WriteAllText((Join-Path $dir "index.html"), $html, [System.Text.UTF8Encoding]::new($false))
}

foreach ($slug in $Parents.Keys) {
  $path = Join-Path $Root "$slug\index.html"
  $html = [System.IO.File]::ReadAllText($path)
  $html = [regex]::Replace($html, "aransemen-orkestrasi\.css\?v=\d+", "aransemen-orkestrasi.css?v=$CssVersion")
  $html = [regex]::Replace($html, "\s*<section class=""branch-hub-section""[\s\S]*?</section>\s*(?=<section class=""branch-hub-section""|\s*</main>)", "`n")
  $html = [regex]::Replace($html, "subpage-sections\.js\?v=\d+", "subpage-sections.js?v=2")
  $html = [regex]::Replace($html, "\s*</main>", "`n$(ParentHub $slug)`n  </main>")
  [System.IO.File]::WriteAllText($path, $html, [System.Text.UTF8Encoding]::new($false))
}

$urls = New-Object System.Collections.Generic.List[object]
$urls.Add(@{ path="/"; priority="1.0" })
foreach ($slug in $Parents.Keys) { $urls.Add(@{ path="/$slug"; priority="0.9" }) }
foreach ($page in $Pages) { $urls.Add(@{ path="/$($page.parent)/$($page.slug)"; priority="0.72" }) }

$urlXml = ($urls | ForEach-Object {
@"
  <url>
    <loc>$Site$($_.path)</loc>
    <lastmod>$Date</lastmod>
    <changefreq>monthly</changefreq>
    <priority>$($_.priority)</priority>
  </url>
"@
}) -join "`n"

$sitemap = @"
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
$urlXml
</urlset>
"@
[System.IO.File]::WriteAllText((Join-Path $Root "sitemap.xml"), $sitemap, [System.Text.UTF8Encoding]::new($false))

Write-Host "Generated $($Pages.Count) SEO branch pages."
