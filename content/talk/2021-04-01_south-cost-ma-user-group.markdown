---
title: "Sliding in Style"
author:
  - Garrick Aden-Buie
description: |
  Make stylish slides with {xaringanthemer} and a little bit of CSS.
images:
  - "https://slides.garrickadenbuie.com/extra-great-slides/intro/extra-great-slides.png"
date: '2021-04-01'
slug: sliding-in-style-south-coast-ma
tags:
  - R
  - xaringan
  - xaringanthemer
  - xaringanExtra
  - Slides
  - Presentations
talk_author: [Garrick Aden-Buie]
categories: [ Talk ]
event: "South Coast MA UseR Group"
event_url: https://www.meetup.com/South-Coast-useR-Group/events/277235768/
location: Virtual Presentation
talk_code_url: https://github.com/gadenbuie/slides/tree/gh-pages/sliding-in-style
links:
  - icon: chalkboard-teacher
    icon_pack: fas
    name: Slides
    url: https://slides.garrickadenbuie.com/sliding-in-style
---

<script src="/rmarkdown-libs/fitvids-2.1.1/fitvids.min.js"></script>
<div class="shareagain" style="min-width:300px;margin:1em auto;">
<iframe src="https://slides.garrickadenbuie.com/sliding-in-style" width="1600" height="900" style="border:2px solid currentColor;" loading="lazy" allowfullscreen></iframe>
<script>fitvids('.shareagain', {players: 'iframe'});</script>
</div>

## Abstract

The [xaringan](https://slides.yihui.org/xaringan/) package by YiHui Xie lets R users and R Markdown authors easily
blend data, text, plots and [htmlwidgets](http://www.htmlwidgets.org/) into beautiful HTML presentations
that look great on the web, in print, and on screens.

Together we’ll create a completely customized xaringan slide style with
[xaringanthemer](https://pkg.garrickadenbuie.com/xaringanthemer), a package that lets you quickly create a complete slide
theme from only a few color choices. Then we’ll talk about how you can take
your slide design one step further with just a little bit of CSS.

## Packages

-   [xaringan](https://slides.yihui.org/xaringan/)
-   [xaringanthemer](https://pkg.garrickadenbuie.com/xaringanthemer)
-   [xaringanExtra](https://pkg.garrickadenbuie.com/xaringanExtra)
-   [lorem](https://github.com/gadenbuie/lorem)

``` r
# On CRAN
install.packages("xaringan")
install.packages("xaringanthemer", dependencies = TRUE)

# From GitHub
# install.packages("remotes")
remotes::install_github("gadenbuie/xaringanExtra")
remotes::install_github("gadenbuie/lorem")
```

If you use \[docker\], you can get set up with an \[environment for this presentation\]\[docker-image\] with:

``` bash
docker run -d --rm -p 8787:8787 -e DISABLE_AUTH=true grrrck/sliding-in-style
```
