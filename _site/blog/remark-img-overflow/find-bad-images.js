function get_slide_size() {
  // Find the first visible slide in the deck
  const visible_slide = document
    .querySelector('.remark-visible .remark-slide-scaler')

  // and inspect it's width and height
  // knowing that remark will set these values
  const {width, height} = visible_slide.style

  return {
    width: parseInt(width),
    height: parseInt(height)
  }
}


get_slide_size()


function is_element_clipped(el) {
  const { top, left, bottom, right  } = el.getBoundingClientRect()
  return top < 0 ||
    left < 0 ||
    right > window.innerWidth ||
    bottom > window.innerHeight
}

document
  .querySelectorAll('.remark-slides-area .remark-slide-container')
  .forEach(slide => slide.classList.add('remark-visible'))

function clipped_img_info(el) {
    // If you're looking at the slides in the browser,
    // this will logged the clipped images in the console.
    console.log("clipped image", el)

    return {
      img_tag: el.tagName,
      img_src: /^data:/.test(el.src) ? el.src.slice(0, 32) : el.src,
      img_class: el.classList.toString(),
      slide_heading: el.closest('.remark-slide')
        .querySelector('h1, h2, h3, h4, h5, h6')
        ?.innerText,
      slide_text: el.closest('.remark-slide').innerText,
    }
  }

document
  .querySelectorAll(
    '.remark-slides-area .remark-slide :is(img, svg)'
  )
  .filter(is_element_clipped)
  .map(clipped_img_info)
