/* globals Tidy, gridjs, searchNextGuess, summarizeGuesses */

function makeLetter (value = '_', index = 0, state) {
  const el = document.createElement('div')
  el.classList = 'letter-wrapper'

  const letter = document.createElement('div')
  letter.classList = 'letter letter-large'
  letter.innerText = value

  el.appendChild(letter)

  const letterAction = document.createElement('div')
  letterAction.classList = 'letter-action'
  el.appendChild(letterAction)

  if (value === '_' && (!state || state === '_')) {
    return el
  }

  const resultClass = {
    '+': 'correct',
    '-': 'present',
    '.': 'absent'
  }

  letter.classList.add(resultClass[state])

  const ordinal = ['first', 'second', 'third', 'fourth', 'fifth']

  ;['absent', 'present', 'correct'].forEach(c => {
    const btn = document.createElement('button')
    btn.classList = 'btn-letter-action ' + c
    btn.title = c.charAt(0).toUpperCase() + c.slice(1)
    btn.setAttribute('aria-label', `Set ${ordinal[index]} letter ${value.toUpperCase()} ${c}`)
    btn.dataset.action = c
    letterAction.appendChild(btn)
  })

  return el
}

function fillWord (word) {
  word = word || '_____'
  word = word.slice(0, 5).split('')
  while (word.length < 5) {
    word.push('_')
  }
  return word
}

function makeWordRow (word, state) {
  word = fillWord(word)
  state = fillWord(state)

  const row = document.createElement('div')
  row.classList = 'wordle-row'

  word
    .map((l, idx) => makeLetter(l, idx, state[idx]))
    .forEach(l => row.appendChild(l))

  return row
}

function btnUpdateLetter (btn) {
  const letter = btn.closest('.letter-wrapper').querySelector('.letter')
  const newClass = btn.dataset.action
  const hasNewClass = letter.classList.contains(newClass)

  letter.classList.remove('present', 'absent', 'correct')
  if (!hasNewClass) {
    letter.classList.add(newClass)
  }
}

function getWords (wordle) {
  wordle = wordle || document.getElementById('wordle')
  return wordle.querySelector('textarea').value
    .split(/\r\n|\n/)
    .map(w => w.toLowerCase())
}

function renderWords (wordle) {
  const words = getWords(wordle)

  // clear current guesses
  while (wordle.querySelector('.wordle-row')) {
    wordle.removeChild(wordle.querySelector('.wordle-row'))
  }

  if (wordle.state && wordle.state.guesses.length) {
    const { guesses, results } = wordle.state
    for (let i = 0; i < guesses.length; i++) {
      const row = makeWordRow(guesses[i], results[i])
      wordle.appendChild(row)
    }
  } else {
    words.forEach(function (word) {
      const row = makeWordRow(word)
      wordle.appendChild(row)
    })
  }
}

function isAlphaKeyCode (keyCode) {
  const isAlphaUpper = keyCode >= 65 && keyCode <= 90
  const isAlphaLower = keyCode >= 97 && keyCode <= 122

  return isAlphaUpper || isAlphaLower
}

function updateGuesses (wordle) {
  wordle = wordle || document.getElementById('wordle')

  const guesses = getWords(wordle)

  const results = [...wordle.querySelectorAll('.wordle-row')]
    .map(row => [...row.querySelectorAll('.letter')]
      .map(l => {
        if (l.matches('.correct')) return '+'
        if (l.matches('.present')) return '-'
        if (l.matches('.absent')) return '.'
        return ''
      })
      .reduce((x, y) => x + y, ''))

  wordle.state = { guesses, results }

  if (
    guesses.some(g => g.length !== 5) ||
    guesses.some(g => g.includes('_')) ||
    results.some(r => r.length !== 5)
  ) {
    return
  }

  const abc = 'abcdefghijklmnopqrstuvwxyz'.split('')

  const nextGuess = searchNextGuess(wordle.state)
    .sort((x, y) => y.score - x.score)
  wordle.table.updateConfig({ data: nextGuess }).forceRender()

  let { pattern, keep, discard } = summarizeGuesses({ guesses, results })
  const knownLetters = [...keep, ...discard]
  const remainingLetters = uniqueLetters(nextGuess, knownLetters)
  const accountedLetters = [...knownLetters, ...Object.keys(remainingLetters)]
  const impossibleLetters = abc.filter(l => !accountedLetters.includes(l))

  keep = Tidy.distinct()(keep)
    .sort((x, y) => x > y)
    .map(l => `<code>${l}</code>`)
    .join(' ')
  discard = Tidy.distinct()([...discard, ...impossibleLetters])
    .sort((x, y) => x > y)
    .map(l => `<code${impossibleLetters.includes(l) ? ' style="opacity:0.6"' : ''}>${l}</code>`)
    .join(' ')

  const stats = document.getElementById('words-stats')
  stats.innerHTML = `<p>
    <strong>${nextGuess.length.toLocaleString()}</strong> word choices</p>
  <table class="table table-sm">
    <tr><td class="fw-bold pe-3" align="left">Pattern</td><td align="left"><code>${pattern}</code></td></tr>
    <tr><td class="fw-bold pe-3" align="left">Yes</td><td align="left">${keep}</td></tr>
    <tr><td class="fw-bold pe-3" align="left">No</td><td align="left">${discard}</td></tr>
    <tr><td class="fw-bold pe-3" align="left">Maybe</td><td align="left">${describeUniqueLetters(remainingLetters)}</td></tr>
  </table>`

  return wordle.state
}

function uniqueLetters (words, exclude) {
  const letters = words
    .map(x => x.word)
    .reduce((x, y) => x + y)
    .split('')
    .filter(l => !exclude.includes(l))
    .reduce((x, y) => {
      x[y] = x[y] ? x[y] + 1 : 1
      return x
    }, {})

  return letters
}

function describeUniqueLetters (letters) {
  return Object.keys(letters)
    .map(x => ({ letter: x, count: letters[x] }))
    .sort((x, y) => x.count < y.count)
    .map(l => `<code title="${l.count} times">${l.letter}</code>`)
    .join(' ')
}

function updateLetterFocus () {
  const letters = Array.from(wordle.querySelectorAll('.letter'))
  const letterEmpty = letters.filter(l => l.innerText === '_')
  if (letterEmpty.length) {
    letterEmpty[0].classList.add('letter-focus')
  } else {
    letters[letters.length - 1].classList.add('letter-focus')
  }
}

function removeLetterFocus () {
  wordle.querySelector('.letter-focus').classList.remove('letter-focus')
}

const wordle = document.getElementById('wordle')
wordle.state = { guesses: [], results: [] }
renderWords(wordle)

if (window.wordsScored) {
  wordle.table = new gridjs.Grid({
    data: window.wordsScored.sort((x, y) => y.score - x.score),
    columns: [
      { id: 'word', name: 'Word' },
      { id: 'score', name: 'Score (Entropy)' },
      { id: 'score_pos', name: 'Score (Position)' }
    ],
    sort: true,
    pagination: {
      enabled: true,
      limit: 10,
      summary: false,
      nextButton: true,
      prevButton: true
    }
  })
  wordle.table.render(document.getElementById('words-table'))
  document.getElementById('words-stats').innerHTML = `<p><strong>${window.wordsScored.length.toLocaleString()}</strong> word choices`
}

wordle.addEventListener('click', function (ev) {
  if (ev.target.matches('.btn-letter-action')) {
    btnUpdateLetter(ev.target)
    updateGuesses(wordle)
    return
  }

  if (ev.target.matches('.letter')) {
    wordle.querySelector('textarea').focus()
  }
})

wordle
  .querySelector('textarea')
  .addEventListener('keydown', function (ev) {
    const lines = ev.target.value.split(/\r\n|\n/)
    const lastWord = lines[lines.length - 1]

    if (['Tab', 'Backspace'].includes(ev.key)) {
      return
    }

    if (ev.key === 'Enter' && lines.length < 6 && lastWord.length === 5) {
      return
    }

    if (isAlphaKeyCode(ev.keyCode) && lastWord.length < 5) {
      return
    }

    // disallow all other input
    ev.stopPropagation()
    ev.preventDefault()
  })

wordle
  .querySelector('textarea')
  .addEventListener('keyup', function (ev) {
    updateGuesses(wordle)
    renderWords(wordle)
    updateLetterFocus()
  })

wordle
  .querySelector('textarea')
  .addEventListener('focus', updateLetterFocus)

wordle
  .querySelector('textarea')
  .addEventListener('blur', removeLetterFocus)
