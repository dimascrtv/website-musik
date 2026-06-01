(function () {
  const sourceUrl = new URL('../index.html', window.location.href);
  const assetPrefix = window.location.protocol === 'file:' ? '../' : '/';

  const normalizeText = (value) => (value || '')
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/\b(i)\b/g, ' 1 ')
    .replace(/\b(ii)\b/g, ' 2 ')
    .replace(/\b(iii)\b/g, ' 3 ')
    .replace(/\b(iv)\b/g, ' 4 ')
    .replace(/\b(v)\b/g, ' 5 ')
    .replace(/[^a-z0-9]+/g, ' ')
    .trim();

  const levenshtein = (a, b) => {
    if (a === b) return 0;
    if (!a.length) return b.length;
    if (!b.length) return a.length;

    const row = Array.from({ length: b.length + 1 }, (_, index) => index);

    for (let i = 1; i <= a.length; i += 1) {
      let previous = row[0];
      row[0] = i;

      for (let j = 1; j <= b.length; j += 1) {
        const temp = row[j];
        const cost = a[i - 1] === b[j - 1] ? 0 : 1;
        row[j] = Math.min(
          row[j] + 1,
          row[j - 1] + 1,
          previous + cost
        );
        previous = temp;
      }
    }

    return row[b.length];
  };

  const isCloseMatch = (queryWord, targetWord) => {
    if (!queryWord || !targetWord) return false;
    if (targetWord.includes(queryWord) || queryWord.includes(targetWord)) return true;

    const distance = levenshtein(queryWord, targetWord);
    const limit = queryWord.length <= 4 ? 1 : Math.max(2, Math.floor(queryWord.length * 0.34));
    return distance <= limit;
  };

  const matchesQuery = (query, haystack) => {
    const normalizedQuery = normalizeText(query);
    const normalizedHaystack = normalizeText(haystack);
    const queryWords = normalizedQuery.split(' ').filter(Boolean);
    if (!queryWords.length) return true;
    if (normalizedHaystack.includes(normalizedQuery)) return true;

    const hayWords = normalizedHaystack.split(' ').filter(Boolean);
    return queryWords.every(queryWord => hayWords.some(targetWord => isCloseMatch(queryWord, targetWord)));
  };

  const toAssetUrl = (value) => {
    if (!value) return '';
    if (/^(https?:|data:|blob:|#|\/)/i.test(value)) return value;
    return `${assetPrefix}${value.replace(/^\.\//, '')}`;
  };

  const rewriteCardAssets = (card) => {
    if (card.dataset.pdfSrc) {
      card.dataset.pdfSrc = toAssetUrl(card.dataset.pdfSrc);
    }

    const object = card.querySelector('object[data]');
    if (object) {
      object.setAttribute('data', toAssetUrl(object.getAttribute('data')));
    }
  };

  const setStatus = (status, message, visible = true) => {
    if (!status) return;
    status.textContent = message;
    status.classList.toggle('is-visible', visible);
  };

  window.renderScoreLibrary = async function renderScoreLibrary() {
    const grid = document.querySelector('[data-score-library-grid]');
    if (!grid) return;

    const searchInput = document.querySelector('[data-score-search]');
    const empty = document.querySelector('[data-score-empty]');
    const status = document.querySelector('[data-score-status]');

    setStatus(status, 'Memuat daftar partitur...', true);

    try {
      const response = await fetch(sourceUrl, { cache: 'no-cache' });
      if (!response.ok) throw new Error(`HTTP ${response.status}`);

      const html = await response.text();
      const doc = new DOMParser().parseFromString(html, 'text/html');
      const songs = Array.from(doc.querySelectorAll('#score-gallery .score-song'));
      const cards = [];

      songs.sort((firstSong, secondSong) => Number(secondSong.hasAttribute('data-new-score')) - Number(firstSong.hasAttribute('data-new-score')));

      let newScoreApplied = false;

      songs.forEach(song => {
        const artist = song.querySelector('.score-kicker')?.textContent.trim() || '';
        const title = song.querySelector('.score-title')?.textContent.trim() || '';
        const isNewScoreSong = song.hasAttribute('data-new-score');

        song.querySelectorAll('.score-card[data-pdf-src]').forEach(sourceCard => {
          const card = sourceCard.cloneNode(true);
          const instrument = card.querySelector('.score-card-title')?.textContent.trim() || '';
          const titleEl = card.querySelector('.score-card-title');
          const metaEl = card.querySelector('.score-composer');

          card.querySelector('.score-track-spacer')?.remove();
          rewriteCardAssets(card);

          if (titleEl) titleEl.textContent = `${artist} - ${title}`;
          if (metaEl) metaEl.textContent = instrument;

          card.dataset.searchText = `${artist} ${title} ${instrument} ${card.dataset.pdfTitle || ''} ${card.dataset.pdfSrc || ''}`;
          card.setAttribute('aria-label', `Buka partitur ${artist} - ${title} ${instrument}`);
          if (isNewScoreSong && !newScoreApplied) {
            card.classList.add('is-new-score');
            newScoreApplied = true;
          }
          cards.push(card);
        });
      });

      grid.replaceChildren(...cards);
      setStatus(status, `${cards.length} partitur tersedia.`, true);

      const filterCards = () => {
        const query = searchInput?.value || '';
        let visibleCount = 0;

        cards.forEach(card => {
          const isVisible = matchesQuery(query, card.dataset.searchText);
          card.classList.toggle('is-search-hidden', !isVisible);
          card.hidden = false;
          if (isVisible) visibleCount += 1;
        });

        empty?.classList.toggle('is-visible', visibleCount === 0);
        if (query.trim()) {
          setStatus(status, `${visibleCount} partitur cocok dengan pencarian.`, true);
        } else {
          setStatus(status, `${cards.length} partitur tersedia.`, true);
        }
      };

      searchInput?.addEventListener('input', filterCards);
      filterCards();
    } catch (error) {
      console.log('Daftar partitur gagal dimuat:', error);
      setStatus(status, 'Daftar partitur belum bisa dimuat. Coba buka halaman ini melalui server website.', true);
    }
  };
})();
