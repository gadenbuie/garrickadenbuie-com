---
title: R Colors in CSS for R Markdown HTML Documents
author: Garrick Aden-Buie
date: '2020-09-14'
slug: r-colors-css
categories:
  - Blog
tags:
  - xaringan
  - xaringan Tip
  - CSS
  - R Markdown
  - R
  - Web Development
  - Shiny
  - color
description: Use R's colors in HTML R Markdown documents, slides and Shiny apps with this set of CSS stylesheets.
images:
  - https://www.garrickadenbuie.com/blog/r-colors-css/social-card.png
source_link: https://github.com/gadenbuie/garrickadenbuie-com/blob/main/content/blog/2020/2020-09-12-r-colors-css.Rmarkdown
keywords: rstats
head_custom: |
  <link href="https://pkg.garrickadenbuie.com/r-colors-css/dist/r-colors.css" rel="stylesheet">
  <link href="https://pkg.garrickadenbuie.com/r-colors-css/dist/r-colors.hover.css" rel="stylesheet">
editor_options:
  chunk_output_type: console
references: ~
---

<!-- Links -->

<div class="lead">

A modular collection of CSS stylesheets
that lets you use any of [R’s named colors](https://rdrr.io/r/grDevices/colors.html)
in your
[xaringan](https://slides.yihui.org/xaringan) slides,
[blogdown](https://bookdown.org/yihui/blogdown) pages,
[Shiny](https://shiny.rstudio.com) apps…
in short in any R Markdown HTML documents.

[<i class="fab fa-r-project"></i> pkg.garrickadenbuie.com/r-colors-css](https://pkg.garrickadenbuie.com/r-colors-css)

</div>

## R’s Named Colors

<style type="text/css">
.tu-dotted:not(:hover) {
  text-decoration: underline;
  text-decoration-style: dotted;
}
</style>

R ships with a list of colors with wonderful names,
like <span class="tu-dotted bg-lightgoldenrod3-hover white-hover">lightgoldenrod3</span>
and <span class="tu-dotted bg-firebrick2-hover white-hover">firebrick2</span>.
I don’t know all of the names
and used to turn to an [online list of colors](http://sape.inf.usi.ch/quick-reference/ggplot2/colour)
so often
that I put it on
<a href="r-colors-mug.jpg" data-featherlight="image">a mug</a>.

In R,
you can reference the color by name
in nearly any function that applies to colors.
They’re particularly easy to use in visualizations,
like those made with <span class="pkg">ggplot2</span>,
because there are
657 colors
and many have 4 variations on the same color hue,
indexed by suffixes `1` to `4`.
For example, there are 4 variations of
<span class="tu-dotted bg-palevioletred-hover white-hover">palevioletred</span>
that I’m using in the following plot
for each of 4 years of Austin housing sales data.

``` r
g_austin_housing +
  ## A basic ggplot of home sale prices in Austin
  ## over 4 years, using the ggplot2::txhousing data
  scale_color_manual(
    values = c(
      "palevioletred1",
      "palevioletred2",
      "palevioletred3",
      "palevioletred4",
    )
  )
```

<style type="text/css">
.darkmode-opacity-1 img {
  opacity: 1;
}
p:last-child {
  margin-bottom: 0;
}
</style>

<div class="darkmode-opacity-1">

<img src="/blog/2020/2020-09-12-r-colors-css_files/figure-html/demo-plot-with-colors-1.svg" width="672" />

</div>

## Utility CSS

If you’re used to working with R’s color names,
they unfortunately don’t align with HTML’s
[named colors](https://html-color-codes.info/color-names/),
which means that you can’t write a CSS rule like

``` css
h3.plot-title {
  color: palevioletred1;
}
```

because `palevioletred1` isn’t a valid HTML color.
This causes problems if you
[use an R color name in a function that write CSS files](https://stackoverflow.com/a/63819561).

I’ve also been interested lately in utility CSS frameworks,
like [Tailwinds CSS](https://tailwindcss.com/)
and [Tachyons](http://tachyons.io/).
What’s awesome about these frameworks is that
they use small, single-purpose CSS classes —
called **utility classes** —
that can be flexibly applied to your HTML elements.
I do most, if not all,
of my writing in some variant of markdown,
and utility classes let me build small components
or slightly adjust appearances
without having to write a whole lot of CSS.

Tailwinds looks amazing,
but it requires a moderately complicated build setup,
so I’ve settled on [using Tachyons](https://pkg.garrickadenbuie.com/xaringanExtra/#/tachyons).
In particular,
it integrates nicely with [xaringan](https://slides.yihui.org/xaringan)
and other R Markdown outputs where a complete CSS framework is in use
(like [R Markdown](https://rmarkdown.rstudio.com)
with [bootstrap](https://getbootstrap.com)).
For that reason,
I’ve included it in <span class="pkg">[xaringanExtra](https://pkg.garrickadenbuie.com/xaringanExtra)</span>,
and you can add Tachyons to any R Markdown document with
`xaringanExtra::use_tachyons()`.

Here’s an example of what you can do with utility CSS.
If I want to create a simple box with…

-   a border
    -   on all sides (`.ba`)
    -   that’s gray (`.b--gray`)
    -   with a medium line width (`.bw2`),
-   medium exterior margin (`.ma2`),
-   large interior padding (`.pa4`),
-   and a box shadow (`.shadow-1`)

…I can use those classes on the same element.
Here are four markdown syntax variations that use those classes.

<div class="panelset">

<div class="panel">

<h3 class="panel-name">
xaringan
</h3>

``` markdown
.b--gray.ba.bw2.ma2.pa4.shadow-1[
Talent is a pursued interest.
Anything that you're willing to practice, you can do.

—Bob Ross
]
```

</div>

<div class="panel">

<h3 class="panel-name">
R Markdown
</h3>

``` markdown
::: {.b--gray .ba .bw2 .ma2 .pa4 .shadow-1}
Talent is a pursued interest.
Anything that you're willing to practice, you can do.

—Bob Ross
:::
```

</div>

<div class="panel">

<h3 class="panel-name">
HTML
</h3>

``` html
<div class="b--gray ba bw2 ma2 pa4 shadow-1">
<p>Talent is a pursued interest.
Anything that you're willing to practice, you can do.
</p>
<p>—Bob Ross</p>
</div>
```

</div>

<div class="panel">

<h3 class="panel-name">
htmltools (R)
</h3>

``` r
htmltools::div(
  class = "b--gray ba bw2 ma2 pa4 shadow-1",
  htmltools::p(
    "Talent is a pursued interest.",
    "Anything that you're willing to practice, you can do.",
  ),
  htmltools::p("—Bob Ross")
)
```

</div>

<div class="panel">

<h3 class="panel-name">
CSS
</h3>

*Note: this isn’t the exact CSS from Tachyons, but it’s very similar.*

``` css
.b--gray {
  border-color: #888888;
}
.ba {
  border-style: solid;
}
.bw2 {
  border-width: .25em;
}
.ma2 {
  margin: 1.5em;
}
.pa4 {
  padding: 2em;
}
.shadow-1 {
  box-shadow: 4px 4px 8px 0 rgba(0,0,0,.2);
}
```

<style type="text/css">
.b--gray {
  border-color: #888888;
}
.ba {
  border-style: solid;
}
.bw2 {
  border-width: .25em;
}
.ma2 {
  margin: 1.5em;
}
.pa4 {
  padding: 2em;
}
.shadow-1 {
  box-shadow: 4px 4px 8px 0 rgba(0,0,0,.2);
}
</style>

</div>

</div>

<div class="b--gray ba bw2 ma2 pa4 shadow-1">

Talent is a pursued interest.
Anything that you’re willing to practice, you can do.

—Bob Ross

</div>

## R Colors in CSS

Wouldn’t it be great to have utility CSS classes
that you could use in [xaringan](https://slides.yihui.org/xaringan) slides
and other R Markdown outputs?

> [@grrrck](https://twitter.com/grrrck) First of
> all, I 😻 \`xaringanExtra\`!  
>   
> I am looking at the tachyons colors and can't help but think that the
> palette is rather limited. <https://t.co/0BUPGnkrb4>  
>   
> Is there a way to intercept a tachyon with a named R color and
> generate a proper css with the correct hex code?
>
> — Deemah 🇺🇦 🇳🇴 🇸🇪 (@dmi3k) [September 10,
> 2020](https://twitter.com/dmi3k/status/1303993734003077120)

I thought this was a great idea,
so I put together a set of stylesheets
with all of R’s named colors as CSS classes.
You can choose any or all of the three stylesheets,
depending on your needs,
they each work independently.

1.  [r-colors.css](https://pkg.garrickadenbuie.com/r-colors-css/dist/r-colors.css)
    Classes for setting **foreground** and **background** colors
    -   `.palevioletred1` sets the foreground color
    -   `.bg-palevioletred1` sets the background color
2.  [r-colors.hover.css](https://pkg.garrickadenbuie.com/r-colors-css/dist/r-colors.hover.css)
    Classes for setting foreground and background colors **on hover**
    -   `.palevioletred1-hover` sets the foreground color on hover
    -   `.bg-palevioletred1-hover` sets the background color on hover
3.  [r-colors.vars.css](https://pkg.garrickadenbuie.com/r-colors-css/dist/r-colors.vars.css)
    [CSS variables]() for each color name
    -   `var(--palevioletred1)` for use in other CSS properties

For more on how to use the stylesheets,
including a searchable table with all of the colors
and an interactive color preview,
[check out the documentation page](https://pkg.garrickadenbuie.com/r-colors-css).

As an example,
let’s update the box example above with some color from R.
I used the [color picker table in the documentation](https://pkg.garrickadenbuie.com/r-colors-css)
to pick out an interesting color combination.

<div class="panelset">

<div class="panel">

<h3 class="panel-name">
CSS
</h3>

I used the CSS variables stylesheet to add a new CSS rule
in addition to the CSS in the example above.
This class sets the border color for the box to
<span class="bg-paleturquoise4-hover white-hover tu-dotted">paleturquoise4</span>.

<style type="text/css">
:root {
  /* to avoid clashes with other classes, just using this variable */
  --paleturquoise4: rgb(102,139,139);
}
</style>

``` css
.b--paleturquoise4 {
  border-color: var(--paleturquoise4);
}
```

<style type="text/css">
.b--paleturquoise4 {
  border-color: var(--paleturquoise4);
}
</style>

The other colors used are
<span class="bg-steelblue4-hover white-hover tu-dotted">steelblue4</span> (text),
<span class="bg-mintcream-hover tu-dotted">mintcream</span> (background),
and
<span class="bg-mediumvioletred-hover white-hover tu-dotted">mediumvioletred</span>
(text on hover, from the hover classes stylesheet).

</div>

<div class="panel">

<h3 class="panel-name">
xaringan
</h3>

``` markdown
.b--gray.ba.bw2.ma2.pa4.shadow-1.steelblue4.bg-mintcream.mediumvioletred-hover.b--paleturquoise4[
Talent is a pursued interest.
Anything that you're willing to practice, you can do.

—Bob Ross
]
```

</div>

<div class="panel">

<h3 class="panel-name">
R Markdown
</h3>

``` markdown
::: {.b--gray .ba .bw2 .ma2 .pa4 .shadow-1 .steelblue4 .bg-mintcream .mediumvioletred-hover .b--paleturquoise4}
Talent is a pursued interest.
Anything that you're willing to practice, you can do.

—Bob Ross
:::
```

</div>

<div class="panel">

<h3 class="panel-name">
HTML
</h3>

``` html
<div class="b--gray ba bw2 ma2 pa4 shadow-1 steelblue4 bg-mintcream mediumvioletred-hover b--paleturquoise4">
<p>Talent is a pursued interest.
Anything that you're willing to practice, you can do.
</p>
<p>—Bob Ross</p>
</div>
```

</div>

<div class="panel">

<h3 class="panel-name">
htmltools (R)
</h3>

``` r
htmltools::div(
  class = paste(
    "b--gray ba bw2 ma2 pa4 shadow-1 steelblue4",
    "bg-mintcream mediumvioletred-hover b--paleturquoise4"
  ),
  htmltools::p(
    "Talent is a pursued interest.",
    "Anything that you're willing to practice, you can do.",
  ),
  htmltools::p("—Bob Ross")
)
```

</div>

</div>

<div class="b--gray ba bw2 ma2 pa4 shadow-1 steelblue4 bg-mintcream mediumvioletred-hover b--paleturquoise4">

Talent is a pursued interest.
Anything that you’re willing to practice, you can do.

—Bob Ross

</div>
