function makeLetter(value = "_", index = 0) {
  const el = document.createElement('div')
  el.classList = 'letter-wrapper'
  
  const letter = document.createElement('div')
  letter.classList = 'letter letter-large'
  letter.setAttribute('contenteditable', true)
  letter.setAttribute('tabindex', '0')
  letter.innerText = value
  
  el.appendChild(letter)
  
  const letterAction = document.createElement('div')
  letterAction.classList = 'letter-action'
  el.appendChild(letterAction)
  
  const ordinal = ['first', 'second', 'third', 'fourth', 'fifth']
  
  ;['absent', 'present', 'correct'].forEach(c => {
    const btn = document.createElement('button')
    btn.classList = 'btn-letter-action ' + c
    btn.innerHTML = `<span class="clip">${ordinal[index]} letter ${c}</span>`
    btn.dataset.action = c
    letterAction.appendChild(btn)
  })
  
  return el
}

function makeWordRow(word) {
  word = word || '_____'
  word = word.slice(0, 5).split('')
  
  const row = document.createElement('div')
  row.classList = 'wordle-row'
  
  word.map(makeLetter).forEach(l => row.appendChild(l))
  
  const div = document.createElement('div')
  div.classList = 'btn-action'
  const btnAction = document.createElement('button')
  btnAction.classList = 'btn-row-action'
  btnAction.dataset.action = 'add'
  btnAction.innerHTML = '+ <span class="sr-only">Add row</span>'
  div.appendChild(btnAction)
  
  row.appendChild(div)
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

function addWordleRow (wordle, focus = false) {
  wordle = wordle || document.getElementById('wordle')
  
  if (wordle.children.length == 6) {
    console.log("no more guesses left!")
    return
  }
  
  const row = makeWordRow()
  wordle.appendChild(row)
  if (focus) {
    row.querySelector('.letter').focus()
  }
  return row
}

function isAlphaKeyCode (keyCode) {
  const isAlphaUpper = keyCode >= 65 && keyCode <= 90
  const isAlphaLower = keyCode >= 97 && keyCode <= 122
  
  return isAlphaUpper || isAlphaLower
}

function updateGuesses (wordle) {
  wordle = wordle || document.getElementById('wordle')
  
  const guesses = [...wordle.querySelectorAll('.wordle-row')]
    .map(row => [...row.querySelectorAll('.letter')]
    .map(l => l.innerText)
    .reduce((x, y) => x + y, ''))
    .map(w => w.toLowerCase())
    
  const results = [...wordle.querySelectorAll('.wordle-row')]
    .map(row => [...row.querySelectorAll('.letter')]
    .map(l => {
      if (l.matches('.correct')) return '+'
      if (l.matches('.present')) return '-'
      if (l.matches('.absent'))  return '.'
      return ''
    })
    .reduce((x, y) => x + y, ''))
    
  if (
    guesses.some(g => g.length != 5) || 
    guesses.some(g => g.includes('_')) ||
    results.some(r => r.length != 5)
  ) {
    return
  }
  
  wordle.state = {guesses, results}
  const nextGuess = searchNextGuess(wordle.state).sort((x, y) => y.score - x.score)
  wordle.table.updateConfig({data: nextGuess}).forceRender()
  
  return wordle.state
}

const wordle = document.getElementById('wordle')
wordle.state = {guesses: [], results: []}
addWordleRow(wordle)

if (window.wordsScored) {
  wordle.table = new gridjs.Grid({
    data: wordsScored.sort((x, y) => y.score - x.score),
    columns: [
      {id: "word",      name: "Word"},
      {id: "score",     name: "Score (Entropy)"},
      {id: "score_pos", name: "Score (Position)"}
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
  wordle.table.render(document.getElementById("words-table"))
}


wordle.addEventListener('click', function(ev) {
  if (ev.target.matches('.btn-letter-action')) {
    btnUpdateLetter(ev.target)
    updateGuesses(wordle)
    return
  }
  
  if (ev.target.matches('.btn-row-action[data-action="add"]')) {
    ev.target.remove()
    addWordleRow(wordle, true)
    return
  }
})

wordle.addEventListener('keydown', function(ev) {
  if (!ev.target.matches('.letter') || !isAlphaKeyCode(ev.keyCode)) {
    return
  }
  ev.target.innerText = ''
})

// delete letter
wordle.addEventListener('keydown', function(ev) {
  if (!ev.target.matches('.letter') || ev.key !== 'Backspace') {
    return
  }
  
  const wasEmpty = ev.target.innerText === '_'
  
  ev.target.classList.remove('absent', 'present', 'correct')
  
  if (
    !wasEmpty ||
    ev.target.closest('.wordle-row').firstChild == ev.target.parentElement
  ) {
    ev.target.innerText = '_'
    return
  }
  
  const prevLetter = ev.target.parentElement
    .previousElementSibling
    .querySelector('.letter')
  
  prevLetter.innerText = '_'
  prevLetter.focus()
})

// Type new letter
wordle.addEventListener('keyup', function(ev) {
  if (!ev.target.matches('.letter') || !isAlphaKeyCode(ev.keyCode)) {
    return
  }

  ev.target.innerText = ev.key
  updateGuesses(wordle)
  
  const nextLetter = ev.target.parentElement.nextElementSibling
  
  if (nextLetter.matches('.btn-action')) {
    ev.target.closest('.wordle-row').querySelector('.btn-letter-action').focus()
    return
  }
  
  if (!nextLetter.matches('.letter-wrapper')) {
    return
  }
  
  nextLetter.querySelector('.letter').focus()
})
