$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

function WriteUtf8($Path, $Content) {
  [System.IO.File]::WriteAllText($Path, $Content, [System.Text.UTF8Encoding]::new($false))
}

function Get-Title($Html) {
  $m = [regex]::Match($Html, '<h2>(?<title>[^<]+)</h2>\s*<div class="copy-stack">')
  if ($m.Success) { return ([System.Net.WebUtility]::HtmlDecode($m.Groups["title"].Value) -replace '\s+', ' ').Trim() }
  return ""
}

function Get-Category($RelativePath) {
  if ($RelativePath -like "*aransemen-orkestrasi*" -or $RelativePath -like "*music-arrangement-orchestration*") { return "arrangement" }
  if ($RelativePath -like "*penulisan-partitur-notasi*" -or $RelativePath -like "*sheet-music-notation*") { return "notation" }
  if ($RelativePath -like "*mixing-mastering*") { return "mixing" }
  if ($RelativePath -like "*recording-studio-on-location*") { return "recording" }
  return "service"
}

function IdText($Title, $Category, $Kind) {
  switch ("$Category/$Kind") {
    "arrangement/flow" { return "Alurnya bisa dimulai dari melodi, chord, referensi, atau voice note. Dari sana, $Title dapat diarahkan menjadi demo utuh, materi recording, partitur, atau produksi audio siap mixing." }
    "notation/flow" { return "Bahan awal bisa berupa audio, MIDI, part lama, atau referensi lagu. Setelah notasi selesai, hasilnya dapat dipakai untuk latihan, rekaman, dokumentasi, atau kebutuhan aransemen lanjutan." }
    "mixing/flow" { return "Materi yang masuk bisa berupa multitrack, vokal, backing track, atau file final kasar. Proses $Title kemudian diarahkan agar audio lebih siap untuk distribusi, konten, atau presentasi klien." }
    "recording/flow" { return "Sesi dapat disiapkan dari lagu original, naskah, guide track, atau kebutuhan event. Setelah rekaman selesai, materi bisa dilanjutkan ke editing, tuning, mixing, mastering, atau dokumentasi audio." }
    "arrangement/support" { return "Jika aransemen membutuhkan bentuk yang lebih lengkap, materi $Title juga bisa disiapkan untuk kebutuhan partitur, recording vokal atau instrumen, sampai mixing mastering." }
    "notation/support" { return "Jika partitur akan dipakai dalam produksi, hasil notasi dapat disambungkan dengan aransemen, recording, atau mixing agar pemain dan tim audio bekerja dari materi yang sama." }
    "mixing/support" { return "Jika proyek masih membutuhkan tahap lain, hasil $Title dapat disesuaikan dengan editing vokal, mastering lagu, recording tambahan, atau kebutuhan audio untuk video dan platform digital." }
    "recording/support" { return "Jika hasil rekaman akan masuk produksi penuh, file dari $Title bisa disiapkan untuk editing, mixing, mastering, atau penyusunan materi musik pendukung." }
    "arrangement/specific" { return "Dalam konteks $Title, pencarian seperti aransemen lagu, orkestrasi, jingle, string section, atau scoring diarahkan ke penjelasan yang benar-benar sesuai kebutuhan musiknya." }
    "notation/specific" { return "Untuk $Title, pembahasan dibuat lebih spesifik agar kebutuhan not balok, transkripsi audio, partitur orkestra, partitur paduan suara, MIDI, atau lead sheet tidak bercampur." }
    "mixing/specific" { return "Pada $Title, pembagian topik membantu membedakan kebutuhan mixing vokal, mastering lagu, cover, jingle, Spotify, atau tuning vokal sebelum memilih layanan." }
    "recording/specific" { return "Dalam $Title, kebutuhan recording vokal, instrumen, choir, podcast, live session, atau on location dijelaskan sesuai format sesi yang paling relevan." }
    "arrangement/benefit" { return "Untuk $Title, bagian berikut menjelaskan elemen aransemen yang paling sering menentukan karakter akhir karya, dari fondasi harmoni sampai kesiapan produksi." }
    "notation/benefit" { return "Pada $Title, bagian berikut merangkum kebutuhan notasi yang membuat materi lebih mudah dibaca, dilatih, dicetak, dan dipakai dalam produksi." }
    "mixing/benefit" { return "Dalam $Title, bagian berikut menunjukkan fokus audio yang biasanya paling berpengaruh pada kejernihan, balance, loudness, dan kesiapan rilis." }
    "recording/benefit" { return "Untuk $Title, bagian berikut menjelaskan kebutuhan rekaman yang membantu performa terdengar bersih, terarah, dan siap masuk proses audio berikutnya." }
  }
  return "Bagian ini dibuat lebih spesifik agar alur produksi tetap sesuai dengan kebutuhan proyek."
}

function EnText($Title, $Category, $Kind) {
  switch ("$Category/$Kind") {
    "arrangement/flow" { return "The process can start from a melody, chord idea, reference track, or voice note. From there, $Title can become a complete demo, recording material, sheet music, or audio production ready for mixing." }
    "notation/flow" { return "Source material may come from audio, MIDI, an older score, or a reference song. Once the notation is ready, it can support rehearsal, recording, documentation, or further arrangement." }
    "mixing/flow" { return "The source can be multitracks, vocals, backing tracks, or a rough final mix. $Title then shapes the audio for release, content, or client presentation." }
    "recording/flow" { return "The session can begin from an original song, script, guide track, or event requirement. After recording, the material can move into editing, tuning, mixing, mastering, or audio documentation." }
    "arrangement/support" { return "If the arrangement needs a more complete production path, $Title can also be prepared for notation, vocal or instrument recording, mixing, and mastering." }
    "notation/support" { return "If the score will be used in production, the notation can connect with arrangement, recording, or mixing so musicians and audio teams work from the same material." }
    "mixing/support" { return "If the project still needs other stages, $Title can connect with vocal editing, song mastering, additional recording, or audio preparation for video and digital platforms." }
    "recording/support" { return "If the recording will move into full production, files from $Title can be prepared for editing, mixing, mastering, or supporting music assets." }
    "arrangement/specific" { return "For $Title, English searches around song arrangement, orchestration, jingles, string section, and scoring land on content that matches the actual music need." }
    "notation/specific" { return "For $Title, the page separates notation needs such as transcription, orchestral score, choir score, MIDI cleanup, and pop song lead sheets." }
    "mixing/specific" { return "For $Title, the topic split helps visitors distinguish vocal mixing, song mastering, cover mixing, jingle work, Spotify preparation, and vocal tuning before choosing a service." }
    "recording/specific" { return "For $Title, the page explains vocal recording, instrument recording, choir sessions, podcast work, live sessions, and on-location recording through the most relevant session format." }
    "arrangement/benefit" { return "For $Title, the points below show the arrangement elements that most often shape the final character of the music, from harmonic foundation to production readiness." }
    "notation/benefit" { return "For $Title, the points below summarize the notation needs that make music easier to read, rehearse, print, and use in production." }
    "mixing/benefit" { return "For $Title, the points below show the audio focus areas that most affect clarity, balance, loudness, and release readiness." }
    "recording/benefit" { return "For $Title, the points below explain the recording needs that help performances sound clean, directed, and ready for the next audio stage." }
  }
  return "This section is written more specifically so the production path stays aligned with the project goal."
}

function Replace-ExistingCategoryCopy($Html, $Title, $IsEnglish) {
  if ($IsEnglish) {
    $generic = @{
      "A focused English page helps searches around song arrangement, orchestration, jingles, string section, and scoring land on content that matches the actual music need." = "For $Title, English searches around song arrangement, orchestration, jingles, string section, and scoring land on content that matches the actual music need."
      "A more specific page separates notation needs such as transcription, orchestral score, choir score, MIDI cleanup, and pop song lead sheets." = "For $Title, the page separates notation needs such as transcription, orchestral score, choir score, MIDI cleanup, and pop song lead sheets."
      "This topic split helps visitors distinguish vocal mixing, song mastering, cover mixing, jingle work, Spotify preparation, and vocal tuning before choosing a service." = "For $Title, the topic split helps visitors distinguish vocal mixing, song mastering, cover mixing, jingle work, Spotify preparation, and vocal tuning before choosing a service."
      "A focused page makes it easier to understand vocal recording, instrument recording, choir sessions, podcast work, live sessions, and on-location recording without mixing all formats together." = "For $Title, the page explains vocal recording, instrument recording, choir sessions, podcast work, live sessions, and on-location recording through the most relevant session format."
      "The points below show the arrangement elements that most often shape the final character of the music, from harmonic foundation to production readiness." = "For $Title, the points below show the arrangement elements that most often shape the final character of the music, from harmonic foundation to production readiness."
      "The points below summarize the notation needs that make music easier to read, rehearse, print, and use in production." = "For $Title, the points below summarize the notation needs that make music easier to read, rehearse, print, and use in production."
      "The points below show the audio focus areas that most affect clarity, balance, loudness, and release readiness." = "For $Title, the points below show the audio focus areas that most affect clarity, balance, loudness, and release readiness."
      "The points below explain the recording needs that help performances sound clean, directed, and ready for the next audio stage." = "For $Title, the points below explain the recording needs that help performances sound clean, directed, and ready for the next audio stage."
      "Source material may come from audio, MIDI, an older score, or a reference song. Once the notation is ready, it can support rehearsal, recording, documentation, or further arrangement." = "For $Title, source material may come from audio, MIDI, an older score, or a reference song before the notation is prepared for rehearsal, recording, documentation, or further arrangement."
      "If the score will be used in production, the notation can connect with arrangement, recording, or mixing so musicians and audio teams work from the same material." = "After $Title is prepared, the notation can connect with arrangement, recording, or mixing so musicians and audio teams work from the same material."
      "The source can be multitracks, vocals, backing tracks, or a rough final mix. $Title then shapes the audio for release, content, or client presentation." = "For $Title, the source can be multitracks, vocals, backing tracks, or a rough final mix before the audio is shaped for release, content, or client presentation."
      "If the project still needs other stages, $Title can connect with vocal editing, song mastering, additional recording, or audio preparation for video and digital platforms." = "After $Title, the project can still connect with vocal editing, song mastering, additional recording, or audio preparation for video and digital platforms."
      "The session can begin from an original song, script, guide track, or event requirement. After recording, the material can move into editing, tuning, mixing, mastering, or audio documentation." = "For $Title, the session can begin from an original song, script, guide track, or event requirement before the material moves into editing, tuning, mixing, mastering, or audio documentation."
      "If the recording will move into full production, files from $Title can be prepared for editing, mixing, mastering, or supporting music assets." = "After $Title, recording files can be prepared for editing, mixing, mastering, or supporting music assets when the project moves into full production."
    }
  } else {
    $generic = @{
      "Dengan halaman yang lebih spesifik, pencarian seperti aransemen lagu, orkestrasi, jingle, string section, atau scoring bisa diarahkan ke penjelasan yang benar-benar sesuai kebutuhan musiknya." = "Dalam konteks $Title, pencarian seperti aransemen lagu, orkestrasi, jingle, string section, atau scoring diarahkan ke penjelasan yang benar-benar sesuai kebutuhan musiknya."
      "Pembahasan yang lebih spesifik membantu membedakan kebutuhan not balok, transkripsi audio, partitur orkestra, partitur paduan suara, MIDI, dan lead sheet lagu pop." = "Untuk $Title, pembahasan dibuat lebih spesifik agar kebutuhan not balok, transkripsi audio, partitur orkestra, partitur paduan suara, MIDI, atau lead sheet tidak bercampur."
      "Pembagian topik ini membantu membedakan kebutuhan mixing vokal, mastering lagu, cover, jingle, Spotify, atau tuning vokal supaya calon klien langsung membaca konteks yang relevan." = "Pada $Title, pembagian topik membantu membedakan kebutuhan mixing vokal, mastering lagu, cover, jingle, Spotify, atau tuning vokal sebelum memilih layanan."
      "Dengan pembahasan yang lebih terarah, kebutuhan recording vokal, instrumen, choir, podcast, live session, atau on location bisa dipahami tanpa mencampur semua format rekaman." = "Dalam $Title, kebutuhan recording vokal, instrumen, choir, podcast, live session, atau on location dijelaskan sesuai format sesi yang paling relevan."
      "Bagian berikut menjelaskan elemen aransemen yang paling sering menentukan karakter akhir karya, dari fondasi harmoni sampai kesiapan produksi." = "Untuk $Title, bagian berikut menjelaskan elemen aransemen yang paling sering menentukan karakter akhir karya, dari fondasi harmoni sampai kesiapan produksi."
      "Bagian berikut merangkum kebutuhan notasi yang membuat materi lebih mudah dibaca, dilatih, dicetak, dan dipakai dalam produksi." = "Pada $Title, bagian berikut merangkum kebutuhan notasi yang membuat materi lebih mudah dibaca, dilatih, dicetak, dan dipakai dalam produksi."
      "Bagian berikut menunjukkan fokus audio yang biasanya paling berpengaruh pada kejernihan, balance, loudness, dan kesiapan rilis." = "Dalam $Title, bagian berikut menunjukkan fokus audio yang biasanya paling berpengaruh pada kejernihan, balance, loudness, dan kesiapan rilis."
      "Bagian berikut menjelaskan kebutuhan rekaman yang membantu performa terdengar bersih, terarah, dan siap masuk proses audio berikutnya." = "Untuk $Title, bagian berikut menjelaskan kebutuhan rekaman yang membantu performa terdengar bersih, terarah, dan siap masuk proses audio berikutnya."
      "Bahan awal bisa berupa audio, MIDI, part lama, atau referensi lagu. Setelah notasi selesai, hasilnya dapat dipakai untuk latihan, rekaman, dokumentasi, atau kebutuhan aransemen lanjutan." = "Untuk $Title, bahan awal bisa berupa audio, MIDI, part lama, atau referensi lagu sebelum notasi dipakai untuk latihan, rekaman, dokumentasi, atau kebutuhan aransemen lanjutan."
      "Jika partitur akan dipakai dalam produksi, hasil notasi dapat disambungkan dengan aransemen, recording, atau mixing agar pemain dan tim audio bekerja dari materi yang sama." = "Setelah $Title selesai, hasil notasi dapat disambungkan dengan aransemen, recording, atau mixing agar pemain dan tim audio bekerja dari materi yang sama."
      "Materi yang masuk bisa berupa multitrack, vokal, backing track, atau file final kasar. Proses $Title kemudian diarahkan agar audio lebih siap untuk distribusi, konten, atau presentasi klien." = "Untuk $Title, materi yang masuk bisa berupa multitrack, vokal, backing track, atau file final kasar sebelum audio diarahkan untuk distribusi, konten, atau presentasi klien."
      "Jika proyek masih membutuhkan tahap lain, hasil $Title dapat disesuaikan dengan editing vokal, mastering lagu, recording tambahan, atau kebutuhan audio untuk video dan platform digital." = "Setelah $Title, proyek masih bisa disambungkan dengan editing vokal, mastering lagu, recording tambahan, atau kebutuhan audio untuk video dan platform digital."
      "Sesi dapat disiapkan dari lagu original, naskah, guide track, atau kebutuhan event. Setelah rekaman selesai, materi bisa dilanjutkan ke editing, tuning, mixing, mastering, atau dokumentasi audio." = "Untuk $Title, sesi dapat disiapkan dari lagu original, naskah, guide track, atau kebutuhan event sebelum materi masuk editing, tuning, mixing, mastering, atau dokumentasi audio."
      "Jika hasil rekaman akan masuk produksi penuh, file dari $Title bisa disiapkan untuk editing, mixing, mastering, atau penyusunan materi musik pendukung." = "Setelah $Title, file rekaman bisa disiapkan untuk editing, mixing, mastering, atau penyusunan materi musik pendukung ketika proyek masuk produksi penuh."
    }
  }
  foreach ($key in $generic.Keys) { $Html = $Html.Replace("<p>$key</p>", "<p>$($generic[$key])</p>") }
  return $Html
}

function Contextualize-IdCards($Html, $Title) {
  $pairs = @{
    '<p>Pemilihan instrumen diarahkan untuk mendukung karakter genre, memberi ruang pada vokal atau melodi utama, dan menjaga aransemen tetap seimbang.</p>' = "<p>Pada $Title, pemilihan instrumen diarahkan untuk mendukung karakter genre, memberi ruang pada vokal atau melodi utama, dan menjaga aransemen tetap seimbang.</p>"
    '<p>Notasi disusun agar pemain bisa membaca melodi, ritme, chord, dan tanda musikal dengan jelas saat latihan maupun pementasan.</p>' = "<p>Dalam $Title, notasi disusun agar pemain bisa membaca melodi, ritme, chord, dan tanda musikal dengan jelas saat latihan maupun pementasan.</p>"
    '<p>Bagian vokal dan choir diarahkan agar harmoni tetap nyaman dinyanyikan, mendukung makna lirik, dan cocok untuk kebutuhan ibadah atau latihan bersama.</p>' = "<p>Untuk $Title, bagian vokal dan choir diarahkan agar harmoni tetap nyaman dinyanyikan, mendukung makna lirik, dan cocok untuk kebutuhan ibadah atau latihan bersama.</p>"
    '<p>Audio sumber ditelusuri untuk menangkap melodi, ritme, chord, dan pola penting agar bisa diubah menjadi notasi yang akurat.</p>' = "<p>Dalam $Title, audio untuk video musik dijaga agar energi live tetap terasa, sementara detail vokal dan instrumen tetap siap masuk editing atau mixing.</p>"
    '<p>File akhir dirapikan agar mudah masuk tahap mixing dan mastering, sehingga balance, dinamika, dan kualitas audio bisa dipoles lebih lanjut.</p>' = "<p>Untuk $Title, file sesi dirapikan agar mudah masuk mixing lanjutan, menjaga dinamika live tetap hidup tanpa mengorbankan kejernihan audio.</p>"
    '<p>Vokal diproses dengan fokus pada kejernihan, ketepatan nada, timing, dan karakter suara agar tetap terasa natural di dalam musik.</p>' = "<p>Pada $Title, vokal diproses dengan fokus pada kejernihan, ketepatan nada, timing, dan karakter suara agar tetap terasa natural di dalam musik.</p>"
    '<p>Elemen jingle dibuat singkat, mudah diingat, dan langsung membawa identitas brand agar pesan utama cepat menempel di pendengar.</p>' = "<p>Dalam $Title, elemen jingle dibuat singkat, mudah diingat, dan langsung membawa identitas brand agar pesan utama cepat menempel di pendengar.</p>"
    '<p>Master disiapkan dengan kontrol loudness dan tonal balance agar tetap nyaman saat diputar di platform streaming dan perangkat berbeda.</p>' = "<p>Untuk $Title, master disiapkan dengan kontrol loudness dan tonal balance agar tetap nyaman saat diputar di platform streaming dan perangkat berbeda.</p>"
    '<p>Materi disiapkan dengan format yang memudahkan proses rekaman, mulai dari guide, struktur bagian, sampai kebutuhan file audio atau referensi.</p>' = "<p>Dalam $Title, materi disiapkan dengan format yang memudahkan proses rekaman, mulai dari guide, struktur bagian, sampai kebutuhan file audio atau referensi.</p>"
    '<p>Bagian orkestra difokuskan pada pembagian peran string, brass, woodwind, dan percussion agar musik terdengar luas tanpa kehilangan detail utama.</p>' = "<p>Pada $Title, bagian orkestra difokuskan pada pembagian peran string, brass, woodwind, dan percussion agar musik terdengar luas tanpa kehilangan detail utama.</p>"
    '<p>Pengembangan chord dan harmoni dibuat untuk memperjelas arah emosi lagu, menjaga perpindahan bagian tetap enak didengar, dan memberi dasar yang kuat untuk melodi utama.</p>' = "<p>Dalam $Title, pengembangan chord dan harmoni dibuat untuk memperjelas arah emosi lagu, menjaga perpindahan bagian tetap enak didengar, dan memberi dasar yang kuat untuk melodi utama.</p>"
    '<p>Sesi live diarahkan untuk menangkap energi performa sambil tetap menjaga detail instrumen dan vokal mudah diproses setelah rekaman.</p>' = "<p>Pada $Title, sesi live diarahkan untuk menangkap energi performa sambil tetap menjaga detail instrumen dan vokal mudah diproses setelah rekaman.</p>"
  }
  foreach ($key in $pairs.Keys) { $Html = $Html.Replace($key, $pairs[$key]) }
  return $Html
}

function Contextualize-EnCards($Html, $Title) {
  $pairs = @{
    '<p>Instrument choices are matched to the genre, leaving space for the lead vocal or melody while keeping the arrangement balanced.</p>' = "<p>In $Title, instrument choices are matched to the genre, leaving space for the lead vocal or melody while keeping the arrangement balanced.</p>"
    '<p>Notation is prepared so players can read melody, rhythm, chords, lyrics, and musical markings clearly during rehearsal or performance.</p>' = "<p>For $Title, notation is prepared so players can read melody, rhythm, chords, lyrics, and musical markings clearly during rehearsal or performance.</p>"
    '<p>Choir and worship parts are shaped so the harmony remains singable, supports the lyric meaning, and works well for group rehearsal.</p>' = "<p>In $Title, choir and worship parts are shaped so the harmony remains singable, supports the lyric meaning, and works well for group rehearsal.</p>"
    '<p>The source audio is traced for melody, rhythm, chords, and important musical patterns before being turned into notation.</p>' = "<p>In $Title, audio for music videos is kept energetic and natural while the vocal and instrument details stay ready for editing or mixing.</p>"
    '<p>Final files are organized for the mixing or mastering stage, making balance, dynamics, and audio polish easier to handle.</p>' = "<p>For $Title, live session files are organized for the next mixing stage while preserving performance dynamics and audio clarity.</p>"
    '<p>Vocal work focuses on clarity, pitch, timing, and tone while keeping the performance natural inside the music.</p>' = "<p>In $Title, vocal work focuses on clarity, pitch, timing, and tone while keeping the performance natural inside the music.</p>"
    '<p>Jingle elements are kept short, memorable, and brand-focused so the main message is easy for listeners to remember.</p>' = "<p>For $Title, jingle elements are kept short, memorable, and brand-focused so the main message is easy for listeners to remember.</p>"
    '<p>Mastering is prepared with controlled loudness and tonal balance so the song translates well across platforms and playback systems.</p>' = "<p>For $Title, mastering is prepared with controlled loudness and tonal balance so the song translates well across platforms and playback systems.</p>"
    '<p>The material is prepared for recording with clear guides, structure, references, and file needs so the session can move efficiently.</p>' = "<p>In $Title, the material is prepared for recording with clear guides, structure, references, and file needs so the session can move efficiently.</p>"
    '<p>Orchestral writing focuses on the roles of strings, brass, woodwinds, and percussion so the music feels wide without losing detail.</p>' = "<p>In $Title, orchestral writing focuses on the roles of strings, brass, woodwinds, and percussion so the music feels wide without losing detail.</p>"
    '<p>Chord and harmony development clarifies the emotional direction of the song, keeps section changes musical, and gives the melody a stronger foundation.</p>' = "<p>For $Title, chord and harmony development clarifies the emotional direction of the song, keeps section changes musical, and gives the melody a stronger foundation.</p>"
    '<p>The service can start from a voice note, demo, MIDI, audio reference, lyric, score, or raw recording depending on what you already have.</p>' = "<p>For $Title, the service can start from a voice note, demo, MIDI, audio reference, lyric, score, or raw recording depending on what you already have.</p>"
    '<p>The final output can continue into sheet music, recording, editing, mixing, mastering, or release preparation based on your project target.</p>' = "<p>After $Title, the final output can continue into sheet music, recording, editing, mixing, mastering, or release preparation based on your project target.</p>"
  }
  foreach ($key in $pairs.Keys) { $Html = $Html.Replace($key, $pairs[$key]) }
  return $Html
}

function Update-IdFile($File) {
  $relative = $File.FullName.Substring($Root.Length + 1)
  $html = [System.IO.File]::ReadAllText($File.FullName)
  $title = Get-Title $html
  if (!$title) { return }
  $category = Get-Category $relative
  $html = $html.Replace('<p>Jika Anda datang dari halaman utama, alurnya tetap sederhana: pilih kebutuhan, siapkan bahan awal, lalu proses bisa dilanjutkan ke aransemen, partitur, recording, mixing, atau mastering sesuai target karya.</p>', "<p>$(IdText $title $category "flow")</p>")
  $html = $html.Replace('<p>Untuk hasil yang lebih matang, halaman ini juga terhubung dengan layanan lain seperti <a href="/aransemen-orkestrasi">aransemen musik</a>, <a href="/penulisan-partitur-notasi">penulisan partitur</a>, <a href="/recording-studio-on-location">recording</a>, dan <a href="/mixing-mastering">mixing mastering</a>.</p>', "<p>$(IdText $title $category "support")</p>")
  $html = $html.Replace('<p>Dengan struktur halaman yang lebih spesifik, pengunjung bisa langsung memahami layanan yang dicari tanpa harus membaca semua topik produksi musik dari awal.</p>', "<p>$(IdText $title $category "specific")</p>")
  $html = $html.Replace('<p>Setiap proyek tetap disesuaikan dengan bahan awal, genre, referensi, deadline, dan output akhir yang Anda butuhkan.</p>', "<p>$(IdText $title $category "benefit")</p>")
  $html = Replace-ExistingCategoryCopy $html $title $false
  $html = Contextualize-IdCards $html $title
  WriteUtf8 $File.FullName $html
}

function Update-EnFile($File) {
  $relative = $File.FullName.Substring($Root.Length + 1)
  $html = [System.IO.File]::ReadAllText($File.FullName)
  $title = Get-Title $html
  if (!$title) { return }
  $category = Get-Category $relative
  $html = $html.Replace('<p>The workflow is simple: choose the service, prepare your source material, then continue into arrangement, notation, recording, mixing, or mastering based on the final goal.</p>', "<p>$(EnText $title $category "flow")</p>")
  $html = $html.Replace('<p>For a more complete production path, this page is also connected with <a href="/en/music-arrangement-orchestration">music arrangement</a>, <a href="/en/sheet-music-notation">sheet music notation</a>, <a href="/en/recording-studio-on-location">recording</a>, and <a href="/en/mixing-mastering">mixing and mastering</a>.</p>', "<p>$(EnText $title $category "support")</p>")
  $html = $html.Replace('<p>With a dedicated English page, international visitors can understand the service directly without reading every music production topic first.</p>', "<p>$(EnText $title $category "specific")</p>")
  $html = $html.Replace('<p>Each project is adapted to the source material, genre, reference, deadline, and final output you need.</p>', "<p>$(EnText $title $category "benefit")</p>")
  $html = Replace-ExistingCategoryCopy $html $title $true
  $html = Contextualize-EnCards $html $title
  WriteUtf8 $File.FullName $html
}

$idRoots = @("aransemen-orkestrasi", "penulisan-partitur-notasi", "mixing-mastering", "recording-studio-on-location") | ForEach-Object { Join-Path $Root $_ }
$idFiles = Get-ChildItem -Path $idRoots -Recurse -Filter index.html | Where-Object { $_.FullName -match '\\.+\\.+\\index\.html$' -and $_.DirectoryName -ne (Join-Path $Root "aransemen-orkestrasi") -and $_.DirectoryName -ne (Join-Path $Root "penulisan-partitur-notasi") -and $_.DirectoryName -ne (Join-Path $Root "mixing-mastering") -and $_.DirectoryName -ne (Join-Path $Root "recording-studio-on-location") }
foreach ($file in $idFiles) { Update-IdFile $file }

$enFiles = Get-ChildItem -Path (Join-Path $Root "en") -Recurse -Filter index.html | Where-Object { $_.DirectoryName -notin @((Join-Path $Root "en"), (Join-Path $Root "en\music-arrangement-orchestration"), (Join-Path $Root "en\sheet-music-notation"), (Join-Path $Root "en\mixing-mastering"), (Join-Path $Root "en\recording-studio-on-location")) }
foreach ($file in $enFiles) { Update-EnFile $file }

Write-Host "Reduced repeated paragraphs in $($idFiles.Count) Indonesian pages and $($enFiles.Count) English pages."
