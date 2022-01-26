function makeLetter(value = "_", index = 0) {
  const el = document.createElement('div')
  el.classList = 'letter-wrapper'
  
  const letter = document.createElement('div')
  letter.classList = 'letter letter-large'
  letter.setAttribute('contenteditable', true)
  letter.setAttribute('tabindex', '0')
  letter.innerText = value
  
  el.appendChild(letter)
  
  const ordinal = ['first', 'second', 'third', 'fourth', 'fifth']
  
  ;['absent', 'present', 'correct'].forEach(c => {
    const btn = document.createElement('button')
    btn.classList = 'btn-letter-action ' + c
    btn.innerHTML = `<span class="sr-only">${ordinal[index]} letter ${c}</span>`
    btn.dataset.action = c
    el.appendChild(btn)
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
  const letter = btn.parentElement.querySelector('.letter')
  const newClass = btn.dataset.action

  letter.classList.remove('present', 'absent', 'correct')
  letter.classList.add(newClass)
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

const wordle = document.getElementById('wordle')
addWordleRow(wordle)

wordle.addEventListener('click', function(ev) {
  if (ev.target.matches('.btn-letter-action')) {
    btnUpdateLetter(ev.target)
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

wordle.addEventListener('keydown', function(ev) {
  if (!ev.target.matches('.letter') || ev.key !== 'Backspace') {
    return
  }
  
  ev.target.innerText = '_'
  if (ev.target.closest('.wordle-row').firstChild == ev.target.parentElement) {
    return
  }
  ev.target.parentElement
    .previousElementSibling
    .querySelector('.letter')
    .focus()
})

wordle.addEventListener('keyup', function(ev) {
  if (!ev.target.matches('.letter') || !isAlphaKeyCode(ev.keyCode)) {
    return
  }

  ev.target.innerText = ev.key
  
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
