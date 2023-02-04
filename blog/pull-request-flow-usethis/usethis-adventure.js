(function () {
  // check for interactive query param
  const urlParams = new URLSearchParams(window.location.search)
  const isInteractive = (urlParams.get('interactive') || 1) == 1
  const introOptions = document.getElementById('intro-options')

  if (!isInteractive) {
    document.querySelector('main.content').classList.add('non-interactive')
    introOptions.innerHTML += '<li><p>Yes, but I\'d like you to <a href="index.html?interactive=1#intro">walk me through my adventure</a>.</p></li>'
    return
  }

  document.getElementById('instructions').innerText = 'It\'s a little bit unusual, but don\'t worry, I\'ll walk you through it.'

  introOptions.innerHTML = `<li><p>Yes, <a href="#get-started" data-step-id="get-started">walk me through my adventure</a>.</p></li>
    <li><p>Yes, but I'd prefer to <a href="index.html?interactive=0#intro">read and navigate on my own</a>.</p></li>`


  // Remove full url from internal decision links (thanks quarto)
  document.querySelectorAll('.decision a').forEach(l => {
    l.dataset.stepId = l.getAttribute('href').replace(/^.*#/, '')
  })

  const story = document.getElementById('story')
  const staging = document.getElementById('step-list')
  const steps = {}
  const currentStory = []

  Array.from(document.querySelectorAll('.step.level3'))
    .forEach(function (step) {
      staging.appendChild(step)
      steps[step.id] = step
    })
  Array.from(document.querySelectorAll('.step.level2'))
    .forEach(function (step) {
      staging.appendChild(step)
      steps[step.id] = step
    })

  function updateURL (replace) {
    replace = replace || false
    const state = {
      interactive: isInteractive ? 1 : 0,
      steps: getCurrentStoryStepIds()
    }
    const params = new URLSearchParams({
      interactive: state.interactive,
      steps: state.steps.join(',')
    })
    const stepId = steps.length ? steps[steps.length - 1] : ''
    let loc = window.location.pathname
    loc += params ? `?${params}` : ''
    loc += stepId ? `#${stepId}` : ''
    replace
      ? window.history.replaceState(state, '', loc)
      : window.history.pushState(state, '', loc)

    return loc
  }

  function scrollToLast (x) {
    if (!x && !x.length) {
      return
    }
    const last = x[x.length - 1]
    // console.log(`Scrolling to element #${last.id}`)
    setTimeout(function () {
      last.scrollIntoView({ block: 'start', inline: 'nearest', behavior: 'smooth' })
    }, 100)
    return last
  }

  function getCurrentStoryStepIds () {
    return currentStory.map(el => el.id)
  }

  function getAllStepIds () {
    return Object.keys(steps)
  }

  function isValidStep (stepId) {
    return !!(getAllStepIds().includes(stepId) &&
      steps[stepId])
  }

  function isStepInStory (stepId) {
    return getCurrentStoryStepIds().includes(stepId)
  }

  function addStep (stepId) {
    const newStep = steps[stepId].cloneNode(true)
    newStep.classList.add('fade-in')
    currentStory.push(newStep)
    story.appendChild(newStep)
    return newStep
  }

  function walkForward (stepId, doUpdateURL) {
    if (typeof doUpdateURL === 'undefined') {
      doUpdateURL = true
    }

    if (currentStory.length) {
      markDecision(currentStory[currentStory.length - 1], stepId)
    } else {
      // assume we're at the intro
      markDecision(document.getElementById('intro'), stepId)
    }

    const newStep = addStep(stepId)
    newStep.scrollIntoView({ behavior: 'smooth' })
    setTimeout(() => newStep.classList.remove('fade-in'), 1100)
    if (doUpdateURL) {
      updateURL()
    }
    return newStep
  }

  function walkBackward (stepId, doUpdateURL) {
    if (typeof doUpdateURL === 'undefined') {
      doUpdateURL = true
    }

    // clears steps between target and current step
    const idxNext = getCurrentStoryStepIds().indexOf(stepId)
    while (currentStory.length - 1 > idxNext) {
      const lastStep = currentStory.pop()
      lastStep.classList.add('fade-out-bck')
      setTimeout(() => lastStep.remove(), 1100)
    }
    if (doUpdateURL) {
      updateURL()
    }
    scrollToLast(currentStory)
    const newLastStep = currentStory[currentStory.length - 1]
    unmarkDecision(newLastStep)
    return newLastStep
  }

  function resetStory () {
    while (story.firstElementChild) {
      story.removeChild(story.firstChild)
    }
    while (currentStory.length) {
      currentStory.pop()
    }
    updateURL()
    const intro = document.getElementById('intro')
    unmarkDecision(intro)
    intro.scrollIntoView({ behavior: 'smooth' })
  }

  function markDecision (step, stepId) {
    const link = step.querySelector(`.decision a[data-step-id="${stepId}"]`)
    const decisionList = step.querySelector('.decision')
    link.classList.add('picked')
    decisionList.classList.add('decided')
    let choices = decisionList.querySelectorAll('a:not(.picked)')
    choices = Array.from(choices)
    choices.forEach(function (link) {
      const span = document.createElement('span')
      span.classList = 'path-untaken'
      span.dataset.href = link.getAttribute('href')
      span.dataset.stepId = link.dataset.stepId
      span.dataset.classes = Array.from(link.classList).join(' ')
      span.innerHTML = link.innerHTML
      link.insertAdjacentElement('afterend', span)
      link.parentElement.removeChild(link)
    })
  }

  function unmarkDecision (step) {
    const decisionList = step.querySelector('.decision.decided')
    decisionList.classList.remove('decided')
    let choices = decisionList.querySelectorAll(['a.picked', 'span.path-untaken'])
    choices = Array.from(choices)
    choices.forEach(function (el) {
      if (el.matches('a.picked')) {
        el.classList.remove('picked')
        return
      }
      const link = document.createElement('a')
      link.classList = el.dataset.classes
      link.href = el.dataset.href
      link.dataset.stepId = el.dataset.stepId
      link.innerHTML = el.innerHTML
      el.insertAdjacentElement('afterend', link)
      el.parentElement.removeChild(el)
    })
  }

  // Restore steps from URL
  let initSteps = new URLSearchParams(window.location.search).get('steps')
  if (initSteps) {
    initSteps = initSteps.split(',').filter(isValidStep).map(walkForward)
    setTimeout(
      () => scrollToLast(initSteps),
      1000
    )
  }
  updateURL(true)

  // Handle back button
  window.addEventListener('popstate', function (ev) {
    if (ev.state && ev.state.steps) {
      if (ev.state.steps.length === 0) {
        resetStory()
      } else if (ev.state.steps.length < currentStory.length) {
        // Go back to the previous last step
        walkBackward(ev.state.steps.pop(), false)
      } else if (ev.state.steps.length > currentStory.length) {
        // Moving forward might jump forward a bunch of steps
        const newSteps =
          ev.state.steps
            .slice(currentStory.length)
            .map((stepId) => walkForward(stepId, false))
        scrollToLast(newSteps)
      }
    }
  })

  // Watch decision link clicks
  document
    .querySelector('main.content')
    .addEventListener('click', function (ev) {
      if (ev.target.tagName !== 'A') {
        return
      }

      const stepId = ev.target.dataset.stepId

      if (stepId === 'intro' && currentStory.length) {
        resetStory()
        return
      }

      if (!isValidStep(stepId)) {
        // console.log(`Unknown step id #${stepId}, treating like a normal link`)
        return
      }

      if (!isStepInStory(stepId)) {
        ev.preventDefault()
        walkForward(stepId)
      } else {
        ev.preventDefault()
        walkBackward(stepId)
      }
    })

  // remove the toc sidebar since it doesn't make sense here
  // function removeTOC () {
  //   const toc = document.querySelector('.table-of-contents')
  //   if (toc) {
  //     toc.remove()
  //   } else {
  //     setTimeout(removeTOC, 10)
  //   }
  // }
  // document.addEventListener('DOMContentLoaded', removeTOC)

  // debugging
  // Array.from(document.querySelectorAll('.section.step'))
  //   .forEach(function(el) {
  //     el.querySelector(['h2', 'h3']).innerHTML += `<br/><code style="background:none;font-size:0.66em">#${el.id}</code>`
  //   })
})()
