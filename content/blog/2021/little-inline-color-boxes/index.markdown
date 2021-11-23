---
title: Little Inline Color Boxes
author: Garrick Aden-Buie
date: '2021-03-12'
categories:
  - Blog
tags:
  - R
  - Tips
  - color
  - Web Development
description: Little cirlces with color previews, with R.
rmd_source: 'https://github.com/gadenbuie/garrickadenbuie-com/blob/main/content/blog/2021/little-inline-color-boxes'
keywords: rstats
editor_options:
  chunk_output_type: console
---

<script src="{{< blogdown/postref >}}index_files/clipboard-2.0.6/clipboard.min.js"></script>
<link href="{{< blogdown/postref >}}index_files/xaringanExtra-clipboard-0.2.6/xaringanExtra-clipboard.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/xaringanExtra-clipboard-0.2.6/xaringanExtra-clipboard.js"></script>
<script>window.xaringanExtraClipboard(null, {"button":"Copy Code","success":"Copied!","error":"Press Ctrl+C to Copy"})</script>
<script src="{{< blogdown/postref >}}index_files/twitter-widget-0.0.1/widgets.js"></script>
<style>.color-preview {
  display: inline-block;
  width: 1em;
  height: 1em;
  border-radius: 50%;
  margin: 0 0.33em;
  vertical-align: middle;
  transition: transform 100ms ease-in-out;
}

.color-preview:hover {
  cursor: pointer;
  transform: scale(2);
  transform-origin: 50% 50%;
}</style>
<style>.color-preview {
  display: inline-block;
  width: 1em;
  height: 1em;
  border-radius: 50%;
  margin: 0 0.33em;
  vertical-align: middle;
  transition: transform 100ms ease-in-out;
}

.color-preview:hover {
  cursor: pointer;
  transform: scale(2);
  transform-origin: 50% 50%;
}</style>
<style>.color-preview {
  display: inline-block;
  width: 1em;
  height: 1em;
  border-radius: 50%;
  margin: 0 0.33em;
  vertical-align: middle;
  transition: transform 100ms ease-in-out;
}

.color-preview:hover {
  cursor: pointer;
  transform: scale(2);
  transform-origin: 50% 50%;
}</style>
<style>.color-preview {
  display: inline-block;
  width: 1em;
  height: 1em;
  border-radius: 50%;
  margin: 0 0.33em;
  vertical-align: middle;
  transition: transform 100ms ease-in-out;
}

.color-preview:hover {
  cursor: pointer;
  transform: scale(2);
  transform-origin: 50% 50%;
}</style>
<!-- Links -->
<blockquote class="twitter-tweet" data-width="550" data-lang="en" data-dnt="true" data-theme="light"><p lang="en" dir="ltr">to explain better...i feel like i&#39;ve seen blog posts where someone types a hex code for a colour and it shows it inline, as a little circle??? but obviously google is not helping me rn</p>&mdash; Sharla Gelfand (@sharlagelfand) <a href="https://twitter.com/sharlagelfand/status/1370426706952126465?ref_src=twsrc%5Etfw">March 12, 2021</a></blockquote>

## Color Boxes with R

``` r
color_preview <- function(color) {
  htmltools::tagList(
    htmltools::span(
      class = "color-preview",
      style = paste("background-color:", color),
      .noWS = "outside"
    ),
    htmltools::code(color, .noWS = "outside"),
    color_preview_dep()
  )
}
```

<h4 id="code-cal" class="js-expandmore expand-for-code">
CSS Dependency
</h4>

<div class="js-to_expand">

You’ll need to copy this function too,
and feel free to tweak it if you want.
For example, remove the `border-radius` line to get squares instead of circles.
Or remove the `.color-preview:hover` rule to have static previews.

``` r
color_preview_dep <- function() {
  htmltools::htmlDependency(
    name = "color_preview",
    version = "0.0.1",
    src = ".",
    all_files = FALSE,
    head = "
<style>.color-preview {
  display: inline-block;
  width: 1em;
  height: 1em;
  border-radius: 50%;
  margin: 0 0.33em;
  vertical-align: middle;
  transition: transform 100ms ease-in-out;
}

.color-preview:hover {
  cursor: pointer;
  transform: scale(2);
  transform-origin: 50% 50%;
}</style>"
  )
}
```

</div>

One of my favorite color resources [coolors.co](https://coolors.co).
It gives you a palette of random colors,
like <span class="color-preview" style="background-color: #414073"></span><code>#414073</code> or <span class="color-preview" style="background-color: #70a37F"></span><code>#70a37F</code>.
Press the space bar to get new colors,
or you can lock in colors you like to find new ones that work
with colors you’ve already picked out.

Here’s another color coolors picked for me:

``` r
color_preview("rgb(114, 9, 183)")
```

<span class="color-preview" style="background-color: rgb(114, 9, 183)"></span><code>rgb(114, 9, 183)</code>

You can even find [color palettes](https://coolors.co/palettes/trending),
like [this one](https://coolors.co/ef476f-ffd166-06d6a0-118ab2-073b4c).

<h4 id="code-cal" class="js-expandmore expand-for-code">
R code…
</h4>

<div class="js-to_expand">

``` r
# https://coolors.co/ef476f-ffd166-06d6a0-118ab2-073b4c
colors <- c(
  "#ef476f",
  "#ffd166",
  "#06d6a0",
  "#118ab2",
  "#073b4c"
)

items <- lapply(colors, function(color) {
  htmltools::tags$li(color_preview(color))
})
htmltools::tags$ul(items)
```

</div>

<ul>
<li><span class="color-preview" style="background-color: #ef476f"></span><code>#ef476f</code></li>
<li><span class="color-preview" style="background-color: #ffd166"></span><code>#ffd166</code></li>
<li><span class="color-preview" style="background-color: #06d6a0"></span><code>#06d6a0</code></li>
<li><span class="color-preview" style="background-color: #118ab2"></span><code>#118ab2</code></li>
<li><span class="color-preview" style="background-color: #073b4c"></span><code>#073b4c</code></li>
</ul>
