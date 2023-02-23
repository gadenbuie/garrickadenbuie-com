---
title: "JavaScript for Shiny Users"
author: Garrick Aden-Buie
description: |
  A two-day workshop to get you up and running with JavaScript in Shiny and interactive R Markdown documents.
image: feature.jpg
date: '2020-01-27 9:00:00'
date_end: '2020-01-28 17:00:00'
tags:
  - R
  - JavaScript
  - Shiny
  - HTML
  - CSS
categories: [ Workshop ]
event: "rstudio::conf(2020)"
event_url: https://www.rstudio.com/events/rstudioconf-2020/
location: San Francisco, CA
links:
  - icon: house-door-fill
    name: Website
    url: https://js4shiny.com
  - icon: box-seam
    name: Package
    url: https://pkg.js4shiny.com
  - icon: file-slides-fill
    name: Slides
    url: https://slides.js4shiny.com
  - icon: github
    name: Code
    url: https://github.com/rstudio-conf-2020/js-for-shiny
---

## Abstract

[shiny]: https://shiny.rstudio.com
[rmarkdown]: https://rmarkdown.rstudio.com
[tidyverse]: https://tidyverse.org
[shiny-gallery]: https://shiny.rstudio.com/gallery/

[Shiny] gives users a powerful toolkit to create [interactive web applications][shiny-gallery].
As a result, Shiny users are also web developers!
Inevitably, an intermediate Shiny user will want to create a visualization or user interface
that isn't available in the `shiny` package.
Fortunately,
we can use the building blocks of the web --
JavaScript, HTML, and CSS --
to extend Shiny's capabilities and create engaging Shiny apps.

This two-day, hands-on workshop will introduce Shiny users to JavaScript,
the ubiquitous scripting language that powers the modern web.
We will explore JavaScript's syntax and will discover its functional programming style
to be refreshingly familiar to [tidyverse] R users.
We will learn how to use JavaScript to manipulate HTML and
how Shiny uses JavaScript to communicate between the browser and Shiny server.
Together, we will build an `htmlwidget` and
learn how to incorporate our own or packaged JavaScript code into Shiny apps and [R Markdown] documents,
and how to simultaneously manage JavaScript and R dependencies.

This workshop is for the Shiny user who boldly waded into the
[Customizing Shiny](https://shiny.rstudio.com/articles/#customize)
section of
[RStudio's Shiny Articles](https://shiny.rstudio.com/articles/)
and quickly wished they had more experience with JavaScript.
This user recognizes the benefits of learning JavaScript,
but they are overwhelmed by the sheer number of
packages, tutorials, and StackOverflow questions
that exist in the world about JavaScript, HTML, and CSS.
The goal of this workshop is to meet the Shiny user where they are now
to learn the best parts of JavaScript
that will provide the most value and
facilitate learning and exploration after the workshop.