$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$Site = "https://musiknyadimas.com"
$Date = "2026-05-22"
$CssVersion = "18"

Remove-Item Alias:h -ErrorAction SilentlyContinue

function H($Text) {
  return [System.Net.WebUtility]::HtmlEncode([string]$Text)
}

function WriteUtf8($Path, $Content) {
  $dir = Split-Path -Parent $Path
  if ($dir) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
  }
  [System.IO.File]::WriteAllText($Path, $Content, [System.Text.UTF8Encoding]::new($false))
}

$Parents = [ordered]@{
  "aransemen-orkestrasi" = @{
    enPath = "music-arrangement-orchestration"
    title = "Music Arrangement & Orchestration"
    desc = "Professional music arrangement and orchestration services for songs, strings, cinematic scoring, jingles, hymns, and release-ready music production."
    h1 = @("Professional Music", "Arrangement &", "Orchestration")
    lead = "Turn a simple melody, voice note, or demo into a fuller musical production with clear structure, emotional direction, and release-ready arrangement."
    headline = "English service pages for arrangement and orchestration"
    copy = "These English pages help international clients find the exact service they need, from song arrangement and orchestration to string section, jingle, hymn, and cinematic scoring."
  }
  "penulisan-partitur-notasi" = @{
    enPath = "sheet-music-notation"
    title = "Sheet Music & Notation"
    desc = "Sheet music, music notation, transcription, orchestral score, choir score, MIDI cleanup, and printable music score services."
    h1 = @("Sheet Music", "& Notation", "Services")
    lead = "Convert audio, MIDI, melodies, songs, or arrangements into clean sheet music that is easy to read, rehearse, and perform."
    headline = "English service pages for sheet music and notation"
    copy = "These pages separate different notation needs so international clients can find transcription, orchestral score, choir score, MIDI to sheet music, and pop song score services."
  }
  "mixing-mastering" = @{
    enPath = "mixing-mastering"
    title = "Mixing & Mastering"
    desc = "Professional mixing and mastering services for vocals, songs, covers, jingles, Spotify releases, editing, and vocal tuning."
    h1 = @("Mixing &", "Mastering", "Services")
    lead = "Make vocals, instruments, and final masters sound clearer, more balanced, and ready for release on streaming platforms."
    headline = "English service pages for mixing and mastering"
    copy = "These English pages organize audio post-production needs into vocal mixing, song mastering, cover mixing, Spotify-ready mastering, vocal tuning, and jingle mixing."
  }
  "recording-studio-on-location" = @{
    enPath = "recording-studio-on-location"
    title = "Recording Studio & On Location"
    desc = "Recording studio and on-location recording services for vocals, instruments, choir, podcast, voice over, live session, and music production."
    h1 = @("Recording Studio", "& On Location", "Services")
    lead = "Record vocals, instruments, choirs, podcasts, voice overs, live sessions, or events with a workflow that can continue into editing, mixing, and mastering."
    headline = "English service pages for recording"
    copy = "These English pages help clients choose between studio vocal recording, instrument recording, choir recording, on-location recording, podcast and voice over, or live session recording."
  }
}

$Pages = @(
  @{ parent="aransemen-orkestrasi"; idPath="aransemen-orkestrasi/jasa-aransemen-lagu"; enPath="music-arrangement-orchestration/song-arrangement-service"; title="Professional Song Arrangement Service"; desc="Professional song arrangement service for melodies, chords, structure, intros, interludes, backing music, and production-ready songs."; h1=@("Professional Song", "Arrangement", "Service"); focus="turning voice notes, simple melodies, basic chords, or rough demos into complete songs with clearer structure"; cards=@("Chord and harmony development","Intro, interlude, and ending creation","Instrument selection by genre","Files ready for recording and mixing") }
  @{ parent="aransemen-orkestrasi"; idPath="aransemen-orkestrasi/jasa-orkestrasi-musik"; enPath="music-arrangement-orchestration/orchestration-service"; title="Professional Music Orchestration Service"; desc="Music orchestration service for strings, brass, woodwinds, percussion, full orchestra, cinematic scoring, hymns, and grand arrangements."; h1=@("Professional Music", "Orchestration", "Service"); focus="distributing musical ideas across orchestral instruments such as strings, brass, woodwinds, and percussion"; cards=@("Full orchestra arrangement","String, brass, and woodwind sections","Cinematic scoring","Score-ready orchestration") }
  @{ parent="aransemen-orkestrasi"; idPath="aransemen-orkestrasi/aransemen-string-section"; enPath="music-arrangement-orchestration/string-section-arrangement"; title="String Section Arrangement Service"; desc="String section arrangement service for violin, viola, cello, string quartet, pop ballad, worship, cinematic, and orchestral layers."; h1=@("String Section", "Arrangement", "Service"); focus="adding violin, viola, and cello layers that support the emotion of a song without making the arrangement feel overcrowded"; cards=@("String quartet or ensemble","Emotional counter melodies","String layers for chorus","Notation-ready string parts") }
  @{ parent="aransemen-orkestrasi"; idPath="aransemen-orkestrasi/aransemen-lagu-pop"; enPath="music-arrangement-orchestration/pop-song-arrangement"; title="Pop Song Arrangement Service"; desc="Pop song arrangement service for singles, demos, covers, original songs, pop ballads, modern pop, and release-ready music production."; h1=@("Pop Song", "Arrangement", "Service"); focus="making pop songs more release-ready through groove, bass, piano, guitar, beat, and stronger chorus dynamics"; cards=@("Pop ballad and modern pop","Beat, bass, piano, and guitar","Radio-friendly song structure","Original single production") }
  @{ parent="aransemen-orkestrasi"; idPath="aransemen-orkestrasi/aransemen-lagu-rohani"; enPath="music-arrangement-orchestration/worship-song-arrangement"; title="Worship Song Arrangement Service"; desc="Worship song arrangement service for church music, choir, hymns, worship bands, ministry, and professional Christian music production."; h1=@("Worship Song", "Arrangement", "Service"); focus="building worship, choir, piano-string, or full band arrangements that support the lyric meaning and worship atmosphere"; cards=@("Worship band and choir","Soft piano and string layers","Directed worship dynamics","Choir score continuation") }
  @{ parent="aransemen-orkestrasi"; idPath="aransemen-orkestrasi/aransemen-jingle-iklan"; enPath="music-arrangement-orchestration/jingle-arrangement"; title="Jingle Arrangement Service"; desc="Jingle arrangement service for brands, schools, companies, campaigns, radio, promotional videos, and commercial audio needs."; h1=@("Jingle", "Arrangement", "Service"); focus="creating short musical hooks that are memorable, brand-focused, and ready for videos or social media campaigns"; cards=@("Brand and school jingles","Memorable musical hooks","Short or full versions","Ready for ads and content") }
  @{ parent="aransemen-orkestrasi"; idPath="aransemen-orkestrasi/aransemen-mars-hymne"; enPath="music-arrangement-orchestration/march-hymn-arrangement"; title="March and Hymn Arrangement Service"; desc="March and hymn arrangement service for schools, institutions, organizations, choirs, communities, and formal events."; h1=@("March and Hymn", "Arrangement", "Service"); focus="arranging marches and hymns that are strong, singable, and suitable for schools, institutions, or organizations"; cards=@("School and institution marches","Organization hymns","Choir or orchestral format","Ready for rehearsal and recording") }
  @{ parent="aransemen-orkestrasi"; idPath="aransemen-orkestrasi/film-scoring-cinematic"; enPath="music-arrangement-orchestration/film-scoring-cinematic-music"; title="Film Scoring and Cinematic Music Service"; desc="Film scoring and cinematic music service for videos, short films, documentaries, company profiles, opening ceremonies, and visual content."; h1=@("Film Scoring", "and Cinematic", "Music Service"); focus="creating background music that follows visual emotion, scene movement, pacing, and storytelling needs"; cards=@("Short film scoring","Company profile and documentary","Opening ceremony music","Cinematic orchestration") }

  @{ parent="penulisan-partitur-notasi"; idPath="penulisan-partitur-notasi/jasa-penulisan-not-balok"; enPath="sheet-music-notation/music-notation-service"; title="Music Notation Service"; desc="Professional music notation service for songs, rehearsals, concerts, recordings, music schools, teachers, and work documentation."; h1=@("Music Notation", "Service"); focus="writing pitch, rhythm, rests, dynamics, articulation, and tempo so music is easier for players to read"; cards=@("Clean score layout","Readable notation","Printable PDF format","Rehearsal and concert use") }
  @{ parent="penulisan-partitur-notasi"; idPath="penulisan-partitur-notasi/transkripsi-audio-ke-notasi"; enPath="sheet-music-notation/audio-to-sheet-music-transcription"; title="Audio to Sheet Music Transcription Service"; desc="Audio to sheet music transcription from MP3, voice notes, videos, song demos, live recordings, MIDI, and reference music."; h1=@("Audio to", "Sheet Music", "Transcription"); focus="turning MP3s, voice notes, videos, or demos into music notation that can be read, studied, and performed again"; cards=@("From MP3 or video","Melody, chords, and rhythm","Vocal and instrument notation","Ready for arrangement") }
  @{ parent="penulisan-partitur-notasi"; idPath="penulisan-partitur-notasi/jasa-partitur-orkestra"; enPath="sheet-music-notation/orchestral-score-service"; title="Orchestral Score Service"; desc="Orchestral score service for full scores, individual parts, strings, brass, woodwinds, percussion, and ensemble formats."; h1=@("Orchestral Score", "Service"); focus="creating full scores and individual parts for conductors, string players, woodwinds, brass, and percussion"; cards=@("Full orchestral score","Individual player parts","Instrument transposition","Print-ready format") }
  @{ parent="penulisan-partitur-notasi"; idPath="penulisan-partitur-notasi/jasa-partitur-paduan-suara"; enPath="sheet-music-notation/choir-score-service"; title="Choir Score Service"; desc="Choir score service for SATB, choir, vocal group, worship songs, hymns, schools, churches, and communities."; h1=@("Choir Score", "Service"); focus="writing SATB, SSA, TTB, unison, or vocal group scores with lyrics and comfortable harmony for rehearsal"; cards=@("SATB and vocal group","Neatly placed lyrics","Church and school use","Choir rehearsal ready") }
  @{ parent="penulisan-partitur-notasi"; idPath="penulisan-partitur-notasi/midi-ke-partitur"; enPath="sheet-music-notation/midi-to-sheet-music"; title="MIDI to Sheet Music Service"; desc="MIDI to sheet music service for clean PDF scores, music notation, full scores, individual parts, and readable notation."; h1=@("MIDI to", "Sheet Music", "Service"); focus="cleaning up dense MIDI output into notation that feels more natural, readable, and rehearsal-ready"; cards=@("Notation quantize cleanup","Printable PDF","Full score option","DAW MIDI cleanup") }
  @{ parent="penulisan-partitur-notasi"; idPath="penulisan-partitur-notasi/partitur-lagu-pop"; enPath="sheet-music-notation/pop-song-score"; title="Pop Song Score Service"; desc="Pop song score service for vocals, piano, guitar, chords, melody, band parts, rehearsals, covers, and original song documentation."; h1=@("Pop Song", "Score Service"); focus="creating lead sheets, piano vocal scores, chords, lyrics, or simple band parts for pop song needs"; cards=@("Lead sheet melody and chords","Piano vocal score","Simple band parts","Original song documentation") }

  @{ parent="mixing-mastering"; idPath="mixing-mastering/jasa-mixing-vokal"; enPath="mixing-mastering/vocal-mixing-service"; title="Vocal Mixing Service"; desc="Vocal mixing service for songs, covers, voice over, backing vocals, tuning, EQ, compression, reverb, delay, and vocal clarity."; h1=@("Vocal Mixing", "Service"); focus="making lead vocals sound clear, stable, present, and naturally blended with the music"; cards=@("Clearer vocals","Natural tuning","Genre-matched reverb and delay","Ready for mastering") }
  @{ parent="mixing-mastering"; idPath="mixing-mastering/jasa-mastering-lagu"; enPath="mixing-mastering/song-mastering-service"; title="Song Mastering Service"; desc="Professional song mastering service for singles, albums, covers, Spotify, YouTube, Apple Music, TikTok, and digital releases."; h1=@("Song Mastering", "Service"); focus="preparing the final audio so loudness, tonal balance, stereo image, and file formats are ready for digital release"; cards=@("Stable loudness","Balanced tone","Digital release ready","WAV and MP3 delivery") }
  @{ parent="mixing-mastering"; idPath="mixing-mastering/mixing-mastering-cover"; enPath="mixing-mastering/cover-song-mixing-mastering"; title="Cover Song Mixing and Mastering Service"; desc="Cover song mixing and mastering service for YouTube, TikTok, Instagram, Spotify, bands, acoustic covers, and vocal covers."; h1=@("Cover Song", "Mixing and", "Mastering"); focus="polishing vocals, acoustic guitar, piano, backing tracks, or cover bands so content sounds more professional"; cards=@("Acoustic and band covers","More present vocals","Light noise reduction","Ready for content upload") }
  @{ parent="mixing-mastering"; idPath="mixing-mastering/mixing-mastering-spotify"; enPath="mixing-mastering/spotify-mixing-mastering"; title="Spotify Mixing and Mastering Service"; desc="Mixing and mastering service for Spotify, Apple Music, YouTube Music, TikTok, and digital streaming platforms."; h1=@("Spotify Mixing", "and Mastering", "Service"); focus="preparing songs to remain comfortable after loudness normalization on Spotify, YouTube Music, Apple Music, and other platforms"; cards=@("Distributor-ready audio","Controlled loudness","Streaming platform friendly","Clean final files") }
  @{ parent="mixing-mastering"; idPath="mixing-mastering/editing-tuning-vokal"; enPath="mixing-mastering/vocal-editing-tuning"; title="Vocal Editing and Tuning Service"; desc="Vocal editing and tuning service for pitch correction, timing, breaths, noise, take comping, and vocal mixing preparation."; h1=@("Vocal Editing", "and Tuning", "Service"); focus="cleaning pitch, timing, breaths, light noise, and take comping before the vocal enters mixing"; cards=@("Natural pitch correction","Cleaner vocal timing","Best take comping","Ready for vocal mixing") }
  @{ parent="mixing-mastering"; idPath="mixing-mastering/mixing-jingle-iklan"; enPath="mixing-mastering/jingle-ad-mixing"; title="Jingle and Ad Mixing Service"; desc="Jingle and ad mixing service for commercials, voice over, audio branding, radio spots, company profiles, and promotional videos."; h1=@("Jingle and Ad", "Mixing", "Service"); focus="balancing music, voice over, sound effects, and brand messages so they stay clear in promotional videos or social media"; cards=@("Clearer voice over","Music supports the message","Promo video ready","Brand and school projects") }

  @{ parent="recording-studio-on-location"; idPath="recording-studio-on-location/recording-vokal-studio"; enPath="recording-studio-on-location/studio-vocal-recording"; title="Studio Vocal Recording Service"; desc="Studio vocal recording service for original songs, covers, jingles, hymns, worship music, voice over, and professional music production."; h1=@("Studio Vocal", "Recording", "Service"); focus="recording vocals in a controlled room so the voice is clean, focused, and easier to process into mixing"; cards=@("Original vocal recording","Cover songs and jingles","Vocal take direction","Ready for mixing and mastering") }
  @{ parent="recording-studio-on-location"; idPath="recording-studio-on-location/recording-instrumen"; enPath="recording-studio-on-location/instrument-recording"; title="Instrument Recording Service"; desc="Instrument recording service for guitar, bass, piano, strings, brass, percussion, bands, and music production needs."; h1=@("Instrument", "Recording", "Service"); focus="recording guitar, bass, piano, strings, brass, percussion, or other instruments with detailed sound character"; cards=@("Guitar, bass, and piano","Strings and brass","Clean tracks for mixing","Song arrangement support") }
  @{ parent="recording-studio-on-location"; idPath="recording-studio-on-location/recording-choir"; enPath="recording-studio-on-location/choir-recording"; title="Choir Recording Service"; desc="Choir recording service for choirs, vocal groups, backing vocals, churches, schools, communities, marches, and hymns."; h1=@("Choir Recording", "Service"); focus="recording choirs with singer and microphone placement that keeps harmony balance between voice parts"; cards=@("SATB and vocal group","Studio or location recording","Balanced harmony","Ready for choir mixing") }
  @{ parent="recording-studio-on-location"; idPath="recording-studio-on-location/recording-on-location"; enPath="recording-studio-on-location/on-location-recording"; title="On Location Recording Service"; desc="On-location recording service for events, worship, seminars, live sessions, choirs, podcasts, documentation, and video production."; h1=@("On Location", "Recording", "Service"); focus="recording events, worship, choirs, seminars, live sessions, or content on site with equipment matched to the need"; cards=@("Event location recording","Equipment matched to the project","Live session support","Audio editing continuation") }
  @{ parent="recording-studio-on-location"; idPath="recording-studio-on-location/recording-podcast-voice-over"; enPath="recording-studio-on-location/podcast-voice-over-recording"; title="Podcast and Voice Over Recording Service"; desc="Podcast and voice over recording service for narration, ads, company profiles, learning videos, digital content, and audio branding."; h1=@("Podcast and", "Voice Over", "Recording"); focus="recording narration, podcasts, ads, learning videos, and company profiles so the voice sounds close and clear"; cards=@("Single or multi-host podcast","Advertising voice over","Company profile narration","Content audio editing") }
  @{ parent="recording-studio-on-location"; idPath="recording-studio-on-location/live-session-recording"; enPath="recording-studio-on-location/live-session-recording"; title="Live Session Recording Service"; desc="Live session recording service for bands, acoustic sessions, worship sessions, live music videos, YouTube content, and performance documentation."; h1=@("Live Session", "Recording", "Service"); focus="capturing the energy of band, acoustic, worship, or live music video performances while keeping audio clean"; cards=@("Band and acoustic sessions","Worship live sessions","Audio for music videos","Live mixing continuation") }
)

$RouteMap = [ordered]@{
  "/" = "/en"
}
foreach ($key in $Parents.Keys) {
  $RouteMap["/$key"] = "/en/$($Parents[$key].enPath)"
}
foreach ($page in $Pages) {
  $RouteMap["/$($page.idPath)"] = "/en/$($page.enPath)"
}

function HreflangBlock($IdPath, $EnPath) {
@"
  <link rel="alternate" hreflang="id-ID" href="$Site$IdPath">
  <link rel="alternate" hreflang="en-US" href="$Site$EnPath">
  <link rel="alternate" hreflang="x-default" href="$Site$IdPath">
"@
}

function InjectAlternates($RelativeFile, $IdPath, $EnPath) {
  $path = Join-Path $Root $RelativeFile
  if (!(Test-Path $path)) { return }
  $html = [System.IO.File]::ReadAllText($path)
  $html = [regex]::Replace($html, "\s*<link rel=""alternate"" hreflang=""[^""]+"" href=""[^""]+"">", "")
  $block = HreflangBlock $IdPath $EnPath
  if ($html -match '<link rel="canonical" href="[^"]+">') {
    $html = [regex]::Replace($html, '(<link rel="canonical" href="[^"]+">)', "`$1`r`n$block", 1)
  } else {
    $html = $html.Replace("</head>", "$block`r`n</head>")
  }
  WriteUtf8 $path $html
}

function AudioPreview($Prefix) {
@"
        <div class="audio-preview" aria-label="Audio preview">
          <article class="audio-card">
            <div class="audio-title">Galenna - Ibuku</div>
            <div class="audio-controls">
              <div class="play-btn" aria-label="Play audio preview"><div class="icon play"></div></div>
              <div class="waveform"></div>
              <div class="duration">04:40</div>
            </div>
            <audio src="/MUSIK/Jasa aransemen lagu - Kang Deden - Ibuku.mp3" preload="metadata"></audio>
          </article>
          <article class="audio-card">
            <div class="audio-title">Aldis Burger - Jingle</div>
            <div class="audio-controls">
              <div class="play-btn" aria-label="Play audio preview"><div class="icon play"></div></div>
              <div class="waveform"></div>
              <div class="duration">01:05</div>
            </div>
            <audio src="/MUSIK/Jasa aransemen lagu - Aldis Burger - Jingle.mp3" preload="metadata"></audio>
          </article>
          <a class="btn-more" href="#portfolio">
            <span class="btn-text-front">More</span>
            <span class="btn-text-back">More</span>
          </a>
        </div>
"@
}

function HeroSpans($Lines) {
  ($Lines | ForEach-Object { "          <span>$(H $_)</span>" }) -join "`n"
}

function NavBlock($LogoPrefix) {
@"
      <nav class="navbar" aria-label="Main navigation">
        <button class="mobile-menu-icon" type="button" aria-label="Open menu" aria-controls="mobileMenu" aria-expanded="false">
          <span></span><span></span><span></span>
        </button>
        <div class="menu">
          <a href="/en/">Home</a>
          <a href="/en/#layanan-kami">Services</a>
          <a href="/en/#portfolio">Portfolio</a>
          <a href="/en/#konsultasi">Consultation</a>
        </div>
        <a class="logo" href="/en/" aria-label="Musiknya Dimas">
          <img src="/IMAGE/logo dimas and friends.png" alt="Musiknya Dimas logo">
        </a>
      </nav>
"@
}

function FeatureCard($Title, $Index) {
  $icons = @(
    '<path d="M4 12h16" /><path d="M7 8v8M12 5v14M17 9v6" />',
    '<path d="M5 5h14v14H5z" /><path d="M8 12h8" /><path d="M12 8v8" />',
    '<path d="M6 4h9l3 3v13H6z" /><path d="M15 4v4h3" /><path d="M9 12h6M9 15h6" />',
    '<path d="M4 19h16" /><path d="M6 15l4-4 3 3 5-7" /><path d="M15 7h3v3" />'
  )
@"
            <article>
              <h3><span class="item-icon" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none">$($icons[$Index % $icons.Count])</svg></span><span>$(H $Title)</span></h3>
              <p>$(H $Title) is handled with a workflow that adapts to the source material, genre, reference, deadline, and final output you need.</p>
            </article>
"@
}

function BranchCard($Page, $Index) {
  $images = @(
    "/IMAGE/card studio rekaman.jpg",
    "/IMAGE/card aransemen musik dan orkestrasi.jpg",
    "/IMAGE/card mixing dan mastering.jpg",
    "/IMAGE/card penulisan partitur dan notasi.jpg",
    "/IMAGE/BG jasa rekording.png",
    "/IMAGE/BG jasa mixing mastering.png"
  )
@"
          <a class="branch-card" href="/en/$($Page.enPath)" style="--branch-image: url('$($images[$Index % $images.Count])')">
            <span class="branch-card-inner">
              <span>
                <h3>$(H $Page.title)</h3>
                <p>$(H $Page.desc)</p>
              </span>
              <span class="branch-card-link">Read this page</span>
            </span>
          </a>
"@
}

function SubPageHtml($Page) {
  $parent = $Parents[$Page.parent]
  $idPath = "/$($Page.idPath)"
  $enPath = "/en/$($Page.enPath)"
  $related = @($Pages | Where-Object { $_.parent -eq $Page.parent -and $_.idPath -ne $Page.idPath } | Select-Object -First 4)
  $relatedLinks = ($related | Select-Object -First 3 | ForEach-Object {
    "              <li><a href=""/en/$($_.enPath)"">$(H $_.title)</a></li>"
  }) -join "`n"
  $relatedCards = ""
  for ($i = 0; $i -lt $related.Count; $i++) {
    $relatedCards += (BranchCard $related[$i] $i)
  }
  $cardsA = @($Page.cards | Select-Object -First 2)
  $cardsB = @($Page.cards | Select-Object -Skip 2)
  $featureA = ""
  for ($i = 0; $i -lt $cardsA.Count; $i++) { $featureA += (FeatureCard $cardsA[$i] $i) }
  $featureB = ""
  for ($i = 0; $i -lt $cardsB.Count; $i++) { $featureB += (FeatureCard $cardsB[$i] ($i + 2)) }

@"
<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>$(H $Page.title) | Musiknya Dimas</title>
  <meta name="description" content="$(H $Page.desc)">
  <link rel="canonical" href="$Site$enPath">
$(HreflangBlock $idPath $enPath)
  <meta property="og:title" content="$(H $Page.title) | Musiknya Dimas">
  <meta property="og:description" content="$(H $Page.desc)">
  <meta property="og:type" content="website">
  <meta property="og:url" content="$Site$enPath">
  <meta property="og:image" content="$Site/favicon.png">
  <meta name="twitter:card" content="summary">
  <link rel="icon" type="image/png" href="/favicon.png">
  <link rel="apple-touch-icon" href="/favicon.png">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="/CSS/aransemen-orkestrasi.css?v=$CssVersion">
</head>
<body class="partitur-page seo-branch-page">
  <header class="hero parallax-section">
    <div class="page-container">
$(NavBlock "/")
      <div class="seo-hero-grid">
        <div class="hero-content">
          <div class="breadcrumb-links">
            <a href="/en/">Home</a>
            <a href="/en/$($parent.enPath)">$(H $parent.title)</a>
            <a href="/en/$($Page.enPath)">$(H $Page.title)</a>
          </div>
          <h1>
$(HeroSpans $Page.h1)
          </h1>
        </div>
$(AudioPreview "/")
      </div>
    </div>
  </header>
  <main>
    <section class="summary-section">
      <div class="page-container intro-grid">
        <p><strong>$(H $Page.title)</strong> is an English service page from <a href="/en/$($parent.enPath)">$(H $parent.title)</a>, created for international searches and clients who need a more specific music production service.</p>
        <p>The workflow is simple: choose the service, prepare your source material, then continue into arrangement, notation, recording, mixing, or mastering based on the final goal.</p>
      </div>
    </section>
    <section class="content-section white-section" id="apa-itu">
      <div class="page-container page-visual-split">
        <div class="section-image" role="img" aria-label="$(H $Page.title)" style="--section-image: url('/IMAGE/BG jasa aransemen musik & orkestrasi.png')"></div>
        <div>
          <h2>$(H $Page.title)</h2>
          <div class="copy-stack">
            <p>This service focuses on $(H $Page.focus). The process is flexible, so the arrangement or production can follow your source material, references, genre, and release target.</p>
            <p>For a more complete production path, this page is also connected with <a href="/en/music-arrangement-orchestration">music arrangement</a>, <a href="/en/sheet-music-notation">sheet music notation</a>, <a href="/en/recording-studio-on-location">recording</a>, and <a href="/en/mixing-mastering">mixing and mastering</a>.</p>
            <p>With a dedicated English page, international visitors can understand the service directly without reading every music production topic first.</p>
          </div>
        </div>
      </div>
    </section>
    <section class="dark-section parallax-section">
      <div class="page-container">
        <section class="content-section dark-content page-visual-split">
          <div>
            <h2>Related production services</h2>
            <p class="related-copy">This page connects to related services in the same production area, so visitors can continue to the most relevant next step.</p>
            <ul class="inline-link-list">
$relatedLinks
              <li><a href="/en/$($parent.enPath)">$(H $parent.title)</a></li>
            </ul>
          </div>
          <div class="section-image tall" role="img" aria-label="Musiknya Dimas music production" style="--section-image: url('/IMAGE/background-cta.jpg')"></div>
        </section>
      </div>
    </section>
    <section class="benefit-section">
      <div class="page-container benefit-grid">
        <div class="benefit-copy">
          <h2>What can be handled in this service</h2>
          <p>Each project is adapted to the source material, genre, reference, deadline, and final output you need.</p>
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
        <h2>Related services for the same need</h2>
        <div class="branch-grid">
$relatedCards
        </div>
      </div>
    </section>
  </main>
  <script src="/JS/mobile-menu.js?v=10"></script>
  <script src="/JS/subpage-sections.js?v=2"></script>
  <script src="/JS/script.js?v=11"></script>
</body>
</html>
"@
}

function ParentHtml($Key) {
  $parent = $Parents[$Key]
  $idPath = "/$Key"
  $enPath = "/en/$($parent.enPath)"
  $children = @($Pages | Where-Object { $_.parent -eq $Key })
  $cards = ""
  for ($i = 0; $i -lt $children.Count; $i++) { $cards += (BranchCard $children[$i] $i) }
@"
<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>$(H $parent.title) | Musiknya Dimas</title>
  <meta name="description" content="$(H $parent.desc)">
  <link rel="canonical" href="$Site$enPath">
$(HreflangBlock $idPath $enPath)
  <meta property="og:title" content="$(H $parent.title) | Musiknya Dimas">
  <meta property="og:description" content="$(H $parent.desc)">
  <meta property="og:type" content="website">
  <meta property="og:url" content="$Site$enPath">
  <meta property="og:image" content="$Site/favicon.png">
  <meta name="twitter:card" content="summary">
  <link rel="icon" type="image/png" href="/favicon.png">
  <link rel="apple-touch-icon" href="/favicon.png">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="/CSS/aransemen-orkestrasi.css?v=$CssVersion">
</head>
<body class="partitur-page seo-branch-page">
  <header class="hero parallax-section">
    <div class="page-container">
$(NavBlock "/")
      <div class="seo-hero-grid">
        <div class="hero-content">
          <div class="breadcrumb-links">
            <a href="/en/">Home</a>
            <a href="/en/$($parent.enPath)">$(H $parent.title)</a>
          </div>
          <h1>
$(HeroSpans $parent.h1)
          </h1>
        </div>
$(AudioPreview "/")
      </div>
    </div>
  </header>
  <main>
    <section class="summary-section">
      <div class="page-container intro-grid">
        <p><strong>$(H $parent.title)</strong> is the English version of this service area, created for international visitors who search in English.</p>
        <p>All English pages use the same visual system, CSS, audio player, and interaction scripts as the Indonesian site, while the text remains independent for English SEO.</p>
      </div>
    </section>
    <section class="content-section white-section" id="apa-itu">
      <div class="page-container">
        <h2>$(H $parent.title)</h2>
        <div class="three-column">
          <p>$(H $parent.lead)</p>
          <p>The service can start from a voice note, demo, MIDI, audio reference, lyric, score, or raw recording depending on what you already have.</p>
          <p>The final output can continue into sheet music, recording, editing, mixing, mastering, or release preparation based on your project target.</p>
        </div>
      </div>
    </section>
    <section class="branch-hub-section" id="pilihan-layanan">
      <div class="page-container">
        <div class="branch-hub-head">
          <h2>$(H $parent.headline)</h2>
          <p>$(H $parent.copy)</p>
        </div>
        <div class="branch-grid">
$cards
        </div>
      </div>
    </section>
  </main>
  <script src="/JS/mobile-menu.js?v=10"></script>
  <script src="/JS/subpage-sections.js?v=2"></script>
  <script src="/JS/script.js?v=11"></script>
</body>
</html>
"@
}

function HomeHtml() {
  $cards = ""
  $i = 0
  foreach ($key in $Parents.Keys) {
    $p = $Parents[$key]
    $cards += @"
      <a class="branch-card" href="/en/$($p.enPath)" style="--branch-image: url('/IMAGE/card aransemen musik dan orkestrasi.jpg')">
        <span class="branch-card-inner">
          <span>
            <h3>$(H $p.title)</h3>
            <p>$(H $p.desc)</p>
          </span>
          <span class="branch-card-link">Explore service</span>
        </span>
      </a>
"@
    $i++
  }
@"
<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta charset="UTF-8">
  <title>Music Arrangement, Mixing Mastering & Recording Studio | Musiknya Dimas</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Professional music arrangement, orchestration, mixing mastering, notation, and recording services for international music projects.">
  <link rel="canonical" href="$Site/en">
$(HreflangBlock "/" "/en")
  <meta property="og:title" content="Professional Music Production Services - Musiknya Dimas">
  <meta property="og:description" content="Arrangement, orchestration, mixing mastering, notation, and recording services for professional music production.">
  <meta property="og:type" content="website">
  <meta property="og:url" content="$Site/en">
  <meta property="og:image" content="$Site/favicon.png">
  <meta name="twitter:card" content="summary">
  <link rel="icon" type="image/png" href="/favicon.png">
  <link rel="apple-touch-icon" href="/favicon.png">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="/CSS/aransemen-orkestrasi.css?v=$CssVersion">
  <link rel="stylesheet" href="/CSS/style.css?v=16">
</head>
<body>
  <section class="hero parallax-section">
    <div class="global-container">
      <div class="navbar">
        <div class="mobile-menu-icon"><span></span><span></span><span></span></div>
        <div class="menu">
          <a href="/en/">Home</a>
          <a href="#layanan-kami">Services</a>
          <a href="#portfolio">Portfolio</a>
          <a href="#konsultasi">Consultation</a>
        </div>
        <div class="logo"><img src="/IMAGE/logo dimas and friends.png" alt="Musiknya Dimas logo"></div>
      </div>
      <div class="audio-preview">
        <div class="audio-card">
          <div class="audio-title">Galenna - Ibuku</div>
          <div class="audio-controls"><div class="play-btn"><div class="icon play"></div></div><div class="waveform"></div><div class="duration">04:40</div></div>
          <audio src="/MUSIK/Jasa aransemen lagu - Kang Deden - Ibuku.mp3" preload="metadata"></audio>
        </div>
        <div class="audio-card">
          <div class="audio-title">Aldis Burger - Jingle</div>
          <div class="audio-controls"><div class="play-btn"><div class="icon play"></div></div><div class="waveform"></div><div class="duration">01:05</div></div>
          <audio src="/MUSIK/Jasa aransemen lagu - Aldis Burger - Jingle.mp3" preload="metadata"></audio>
        </div>
        <button class="btn-more" onclick="location.href='#portfolio'"><span class="btn-text-front">More</span><span class="btn-text-back">More</span></button>
      </div>
      <div class="hero-content">
        <h1 class="hero-title">
          <span>Professional Music</span>
          <span>Arrangement</span>
          <span>& Song Production</span>
          <span>Services for</span>
          <span>Global Projects</span>
        </h1>
        <p>Turn your music idea into a professional audio production, from arrangement and orchestration to recording, mixing, mastering, and notation.</p>
        <div class="cta">
          <div class="guide-line horizontal"></div>
          <div class="btn-wrap">
            <button class="btn-primary" onclick="window.open('https://wa.me/6285737690807', '_blank')">
              <span class="circle"><svg width="26" height="26" viewBox="0 0 24 24" fill="none"><path d="M4 12H18" stroke="#CF7325" stroke-width="2.5" stroke-linecap="round"/><path d="M13 7L18 12L13 17" stroke="#CF7325" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/></svg></span>
              <span class="text">Book Now</span>
            </button>
          </div>
          <a href="#portfolio" class="portfolio">View Portfolio</a>
        </div>
      </div>
    </div>
    <div class="guide-line vertical"></div>
  </section>
  <main>
    <section class="branch-hub-section" id="layanan-kami">
      <div class="page-container">
        <div class="branch-hub-head">
          <h2>Music production services</h2>
          <p>Choose the production area that matches your project. Each English page has independent content while sharing the same visual system with the Indonesian website.</p>
        </div>
        <div class="branch-grid">
$cards
        </div>
      </div>
    </section>
    <section class="pf-section" id="portfolio">
      <div class="pf-container">
        <div class="pf-title-wrap"><h2 class="pf-title">Selected music portfolio</h2></div>
        <p class="pf-desc">Listen to selected arrangement and production examples from Musiknya Dimas. The same audio player system is shared with the Indonesian site.</p>
      </div>
    </section>
    <section class="cta-section" id="konsultasi">
      <div class="cta-container">
        <h2 class="cta-title">Ready to produce your music?</h2>
        <div class="cta-actions">
          <a class="cta-btn-wrap" href="https://wa.me/6285737690807" target="_blank" rel="noopener">
            <span class="cta-btn-primary"><span class="cta-circle"></span><span class="cta-btn-text">Consult Now</span></span>
          </a>
        </div>
      </div>
    </section>
  </main>
  <script src="/JS/mobile-menu.js?v=10"></script>
  <script src="/JS/script.js?v=11"></script>
</body>
</html>
"@
}

WriteUtf8 (Join-Path $Root "en\index.html") (HomeHtml)
InjectAlternates "index.html" "/" "/en"

foreach ($key in $Parents.Keys) {
  $parent = $Parents[$key]
  WriteUtf8 (Join-Path $Root "en\$($parent.enPath)\index.html") (ParentHtml $key)
  InjectAlternates "$key\index.html" "/$key" "/en/$($parent.enPath)"
}

foreach ($page in $Pages) {
  WriteUtf8 (Join-Path $Root "en\$($page.enPath)\index.html") (SubPageHtml $page)
  InjectAlternates "$($page.idPath)\index.html" "/$($page.idPath)" "/en/$($page.enPath)"
}

$urls = New-Object System.Collections.Generic.List[object]
$urls.Add(@{ path="/"; priority="1.0" })
$urls.Add(@{ path="/en"; priority="0.9" })
foreach ($key in $Parents.Keys) {
  $urls.Add(@{ path="/$key"; priority="0.9" })
  $urls.Add(@{ path="/en/$($Parents[$key].enPath)"; priority="0.82" })
}
foreach ($page in $Pages) {
  $urls.Add(@{ path="/$($page.idPath)"; priority="0.72" })
  $urls.Add(@{ path="/en/$($page.enPath)"; priority="0.64" })
}

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

WriteUtf8 (Join-Path $Root "sitemap.xml") @"
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
$urlXml
</urlset>
"@

Write-Host "Generated English homepage, $($Parents.Count) hub pages, and $($Pages.Count) service pages."
