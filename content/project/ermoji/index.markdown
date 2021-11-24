---
title: ":joy:   ermoji"
description: "RStudio Addin to Search and Copy Emoji"
summary: "RStudio Addin to Search and Copy Emoji"
date: '2018-04-24'
slug: ermoji
images: 
  - /images/project/ermoji/example-browse.png
tags:
  - RStudio
  - Addin
  - emoji
links:
- icon: door-open # icon name without the 'fa-'
  icon_pack: fas
  name: website
  url: https://allisonhorst.github.io/palmerpenguins/
- icon: github # icon name without the 'fa-'
  icon_pack: fab
  name: code
  url: https://github.com/allisonhorst/palmerpenguins/
- icon: newspaper # icon name without the 'fa-'
  icon_pack: far
  name: Blog post
  url: https://education.rstudio.com/blog/2020/07/palmerpenguins-cran/
---

[ermoji-src]: https://github.com/gadenbuie/ermoji
[emo]: https://github.com/hadley/emo
[DT]: https://rstudio.github.io/DT
[clipr]: https://github.com/mdlincoln/clipr
[devtools]: https://github.com/r-lib/devtools
[miniUI]: http://shiny.rstudio.com/articles/gadget-ui.html
[addinlist]: https://github.com/daattali/addinslist

**Project Links:** [source][ermoji-src], [installation](#installation), [screenshots](#usage)

<!-- https://buttons.github.io/ -->
<a class="github-button" href="https://github.com/gadenbuie" data-show-count="true" aria-label="Follow @gadenbuie on GitHub">Follow @gadenbuie</a>&nbsp;
<a class="github-button" href="https://github.com/gadenbuie/ermoji" data-icon="octicon-star" data-show-count="true" aria-label="Star gadenbuie/ermoji on GitHub">Star</a>&nbsp;
<a class="github-button" href="https://github.com/gadenbuie/ermoji/fork" data-icon="octicon-repo-forked" data-show-count="true" aria-label="Fork gadenbuie/ermoji on GitHub">Fork</a>

Search, find and copy emojis inside RStudio.
Basically a [DT] + [clipr] + [miniUI] wrapper around [hadley/emo][emo].

**Why?** Because 🤓. But also because I wanted an easy way to find the Unicode strings for emoji.

## Installation

Install **ermoji** with [devtools]

``` r
devtools::install_github("gadenbuie/ermoji")
```

Or install using Dean Attali's [addinlist].

## Usage

Open *Search and Copy Emoji* from the RStudio Addins dropdown.

<img src="/images/project/ermoji/addins-list.png" width="200px">

Pick your emoji and use the "Copy" buttons to copy the emoji to your clipboard.

### Browse the Emoji List

<img src="/images/project/ermoji/example-browse.png" width="400px" style="border: solid 1px black">

### Search for Emoji

You can use regular expressions to search for any text in the table of emoji.

<img src="/images/project/ermoji/example-global-search.png" width="400px" style="border: solid 1px black">

### Search *by Emoji*

You can even search *by emoji* by pasting your emoji into the search field.

<img src="/images/project/ermoji/example-emoji-search.png" width="400px" style="border: solid 1px black">

### Search in Specific Columns

Search inside individual columns for more specific emoji finding.

<img src="/images/project/ermoji/example-column-search.png" width="400px" style="border: solid 1px black">

***

**ermoji** was built by [Garrick Aden-Buie](https://www.garrickadenbuie.com) ([&commat;grrrck](https://twitter.com/grrrck)).

Built on the shoulders of giants. Thanks to Hadley Wickham for [emo], Yihui Xie and RStudio for [DT], Matthew Lincoln for [clipr]. Thanks to [r-lib](https://github.com/r-lib) for `devtools` and `usethis` — from idea to package in 60 minutes.

Find more great RStudio addins on the [addinlist], like my other addin [regexplain](https://github.com/gadenbuie/regexplain).

Feel free to [file an issue](https://github.com/gadenbuie/ermoji/issues) if you find a bug or have a theme suggestion -- or better yet, submit a pull request!
