---
title: 'xaringan Tip: Add A Logo to All of Your Slides'
author: Garrick Aden-Buie
date: '2019-10-16'
slug: xaringan-tip-logo-all-slides
categories:
  - Blog
tags:
  - R
  - Tips
  - xaringan
  - xaringan Tip
description: Add a logo to all of your xaringan slides without using a background image.
twitterImage: xaringan-logo-all-slides_twitter.png
keywords: [rstats, xaringan, logo, slides, 'logo all slides']
editor_options:
  chunk_output_type: console
---

<!-- Links -->
[xaringan]: https://slides.yihui.name/xaringan
[xaringan-logo]: https://github.com/gadenbuie/xaringan-logo
[xaringan-logo-demo]: https://gadenbuie.github.io/xaringan-logo

Here's a quick tip to help solve a common <span class="pkg">[xaringan]</span> problem: **adding a logo to all of your slides**.

The slightly problematic and somewhat annoying way to solve this problem
is to add a logo to a series of slides using 
remarkjs'
[background-image](https://github.com/gnab/remark/wiki/Markdown#background-image)
and 
[layout syntax](https://github.com/gnab/remark/wiki/Markdown#layout).

```
---
background-image: logo.png
background-position: top right
background-size: 110px 120px
layout: true
---

## This slide has a logo

---

## This one does too

But you can't add a new background image!

---
layout: false

## This one doesn't have a logo :(
```

It works... as long as 
you don't change your slide format 
or if you don't mind repeating those 4 lines 
every time you need to reset your layout.

## A logo for all the slides

<center>
![The xaringan logo appears on all the slides!](xaringan-logo-all-slides.png)

&#x1F4FA; **[Demo Slides][xaringan-logo-demo]**
</center>

Instead, 
with a little bit of JavaScript and CSS, 
we can automatically insert a logo on all the slides in the presentation.
Of course, 
we might not _want_ a logo an all the slides,
so we won't add the logo to the `.title-slide`
or any slide with `class: hide-logo`.

If you just want to jump straight to the solution,
I've created a [template repository on GitHub][xaringan-logo]
that you can use to bootstrap your next set of 
<span class="pkg">xaringan</span> slides.

To set everything up manually takes just a few steps.

1. Download your logo and save it in your slides directory. 
   I've used the <span class="pkg">xaringan</span> hex logo:
   [xaringan.png](https://github.com/rstudio/hex-stickers/blob/master/PNG/xaringan.png).

1. Download 
   [insert-logo.html](https://github.com/gadenbuie/xaringan-logo/blob/master/insert-logo.html) 
   into your slide directory, or [copy the html described below](#inside-insert-logo-html)
   into `insert-logo.html`.

1. Add `insert-logo.html` to your `after_body` includes in your slides' `.Rmd` file.

  ```yaml
  output:
  xaringan::moon_reader:
    includes:
      after_body: insert-logo.html
  ```

1. Edit the `.logo` class in the CSS in `insert-logo.html` to use your logo image,
   and adjust the `width`, `height` 
   and position (`top`, `bottom`, `left`, and/or `right`) 
   as needed.
   
1. Use `class: hide-logo` to hide your logo on individual slides.
   (The title slide is automatically excluded.)
   
1. Have fun looking &#x1F60E; during your presentation!

## Inside insert-logo.html

The `insert-logo.html` file is a simple snippet of CSS and a tiny bit of JavaScript.
The CSS defines the `.logo` class that positions and sizes the logo,
and the JavaScript inserts a `<div>` with `class = "logo"` into each slide.

```html
<style>
.logo {
  background-image: url(xaringan.png);
  background-size: contain;
  background-repeat: no-repeat;
  position: absolute;
  top: 1em;
  right: 1em;
  width: 110px;
  height: 128px;
  z-index: 0;
}
</style>

<script>
document
  .querySelectorAll(
    '.remark-slide-content' +
    ':not(.title-slide)' +
    // add additional classes to exclude here, e.g.
    // ':not(.inverse)' +
    ':not(.hide-logo)'
  )
  .forEach(el => {
    el.innerHTML += '<div class="logo"></div>';
  });
</script>
```

If you'd like to automatically keep the logo off certain slides,
like the `inverse` slides,
you can add additional `:not(.class-to-exclude)` 
to the CSS selector in the `.querySelectorAll()`.
