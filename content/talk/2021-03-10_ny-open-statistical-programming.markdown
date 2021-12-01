---
title: "Making Extra Great Slides"
subtitle: With xaringan, xaringanthemer, and xaringanExtra
author:
  - Garrick Aden-Buie
description: |
  A brief introduction to the {xaringan} package and how you can make your
  slides look great with {xaringanthemer} and stand out with {xaringanExtra}.
images:
  - "https://slides.garrickadenbuie.com/extra-great-slides/intro/extra-great-slides.png"
date: '2021-03-10'
slug: extra-great-slides-nyhackr
tags:
  - R
  - xaringan
  - xaringanthemer
  - xaringanExtra
  - Slides
  - Presentations
talk_author: [Garrick Aden-Buie]
talk_type: Talk
event: "New York Open Statistical Programming Meetup"
event_url: https://www.meetup.com/nyhackr/events/276573540
location: Virtual Presentation
talk_code_url: https://github.com/gadenbuie/slides/tree/gh-pages/extra-great-slides
talk_slides_url: https://slides.garrickadenbuie.com/extra-great-slides/intro/
talk_recording_url: https://youtu.be/FHy6NseH8yk
---

<script src="/rmarkdown-libs/fitvids-2.1.1/fitvids.min.js"></script>
<div class="shareagain" style="min-width:300px;margin:1em auto;">
<iframe src="https://slides.garrickadenbuie.com/extra-great-slides/intro/" width="1600" height="900" style="border:2px solid currentColor;" loading="lazy" allowfullscreen></iframe>
<script>fitvids('.shareagain', {players: 'iframe'});</script>
</div>

## Abstract

The [xaringan](https://slides.yihui.org/xaringan/) package by YiHui Xie lets R users and R Markdown authors easily blend data, text, plots and [htmlwidgets](http://www.htmlwidgets.org/) into beautiful HTML presentations that look great on the web, in print, and on screens.

In addition to demonstrating how to go from R Markdown to web-based slides with xaringan, in this talk I’ll show you how to completely customize the appearance of your slides with [xaringanthemer](https://pkg.garrickadenbuie.com/xaringanthemer), a package that lets you quickly create a complete slide theme from only a few color choices.

Then we’ll go beyond appearances with a variety of addins and extensions from the [xaringanExtra](https://pkg.garrickadenbuie.com/xaringanExtra) package, including: a tiled slide overview, editable slides, embedded webcam videos, tabbed panels, extra styles, shareable and embeddable slides, animations, and real time slide broadcasting.

## Packages

-   [xaringan](https://slides.yihui.org/xaringan/)
-   [xaringanthemer](https://pkg.garrickadenbuie.com/xaringanthemer)
-   [xaringanExtra](https://pkg.garrickadenbuie.com/xaringanExtra)
-   [xaringanBuilder](https://github.com/jhelvy/xaringanBuilder)
-   [metathis](https://pkg.garrickadenbuie.com/metathis)

``` r
# On CRAN
install.packages("xaringan")
install.packages("xaringanthemer")
install.packages("metathis")

# From GitHub
# install.packages("remotes")
remotes::install_github("gadenbuie/xaringanExtra")
remotes::install_github("jhelvy/xaringanBuilder")
remotes::install_github("gadenbuie/countdown")
```
