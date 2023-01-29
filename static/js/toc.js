document.addEventListener('DOMContentLoaded', function() {
  function createTocList (el, selectors) {
    selectors = selectors || ['.section.level2', '.section.level3']
    if (!Array.isArray(selectors)) {
      selectors = [selectors]
    }
    var els = el.querySelectorAll(selectors[0])
    if (els.length < 1) return ''
    var toc = `<ul>`
    els.forEach(function(el) {
      toc += `<li><a href="#${el.id}">${el.firstElementChild.textContent}</a>`
      if (selectors.length > 1) {
        toc += createTocList(el, selectors.slice(1))
      }
      toc += '</li>'
    })
    return toc + `</ul>`
  }
  
  const main = document.querySelector('main')
  const toc = document.createElement('nav')
  toc.classList = 'table-of-contents'
  toc.setAttribute('role', "navigation")
  toc.innerHTML = createTocList(main)
  main.insertBefore(toc, main.firstElementChild)
})
