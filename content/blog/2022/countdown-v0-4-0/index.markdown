---
title: countdown v0.4.0 – Now on CRAN!
author: Garrick Aden-Buie
date: '2022-08-15'
slug: countdown-v0.4.0
categories:
  - Blog
tags:
  - R
  - R Package
  - Slides
  - countdown
  - Shiny
  - JavaScript
  - Apps
  - CRAN
  - Announcement
  - Presentations
  - xaringan
  - Quarto
description: |
  countdown v0.4.0 is now available on CRAN with a ton of new features!
twitterImage: feature.png
source_link: 'https://github.com/gadenbuie/garrickadenbuie-com/blob/main/content/blog/2022/countdown-v0-4-0/index.Rmd'
keywords: rstats
editor_options:
  chunk_output_type: console
---

<link href="{{< blogdown/postref >}}index_files/countdown-0.4.0/countdown.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/countdown-0.4.0/countdown.js"></script>
<link href="{{< blogdown/postref >}}index_files/countdown-0.4.0/countdown.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/countdown-0.4.0/countdown.js"></script>
<!-- Links -->

<div class="lead">

I’m <span class="superlative">stoked</span> to announce that [countdown](https://pkg.garrickadenbuie.com/countdown) is now available on CRAN!
Countdown to something awesome in [xaringan](https://slides.yihui.org/xaringan), [Quarto](https://quarto.org), [R Markdown](https://rmarkdown.rstudio.com), or [Shiny](https://shiny.rstudio.com).

This is the first release available via `install.packages()`
and it includes a whole bunch of new features.
Read on to learn more!

</div>

## What is countdown?

<div class="flex-m flex-l flex-row">

<div class="w-third-l w-50-m w-100 flex justify-center">

<div class="countdown" id="first-example" data-warn-when="30" data-update-every="1" tabindex="0" style="right:0;bottom:0;position: relative;width: max-content; max-width: 100%">
<div class="countdown-controls"><button class="countdown-bump-down">&minus;</button><button class="countdown-bump-up">&plus;</button></div>
<code class="countdown-time"><span class="countdown-digits minutes">01</span><span class="countdown-digits colon">:</span><span class="countdown-digits seconds">30</span></code>
</div>

</div>

<div class="w-two-thirds-l w-50-m w-100">

`countdown()` is a simple timer you can use in presentations, documents and Shiny apps.
It’s great for teaching or breakout sessions!

<span class="di-ns dn">👈</span><span class="di dn-ns">☝️</span>
**Click** the timer to start it.
**Click** again to pause.
**Double click** to reset it.
Adjust the timer on the fly with the **+** and **−** buttons.

</div>

</div>

Everything you need to know about countdown,
you can learn from the docs-slash-presentation
at [pkg.garrickadenbuie.com/countdown](https://pkg.garrickadenbuie.com/countdown).

<div class="feature">

<div class="feature-row">

<div class="feature-timer">

<div class="countdown" id="feature" data-warn-when="30" data-update-every="1" tabindex="0" style="right:0;bottom:0;position: relative;width: max-content; max-width: 100%">
<div class="countdown-controls"><button class="countdown-bump-down">&minus;</button><button class="countdown-bump-up">&plus;</button></div>
<code class="countdown-time"><span class="countdown-digits minutes">01</span><span class="countdown-digits colon">:</span><span class="countdown-digits seconds">30</span></code>
</div>

</div>

<div class="feature-code">

``` r
countdown::countdown(
  minutes = 1,
  seconds = 30,
  warn_when = 30
)
```

</div>

</div>

<div class="feature-footer">

<code><span class="o-60">pkg.garrickadenbuie.com/</span>countdown</code>

</div>

</div>

<style type="text/css">
.feature {
  width: 800px;
  height: calc(800px / 1.945);
  display: flex;
  display: none;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  position: relative;
}
.feature-row {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-evenly;
  font-size: 1.5rem;
  padding-bottom: 2em;
}
.feature-row > .feature-code {
  margin-left: 2em;
}
.feature-footer {
  position: absolute;
  bottom: 0em;
  left: 0;
  right: 0;
  text-align: center;
  font-size: 1.5rem;
  font-family: var(--font-monospace);
}
</style>

## Installing countdown

Installing countdown is now a whole lot easier:

``` r
install.packages("countdown")
```

As always, you can still get the latest and greatest in-development versions
from [GitHub](https://github.com/gadenbuie/countdown)

``` r
# install.packages("remotes")
remotes::install_github("gadenbuie/countdown")
```

or from [gadenbuie.r-universe.dev](https://gadenbuie.r-universe.dev/).

``` r
options(repos = c(
  gadenbuie = 'https://gadenbuie.r-universe.dev',
  CRAN = 'https://cloud.r-project.org'
))

install.packages('countdown')
```

## A brief history of countdown

### rstudio::conf(2019)

In 2019 I went to rstudio::conf in Austin TX
and took an awesome workshop by Garrett Grolemund and Greg Wilson about teaching.
That workshop specifically marked a turning point in my career
and I left rstudio::conf very inspired to build and teach cool things in R.

My other key takeaway from rstudio::conf(2019) was that it was time to learn JavaScript —
an odd thing to take away from an R conference.
(Although I don’t think I’m alone in this;
this year many people walked away from rstudio::conf(2022) thinking that it was time to learn Python.)

These two inspirations came together in my first post-conf project:
a countdown timer for xaringan slides.
Garrett used these extensively to pace break out sessions
and they worked surprisingly well to keep everyone on track.

<div class="fr-ns ph4" style="max-width:22rem">

![A slide from Garrett’s workshop materials with a 4-minute timer in the lower right corner.](https://pkg.garrickadenbuie.com/countdown/img/teach-tidyverse-timer.png)

</div>

One funny thing I noticed during our workshop session
was that Garrett would frequently have to switch to slide-edit mode (in Keynote, I think)
to fiddle with the timer as he adjusted the length of the “your turn” session.
This isn’t abnormal;
an instructor probably has a sense of approximately how long an activity will take
and we’ll often will adjust the time spent on the activity
based on how the audience is doing,
how well the material is working,
or how close to lunch or break we are in the session.

So my idea was to build a countdown timer
that you could drop into a slide
and easily use to time an event.
I also wanted to make it easy to adjust the time,
but my JavaScript skills were limited to what I could learn from StackOverflow,
so I compromised and decided that you could only bump the timer up.
If you had to move faster, you could just move on.

### It becomes an R package

I cobbled together an R package
that was basically a decent R interface
around a collection of lines of JavaScript that I barely understood,
that somehow assembled into an actual working timer.
I made a cool [intro-slash-docs presentation](https://pkg.garrickadenbuie.com/countdown)
and would probably have sat on it for a while longer
if Mara Averick hadn’t spotted my GitHub activity
and [soft-announced the package for me](https://twitter.com/dataandme/status/1125747630489911297).

Not long after that,
and slightly to my horror (*please don’t go looking at my JavaScript code*),
[Hadley submitted an issue](https://github.com/gadenbuie/countdown/issues/5).
Actually, [two issues](https://github.com/gadenbuie/countdown/issues/6).
Obviously, that was an exciting turn of events,
and his suggestions were solid and helped improve the quality of the timer.
(He suggested a “warning state” and a full-screen view/app.)

Amazingly, it worked!
People really seemed to like the package,
it solved a silly but useful need that many people have when teaching,
and it let me learn a ton about how to build htmlwidgets in R.
I’m proud of the R interface — it’s easy to use and configure —
and I think the feature set hits the right balance of
looking good right out of the box
without doing *too much*.

### But that JavaScript code…

Since I wrote countdown,
I’ve learned a whole lot more JavaScript
and I know a whole lot more about how htmlwidgets can be built in R.
countdown’s underlying code has always haunted me a little in the back of my mind,
but on the other hand it was chugging away,
still working fine for most people in most situations.

So I left it alone…

![Screenshot of the countdown GitHub repository page where the phrase “3 years ago” is highlighted. That is GitHub’s summary of the last time I updated countdown.](countdown-history-3-years.png)

…for almost 3 years.

This year, [rstudio::conf](https://rstudio.com/conference),
and wow, a lot has changed in those three years.
Not only did I lead a workshop *about JavaScript* for Shiny users
[\#js4shiny](https://js4shiny.com) at rstudio::conf(2020),
and not only do I now work for RStudio,
but I was also part of the program committee for conference planning.
Which means I saw colleagues were still using my countdown timer in workshop slides.

And that old franken-JavaScript code still haunted me.

<style type="text/css">
.superlative {
  border-bottom: 1px dashed;
  cursor: pointer;
}
.superlative:hover {
  color: var(--red-60);
}
.slide-preview {
  max-width: 480px;
}
</style>
<script type="text/javascript">
document.querySelector('.superlative').addEventListener('click', function(ev) {
  const superlatives = [
    'delighted', 'charmed', 'elated', 'excited', 'pleased', 'thrilled', 'chuffed',
    'tickled pink', 'overjoyed', 'ecstatic', 'stoked', 'proud', 'fired up'
  ]
  const el = ev.target
  const idx = Math.floor(Math.random() * superlatives.length)
  el.innerText = superlatives[idx]
})
</script>
