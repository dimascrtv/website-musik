$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

function WriteUtf8($Path, $Content) {
  [System.IO.File]::WriteAllText($Path, $Content, [System.Text.UTF8Encoding]::new($false))
}

function Enc($Text) {
  return [System.Net.WebUtility]::HtmlEncode([string]$Text)
}

function Normalize($Text) {
  return ([System.Net.WebUtility]::HtmlDecode([string]$Text) -replace '\s+', ' ').Trim()
}

function Get-IdCategory($Path) {
  if ($Path -like "aransemen-orkestrasi*") { return "arrangement" }
  if ($Path -like "penulisan-partitur-notasi*") { return "notation" }
  if ($Path -like "mixing-mastering*") { return "mixing" }
  if ($Path -like "recording-studio-on-location*") { return "recording" }
  return "service"
}

function Get-EnCategory($Path) {
  if ($Path -like "en\music-arrangement-orchestration*") { return "arrangement" }
  if ($Path -like "en\sheet-music-notation*") { return "notation" }
  if ($Path -like "en\mixing-mastering*") { return "mixing" }
  if ($Path -like "en\recording-studio-on-location*") { return "recording" }
  return "service"
}

function IdSummaryCopy($Title, $Category) {
  switch ($Category) {
    "arrangement" { return "<strong>$(Enc $Title)</strong> membantu mengembangkan ide musik menjadi aransemen yang lebih utuh, mulai dari karakter instrumen, struktur lagu, dinamika, sampai warna produksi yang sesuai kebutuhan karya." }
    "notation" { return "<strong>$(Enc $Title)</strong> disiapkan untuk membuat materi musik lebih mudah dibaca, dilatih, dan dibagikan dalam bentuk partitur atau notasi yang rapi sesuai kebutuhan pemain." }
    "mixing" { return "<strong>$(Enc $Title)</strong> berfokus pada pengolahan audio agar elemen vokal, instrumen, dinamika, dan karakter suara terdengar lebih seimbang sebelum masuk tahap rilis atau distribusi." }
    "recording" { return "<strong>$(Enc $Title)</strong> membantu menangkap performa vokal, instrumen, choir, voice over, atau live session dengan alur rekaman yang siap dilanjutkan ke editing, mixing, dan mastering." }
    default { return "<strong>$(Enc $Title)</strong> dirancang sebagai layanan produksi musik yang menjawab kebutuhan spesifik proyek tanpa memutus alur pengerjaan dari tahap awal hingga hasil akhir." }
  }
}

function EnSummaryCopy($Title, $Category) {
  switch ($Category) {
    "arrangement" { return "<strong>$(Enc $Title)</strong> helps turn a musical idea into a more complete arrangement, shaping instrumentation, song structure, dynamics, and production color around the project goal." }
    "notation" { return "<strong>$(Enc $Title)</strong> makes musical material easier to read, rehearse, share, and perform through clean notation or score preparation." }
    "mixing" { return "<strong>$(Enc $Title)</strong> focuses on shaping the audio balance so vocals, instruments, dynamics, and tone feel clearer before release or distribution." }
    "recording" { return "<strong>$(Enc $Title)</strong> captures vocal, instrumental, choir, voice over, or live session performances with a workflow that can continue into editing, mixing, and mastering." }
    default { return "<strong>$(Enc $Title)</strong> is built for a specific music production need while keeping the full project path connected from source material to final output." }
  }
}

function IdRelated($Title, $Category) {
  switch ($Category) {
    "arrangement" {
      return @{
        heading = "Arah produksi setelah aransemen"
        copy = "Setelah karakter $(Enc $Title) terbentuk, materi bisa dikembangkan lebih jauh ke orkestrasi, penulisan partitur, recording, mixing, atau mastering agar hasil akhirnya tetap menyatu dari ide awal sampai siap produksi."
      }
    }
    "notation" {
      return @{
        heading = "Dari notasi ke proses produksi"
        copy = "Partitur yang rapi membuat proses latihan, rekaman, aransemen lanjutan, dan dokumentasi karya menjadi lebih terarah. Karena itu halaman ini tetap terhubung dengan layanan yang mendukung kebutuhan musik setelah notasi selesai."
      }
    }
    "mixing" {
      return @{
        heading = "Tahap audio yang saling melengkapi"
        copy = "$(Enc $Title) biasanya menjadi bagian dari alur audio yang lebih panjang: editing, tuning, balancing, mastering, sampai file final siap dipakai untuk streaming, video, konten, atau kebutuhan brand."
      }
    }
    "recording" {
      return @{
        heading = "Dari sesi rekaman ke hasil final"
        copy = "Hasil rekaman yang baik akan lebih kuat ketika dilanjutkan dengan editing, tuning, mixing, mastering, atau penyusunan materi pendukung. Bagian ini membantu memilih tahap produksi berikutnya setelah sesi $(Enc $Title)."
      }
    }
    default {
      return @{
        heading = "Layanan yang mendukung proyek ini"
        copy = "Setiap proyek musik biasanya membutuhkan beberapa tahap yang saling terhubung. Pilihan layanan berikut membantu menjaga alur produksi tetap rapi dari bahan awal sampai hasil akhir."
      }
    }
  }
}

function EnRelated($Title, $Category) {
  switch ($Category) {
    "arrangement" {
      return @{
        heading = "Where the arrangement can go next"
        copy = "Once the direction of $(Enc $Title) is shaped, the material can continue into orchestration, sheet music, recording, mixing, or mastering so the production stays connected from idea to final delivery."
      }
    }
    "notation" {
      return @{
        heading = "From notation to production"
        copy = "A clean score makes rehearsal, recording, further arrangement, and music documentation easier to manage. These related services support the next step after the notation is ready."
      }
    }
    "mixing" {
      return @{
        heading = "Audio stages that work together"
        copy = "$(Enc $Title) often sits inside a longer audio workflow: editing, tuning, balancing, mastering, and final file preparation for streaming, video, content, or brand use."
      }
    }
    "recording" {
      return @{
        heading = "From recording session to final audio"
        copy = "A strong recording becomes more useful when it can continue into editing, tuning, mixing, mastering, or supporting production assets. This section points to the next steps after $(Enc $Title)."
      }
    }
    default {
      return @{
        heading = "Services that support this project"
        copy = "Music projects often need several connected stages. These related services help keep the production path clear from source material to final output."
      }
    }
  }
}

function IdCardCopy($Card, $PageTitle, $Category, $Index) {
  $cardText = Normalize $Card
  $pageText = Normalize $PageTitle
  if ($cardText -match "chord|harmoni") { return "Pengembangan chord dan harmoni dibuat untuk memperjelas arah emosi lagu, menjaga perpindahan bagian tetap enak didengar, dan memberi dasar yang kuat untuk melodi utama." }
  if ($cardText -match "intro|interlude|ending") { return "Intro, interlude, dan ending disusun agar lagu punya pembuka yang menarik, ruang transisi yang natural, serta penutup yang terasa selesai." }
  if ($cardText -match "instrumen|gitar|bass|piano|brass|string") { return "Pemilihan instrumen diarahkan untuk mendukung karakter genre, memberi ruang pada vokal atau melodi utama, dan menjaga aransemen tetap seimbang." }
  if ($cardText -match "recording|rekaman") { return "Materi disiapkan dengan format yang memudahkan proses rekaman, mulai dari guide, struktur bagian, sampai kebutuhan file audio atau referensi." }
  if ($cardText -match "mixing|mastering") { return "File akhir dirapikan agar mudah masuk tahap mixing dan mastering, sehingga balance, dinamika, dan kualitas audio bisa dipoles lebih lanjut." }
  if ($cardText -match "orchestra|orkestra") { return "Bagian orkestra difokuskan pada pembagian peran string, brass, woodwind, dan percussion agar musik terdengar luas tanpa kehilangan detail utama." }
  if ($cardText -match "Company profile|dokumenter") { return "Untuk company profile dan dokumenter, musik dibangun agar alur narasi terasa lebih jelas, profesional, dan tetap memberi ruang pada voice over atau gambar utama." }
  if ($cardText -match "Opening ceremony") { return "Opening ceremony membutuhkan musik yang punya pembukaan kuat, perkembangan dramatis, dan klimaks yang terasa megah untuk mendukung momen acara." }
  if ($cardText -match "cinematic|scoring|film") { return "Musik scoring mengikuti tensi visual, perubahan adegan, dan kebutuhan cerita supaya audio terasa mendukung gambar, bukan sekadar menjadi latar." }
  if ($cardText -match "jingle|hook|brand|iklan") { return "Elemen jingle dibuat singkat, mudah diingat, dan langsung membawa identitas brand agar pesan utama cepat menempel di pendengar." }
  if ($cardText -match "mars|hymne") { return "Mars atau hymne disusun dengan melodi yang tegas, mudah dinyanyikan bersama, dan cocok untuk kebutuhan identitas institusi atau acara resmi." }
  if ($cardText -match "worship|rohani|ibadah|choir|paduan suara|SATB") { return "Bagian vokal dan choir diarahkan agar harmoni tetap nyaman dinyanyikan, mendukung makna lirik, dan cocok untuk kebutuhan ibadah atau latihan bersama." }
  if ($cardText -match "partitur|notasi|not balok|score|lead sheet|PDF") { return "Notasi disusun agar pemain bisa membaca melodi, ritme, chord, dan tanda musikal dengan jelas saat latihan maupun pementasan." }
  if ($cardText -match "MIDI|quantize") { return "Materi MIDI dibersihkan dari notasi yang terlalu padat, lalu dirapikan menjadi partitur yang lebih natural dan mudah dibaca." }
  if ($cardText -match "MP3|audio|video|transkripsi") { return "Audio sumber ditelusuri untuk menangkap melodi, ritme, chord, dan pola penting agar bisa diubah menjadi notasi yang akurat." }
  if ($cardText -match "vokal|tuning|pitch|take") { return "Vokal diproses dengan fokus pada kejernihan, ketepatan nada, timing, dan karakter suara agar tetap terasa natural di dalam musik." }
  if ($cardText -match "loudness|streaming|Spotify|distributor|digital|playlist") { return "Master disiapkan dengan kontrol loudness dan tonal balance agar tetap nyaman saat diputar di platform streaming dan perangkat berbeda." }
  if ($cardText -match "noise|editing") { return "Editing dilakukan untuk membersihkan gangguan kecil, merapikan timing, dan menjaga performa utama tetap terdengar alami." }
  if ($cardText -match "podcast|voice over|narasi") { return "Suara narasi atau podcast direkam dan diarahkan agar artikulasi jelas, dekat dengan pendengar, dan siap dipakai untuk konten." }
  if ($cardText -match "live|session|acoustic|band") { return "Sesi live diarahkan untuk menangkap energi performa sambil tetap menjaga detail instrumen dan vokal mudah diproses setelah rekaman." }
  $defaults = @(
    "$cardText pada $pageText diarahkan untuk menjawab kebutuhan teknis yang spesifik, sehingga hasilnya lebih relevan dengan karakter proyek.",
    "Untuk kebutuhan $cardText, proses dibuat lebih terukur agar materi mudah dilanjutkan ke tahap produksi berikutnya tanpa kehilangan konteks musikal.",
    "$cardText membantu memperjelas arah pengerjaan $pageText, terutama saat proyek membutuhkan hasil yang rapi, praktis, dan siap dipakai.",
    "Bagian $cardText memberi dukungan tambahan pada $pageText agar output akhir terasa lebih lengkap dan sesuai tujuan penggunaan."
  )
  return $defaults[$Index % $defaults.Count]
}

function EnCardCopy($Card, $PageTitle, $Category, $Index) {
  $cardText = Normalize $Card
  $pageText = Normalize $PageTitle
  if ($cardText -match "Chord|harmony") { return "Chord and harmony development clarifies the emotional direction of the song, keeps section changes musical, and gives the melody a stronger foundation." }
  if ($cardText -match "Intro|interlude|ending") { return "Intros, interludes, and endings are shaped so the song has a memorable opening, natural transitions, and a satisfying close." }
  if ($cardText -match "Instrument|Guitar|bass|piano|brass|string|Strings") { return "Instrument choices are matched to the genre, leaving space for the lead vocal or melody while keeping the arrangement balanced." }
  if ($cardText -match "recording|Recording") { return "The material is prepared for recording with clear guides, structure, references, and file needs so the session can move efficiently." }
  if ($cardText -match "mixing|mastering|Mastering") { return "Final files are organized for the mixing or mastering stage, making balance, dynamics, and audio polish easier to handle." }
  if ($cardText -match "orchestra|orchestration|orchestral") { return "Orchestral writing focuses on the roles of strings, brass, woodwinds, and percussion so the music feels wide without losing detail." }
  if ($cardText -match "Company profile|documentary") { return "For company profiles and documentaries, the music is shaped around the narrative flow while leaving enough room for voice over, visuals, and brand messaging." }
  if ($cardText -match "Opening ceremony") { return "Opening ceremony music needs a strong entrance, dramatic build, and clear climax so the event moment feels larger and more intentional." }
  if ($cardText -match "cinematic|scoring|film") { return "Scoring follows visual tension, scene movement, and story needs so the music supports the picture instead of sitting behind it randomly." }
  if ($cardText -match "jingle|hook|Brand|ads|content") { return "Jingle elements are kept short, memorable, and brand-focused so the main message is easy for listeners to remember." }
  if ($cardText -match "march|hymn") { return "Marches and hymns are arranged with strong melodic direction, singable phrasing, and a character suited for institutions or formal events." }
  if ($cardText -match "Worship|choir|Choir|SATB|vocal group|Church") { return "Choir and worship parts are shaped so the harmony remains singable, supports the lyric meaning, and works well for group rehearsal." }
  if ($cardText -match "score|Score|notation|Lead sheet|PDF|parts") { return "Notation is prepared so players can read melody, rhythm, chords, lyrics, and musical markings clearly during rehearsal or performance." }
  if ($cardText -match "MIDI|quantize") { return "MIDI material is cleaned from overly dense notation and turned into a more natural, readable score." }
  if ($cardText -match "MP3|audio|video|transcription") { return "The source audio is traced for melody, rhythm, chords, and important musical patterns before being turned into notation." }
  if ($cardText -match "vocal|Vocal|tuning|pitch|take") { return "Vocal work focuses on clarity, pitch, timing, and tone while keeping the performance natural inside the music." }
  if ($cardText -match "loudness|streaming|Spotify|Distributor|digital|platform") { return "Mastering is prepared with controlled loudness and tonal balance so the song translates well across platforms and playback systems." }
  if ($cardText -match "noise|editing|Editing") { return "Editing removes small distractions, tightens timing, and keeps the core performance feeling natural." }
  if ($cardText -match "podcast|voice over|narration") { return "Podcast and voice over recording is directed for clear articulation, close presence, and content-ready delivery." }
  if ($cardText -match "live|session|acoustic|band") { return "Live session work captures performance energy while keeping the vocal and instrument details ready for post-production." }
  $defaults = @(
    "$cardText in $pageText is shaped around a specific technical need, making the result more relevant to the character of the project.",
    "For $cardText, the workflow is kept practical and focused so the material can move into the next production stage with clearer direction.",
    "$cardText helps define the production direction of $pageText, especially when the project needs a cleaner and more usable result.",
    "The $cardText stage adds support to $pageText so the final output feels more complete and aligned with its intended use."
  )
  return $defaults[$Index % $defaults.Count]
}

function Update-FeatureCards($Html, $PageTitle, $Category, $Lang) {
  $counter = 0
  return [regex]::Replace($Html, '(?s)(<h3>.*?<span>(?<title>[^<]+)</span></h3>\s*)<p>.*?</p>', {
    param($m)
    $title = Normalize $m.Groups["title"].Value
    if ($Lang -eq "id") {
      $copy = IdCardCopy $title $PageTitle $Category $counter
    } else {
      $copy = EnCardCopy $title $PageTitle $Category $counter
    }
    $script:counter++
    return $m.Groups[1].Value + "<p>$copy</p>"
  })
}

function Update-IdPage($RelativePath) {
  $path = Join-Path $Root $RelativePath
  $html = [System.IO.File]::ReadAllText($path)
  $category = Get-IdCategory $RelativePath
  $titleMatch = [regex]::Match($html, '<h2>(?<title>[^<]+)</h2>\s*<div class="copy-stack">')
  if (!$titleMatch.Success) { return }
  $title = Normalize $titleMatch.Groups["title"].Value
  $summary = IdSummaryCopy $title $category
  $html = [regex]::Replace($html, '(?s)<p><strong>.*?</strong> adalah halaman turunan.*?</p>', "<p>$summary</p>", 1)
  $related = IdRelated $title $category
  $html = [regex]::Replace($html, '<h2>Hubungan dengan layanan lain</h2>', "<h2>$($related.heading)</h2>")
  $html = [regex]::Replace($html, '(?s)<p class="related-copy">Agar struktur SEO.*?</p>', "<p class=""related-copy"">$($related.copy)</p>")
  $html = Update-FeatureCards $html $title $category "id"
  WriteUtf8 $path $html
}

function Update-EnPage($RelativePath) {
  $path = Join-Path $Root $RelativePath
  $html = [System.IO.File]::ReadAllText($path)
  $category = Get-EnCategory $RelativePath
  $titleMatch = [regex]::Match($html, '<h2>(?<title>[^<]+)</h2>\s*<div class="copy-stack">')
  if (!$titleMatch.Success) { return }
  $title = Normalize $titleMatch.Groups["title"].Value
  $summary = EnSummaryCopy $title $category
  $html = [regex]::Replace($html, '(?s)<p><strong>.*?</strong> is an English service page.*?</p>', "<p>$summary</p>", 1)
  $related = EnRelated $title $category
  $html = [regex]::Replace($html, '<h2>Related production services</h2>', "<h2>$($related.heading)</h2>")
  $html = [regex]::Replace($html, '(?s)<p class="related-copy">This page connects to related services.*?</p>', "<p class=""related-copy"">$($related.copy)</p>")
  $html = Update-FeatureCards $html $title $category "en"
  WriteUtf8 $path $html
}

$idFiles = Get-ChildItem -Path `
  (Join-Path $Root "aransemen-orkestrasi"), `
  (Join-Path $Root "penulisan-partitur-notasi"), `
  (Join-Path $Root "mixing-mastering"), `
  (Join-Path $Root "recording-studio-on-location") `
  -Recurse -Filter index.html |
  Where-Object { $_.FullName -notmatch '\\(aransemen-orkestrasi|penulisan-partitur-notasi|mixing-mastering|recording-studio-on-location)\\index\.html$' }

foreach ($file in $idFiles) {
  Update-IdPage ($file.FullName.Substring($Root.Length + 1))
}

$enFiles = Get-ChildItem -Path (Join-Path $Root "en") -Recurse -Filter index.html |
  Where-Object { $_.FullName -notmatch '\\en\\(index|music-arrangement-orchestration|sheet-music-notation|mixing-mastering|recording-studio-on-location)\\index\.html$' }

foreach ($file in $enFiles) {
  Update-EnPage ($file.FullName.Substring($Root.Length + 1))
}

Write-Host "Refined $($idFiles.Count) Indonesian pages and $($enFiles.Count) English pages."
