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
<link href="{{< blogdown/postref >}}index_files/js4shiny-0.0.28/jsonview/jsonview.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/js4shiny-0.0.28/jsonview/jsonview.min.js"></script>
<link href="{{< blogdown/postref >}}index_files/js4shiny-redirectConsoleLog-0.0.28/jslog.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/js4shiny-redirectConsoleLog-0.0.28/redirectConsoleLog.js"></script>
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

In 2019 I went to [rstudio::conf](https://www.rstudio.com/resources/rstudioconf-2019/) in Austin, TX
where a highlight of the conference, for me,
was the [Train-the-Trainer: Tidyverse Track](https://github.com/rstudio-education/teach-tidy)
workshop by Garrett Grolemund and Greg Wilson.
That workshop specifically marked a turning point in my career
and I left rstudio::conf very inspired to build and teach cool things in R.

I also walked away from rstudio::conf(2019) with another key take away:
it was time to learn JavaScript.
An odd thing to take away from an R conference, yes.
(Although I don’t think I’m alone in this kind of realization;
this year many people left rstudio::conf(2022) thinking that
[it’s time to learn Python](https://twitter.com/asmae_toumi/status/1552731475434430465).)

These two inspirations came together in my first post-conf project:
a countdown timer for [xaringan](https://slides.yihui.org/xaringan) slides.

<div class="fr-ns ph4" style="max-width:22rem">

![A slide from Garrett’s workshop materials with a 4-minute timer in the lower right corner.](https://pkg.garrickadenbuie.com/countdown/img/teach-tidyverse-timer.png)

</div>

Garrett used timers extensively to pace break out sessions
and they worked surprisingly well to keep everyone on track.
One funny thing I noticed during our workshop session
was that Garrett would frequently have to switch to slide-edit mode (in Keynote, I think)
to fiddle with the timer as he adjusted the length of the “your turn” session.
This is pretty normal;
an instructor probably has a sense of approximately how long an activity will take
and we’ll often will adjust the time spent on the activity
based on how the audience is doing,
how well the material is working,
or how close to lunch or a break we are in the session.

So my idea was to build a countdown timer
that you could drop into a slide
and easily use to time an event.
I also wanted to make it easy to adjust the time,
but my JavaScript skills were limited to what I could learn from StackOverflow,
so I compromised and decided that you could only bump the timer up.
After all it’s not like you *have* to end the timer,
you can always just move on in your slides.

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
[Hadley](https://twitter.com/hadleywickham) submitted an issue.
Actually, two issues.
Obviously, that was an exciting turn of events.
His suggestions were solid and helped improve the quality of the timer:
he suggested a [warning state](https://github.com/gadenbuie/countdown/issues/5)
and a [full-screen view/app](https://github.com/gadenbuie/countdown/issues/6).

Amazingly, the package worked!
People really seemed to like it,
it solved a niche but useful need that many people have when teaching,
and it let me learn a ton about how to build htmlwidgets in R.
I’m proud of the R interface — it’s easy to use and configure —
and I think the feature set hits the right balance of
looking good right out of the box
without doing *too much*.

### But that JavaScript code…

Since I wrote the first version of countdown,
I’ve learned a whole lot more JavaScript
and I know a whole lot more about how to build *web things* in R.
countdown’s underlying code has always haunted me a little,
but on the other hand it was chugging away,
still working fine for most people in most situations.

So I left it alone…

![Screenshot of the countdown GitHub repository page where the phrase “3 years ago” is highlighted. That is GitHub’s summary of the last time I updated countdown.](countdown-history-3-years.png)

…for almost 3 years.

And *wow how much has changed* in the three plus years since rstudio::conf(2019).
Not only did I lead a workshop *about JavaScript* for Shiny users at rstudio::conf(2020)
(hashtag [js4shiny](https://js4shiny.com)),
and not only do I now work for RStudio,
but I was also part of the program committee for conference planning.
Which means I saw colleagues were still using my countdown timer in workshop slides.

And that old franken-JavaScript code still haunted me.

So this year,
in part inspired by the return (and [final](https://www.rstudio.com/blog/rstudio-is-becoming-posit/))
[rstudio::conf](https://rstudio.com/conference),
I decided that finally rewriting that JavaScript
would be the perfect conference side-hack project.

Which led to countdown v0.4.0 arriving on CRAN!

## coundown v0.4.0

<style type="text/css">
pre:empty {
  border-left: none !important;
}
</style>

### The Old JavaScript

My first implementation relied heavily on the JavaScript function
[`setTimeout`](https://developer.mozilla.org/en-US/docs/Web/API/setTimeout),
which takes a `function` and a `delay` in milliseconds:
`setTimeout(function, delay)`
When called, the browser will call the function after the delay is over.

You can use `setTimeout` recursively inside a function
to run that function repeatedly after calling it just once.
Below I’ve defined a function `timerTick()`
that, when called, uses `setTimeout` to schedule the next run of the function.
If you use a delay of `1000` milliseconds,
you can set up a function that runs once per second —
just like a clock 😉.

This is, essentially, how countdown worked before.
For each run of `timerTick()`,
I would decrement the number of remaining seconds by one
and update the timer.
If there’s still time left
then I scheduled another update for 1 second later.
If there isn’t any time left,
we can stop the timer
and stop scheduling more timer updates.

``` js
function timerTick() {
  const timer = document.getElementById('timer')
  timer.value -= 1
  console.log(`${timer.value}s remaining...`)
  if (timer.value > 0) {
    setTimeout(timerTick, 1000)
  } else {
    console.log(`Time's up!`)
    timer.classList.remove('running')
    timer.innerText = 'Start Timer'
  }
}
```

And this works<sup>\*</sup>! Try it out by clicking the button below.

<button id="timer" class="btn btn-default" value=5>Start Countdown</button>

<div id="out-simple-timer">

<pre></pre>

</div>

<script type="text/javascript">
const log_out_simple_timer = redirectLogger(document.querySelector("#out-simple-timer > pre"))
document.addEventListener("DOMContentLoaded", function() {
log_out_simple_timer(`function timerTick() {
  const timer = document.getElementById('timer')
  timer.value -= 1
  console.log(\`\${timer.value}s remaining...\`)
  if (timer.value > 0) {
    setTimeout(timerTick, 1000)
  } else {
    console.log(\`Time's up!\`)
    timer.classList.remove('running')
    timer.innerText = 'Start Timer'
  }
}

function timerClear() {
  // Clear the console output
  console.clear()
  // Reset the timer's starting value
  const timer = document.getElementById('timer')
  timer.value = 5
  console.log(\`\${timer.value}s remaining...\`)
}

document
  .getElementById('timer')
  .addEventListener('click', function({ target: timer }) {
    if (timer.classList.contains('running')) {
      // timer is running, do nothing
      return
    } else {
      timer.classList.add('running')
      timer.innerText = 'Timer is running...'
    }
    timerClear()
    setTimeout(timerTick, 1000)
  })`)
})
</script>

<sup>\*</sup>Almost.
This almost works.
It works pretty well when you leave the browser window open to the tab with the timer.

But it turns out that `setTimeout()` is more like `suggestThatThisRunsLater()`.
There’s really no guarantee that the function you scheduled to run again
in 1,000 milliseconds is actually going to run in 1,000 milliseconds.
There are many things that can get in the way of that timer workin as expected.

If you move to a different tab and come back, for example,
there’s no guarantee that the background tab would keep chugging along,
running my function every seconds.
Browsers have better things to do
and they’ll de-prioritize pages that aren’t being actively show to users.

So how do we get around this?

### All New JavaScript

The all new JavaScript does something really simple.
It doesn’t rely on `setTimeout()` for keeping track of the time.

Instead, it schedules the next tick but doesn’t trust that exactly one second has passed.
Now, when you start the timer,
countdown will calulcate when the timer should end,
and then whenever an update tick runs
it figures out how many minutes and seconds are left
and updates the timer accordingly.

To bump the timer up or down,
we can just move that end time later or earlier.
To stop the timer, we just note how much time is left
and to restart it we recalculate the end time as right now plus the remaining time.

There’s a small amount of internal state to keep track of,
which is the perfect use case for a countdown timer
[class](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/class).
Here’s a sketch of the class.
There are three methods:

1.  `tick()` runs the timer, like above, except this time we calculate the remaining number of seconds on each tick.
    When there are less than 0 seconds left, we call the `finish()` method.

2.  `start()` gets things started by calculating when the timer should end and kicking off the `tick()` method.

3.  `finish()` wraps up by resetting the timer.

``` js
class Timer {
  constructor(el, duration) {
    this.element = el
    this.duration = duration
    this.end = null
  }
  
  tick () {
    const remaining = this.end - Date.now()
    console.log(`${remaining / 1000}s remaining...`)
    if (remaining > 0) {
      setTimeout(this.tick.bind(this), 1000)
    } else {
      this.finish()
    }
  }
  
  start () {
    if (this.end) return
    
    console.clear()
    this.element.innerText = 'Timer is running...'
    this.end = Date.now() + this.duration * 1000
    this.tick()
  }
  
  finish () {
    this.end = null
    this.element.innerText = 'Start Timer'
    console.log(`Time's up!`)
  }
}
```

<button id="timer-two" class="btn btn-default">Start Countdown</button>

<div id="out-timer-two">

<pre></pre>

</div>

<script type="text/javascript">
const log_out_timer_two = redirectLogger(document.querySelector("#out-timer-two > pre"))
document.addEventListener("DOMContentLoaded", function() {
log_out_timer_two(`class Timer {
  constructor(el, duration) {
    this.element = el
    this.duration = duration
    this.end = null
  }
  
  tick () {
    const remaining = this.end - Date.now()
    console.log(\`\${remaining / 1000}s remaining...\`)
    if (remaining > 0) {
      setTimeout(this.tick.bind(this), 1000)
    } else {
      this.finish()
    }
  }
  
  start () {
    if (this.end) return
    
    console.clear()
    this.element.innerText = 'Timer is running...'
    this.end = Date.now() + this.duration * 1000
    this.tick()
  }
  
  finish () {
    this.end = null
    this.element.innerText = 'Start Timer'
    console.log(\`Time's up!\`)
  }
}

const timerTwo = document.getElementById('timer-two')
timerTwo.timer = new Timer(timerTwo, 5)
timerTwo.addEventListener('click', function({ target: el }) {
  el.timer.start()
})`)
})
</script>

Run this timer by clicking the button above.
Even though we used `setTimeout(code, 1000)` to schedule each tick for one second later,
you can see that our timer isn’t perfectly running on the seconds.

Beyond the improved timer,
using a class instead of a bunch of StackOverlow code
makes it a whole lot easier to add on additional features
that need to build on the timer’s internal state.

### New buttons and keyboard interactions

-   Click to start/stop
-   Double click to reset
-   New bump up/down buttons
-   Keyboard shortcuts (space/enter, esc, up/down arrows)

### Shiny!

-   You can now control the timer from Shiny with `countdown_action()`
-   Receive timer events on the server
-   These power `countdown_app()`, where I also added bookmarking
    <https://apps.garrickadenbuie.com/countdown/?_inputs_&time=%2220%3A00%22&update_every=%2210%22&warn_time=%225%3A00%22>
-   If your interested in learning more, check out `countdown_shiny_example()`
    or <http://apps.garrickadenbuie.com/countdown-shiny-example>

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

<div id="out-unnamed-chunk-4">

<pre></pre>

</div>

<script type="text/javascript">
const log_out_unnamed_chunk_4 = redirectLogger(document.querySelector("#out-unnamed-chunk-4 > pre"))
document.addEventListener("DOMContentLoaded", function() {
log_out_unnamed_chunk_4(`document.querySelector('.superlative').addEventListener('click', function(ev) {
  const superlatives = [
    'delighted', 'charmed', 'elated', 'excited', 'pleased', 'thrilled', 'chuffed',
    'tickled pink', 'overjoyed', 'ecstatic', 'stoked', 'proud', 'fired up'
  ]
  const el = ev.target
  const idx = Math.floor(Math.random() * superlatives.length)
  el.innerText = superlatives[idx]
})`)
})
</script>
