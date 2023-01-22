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
source_link: 'https://github.com/gadenbuie/garrickadenbuie-com/blob/main/content/blog/2022/countdown-v0-4-0/index.Rmarkdown'
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

In this post,
I [reflect](#reflection) a bit on the development of [countdown](https://pkg.garrickadenbuie.com/countdown),
but you can also skip straight to the [release notes](#release)!

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

Before we talk about [all the new things in countdown](#release),
I want to take a small minute to get nostalgic.
I hope you don’t mind indulging me
(or [skip ahead](#release) if you’d rather get right to business).

### rstudio::conf(2019)

In 2019 I went to [rstudio::conf](https://www.rstudio.com/resources/rstudioconf-2019/) in Austin, TX
where a highlight of the conference, for me,
was the [Train-the-Trainer: Tidyverse Track](https://github.com/rstudio-education/teach-tidy)
workshop by Garrett Grolemund and [Greg Wilson](https://third-bit.com/).
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
that was a fairly decent R interface
around a collection of lines of JavaScript that I barely understood,
that somehow assembled into an actual working timer.
I made a cool [intro-slash-docs presentation](https://pkg.garrickadenbuie.com/countdown)
and would probably have sat on it for a while longer
if it weren’t for [Mara Averick](https://twitter.com/dataandme)
who spotted my GitHub activity
and [soft-announced the package for me](https://twitter.com/dataandme/status/1125747630489911297).

Not long after that,
and slightly to my horror
(*please don’t go looking at my JavaScript code*),
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
and not only do I now work for RStudio[^1],
but I was also part of the program committee for conference planning.
Which means I saw colleagues were still using my countdown timer in workshop slides.

And that old franken-JavaScript code still haunted me.

So this year,
in part inspired by the return of
*[the final](https://www.rstudio.com/blog/rstudio-is-becoming-posit/)*
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
`setTimeout(function, delay)`.
When called, the browser waits until the delay is over and then calls the function.

A neat trick with `setTimeout`
is that you can call it recursively inside a function
as a way to run that function repeatedly.
Below I’ve defined a function `timerTick()`
that moves the timer forward one tick.
It also uses `setTimeout` to schedule the next tick of the timer.
And by using a delay of `1000` milliseconds,
I’ve set up a function that runs once per second —
just like a clock 😉.

This is, essentially, how countdown worked before.
For each run of `timerTick()`,
I would decrement the number of remaining seconds by one
and update the timer.
If there’s time left on the timer,
then `timerTick()` shcedules another update for 1 second later.
If there isn’t any time left,
we can stop the timer
by simply not scheduling any more timer updates.

``` js
function timerTick() {
  const timer = document.getElementById('timer')
  
  // update the timer
  timer.value -= 1
  console.log(`${timer.value}s remaining...`)
  
  if (timer.value > 0) {
    // there's time left, schedule next tick
    setTimeout(timerTick, 1000)
  } else {
    // time is up, reset the timer
    console.log(`Time's up!`)
    timer.classList.remove('running')
    timer.innerText = 'Start Timer'
    // notice we don't schedule another tick
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
  
  // update the timer
  timer.value -= 1
  console.log(\`\${timer.value}s remaining...\`)
  
  if (timer.value > 0) {
    // there's time left, schedule next tick
    setTimeout(timerTick, 1000)
  } else {
    // time is up, reset the timer
    console.log(\`Time's up!\`)
    timer.classList.remove('running')
    timer.innerText = 'Start Timer'
    // notice we don't schedule another tick
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
This *almost* works.
It works pretty well if you start the timer
and then don’t touch the browser window or switch to another tab.
So it does usually work fine when you’re presenting slides.

But it turns out that `setTimeout()` is more like `suggestThatThisRunsLater()`.
There’s really no guarantee that the function you scheduled to run
1,000 milliseconds from now is actually going to run in 1,000 milliseconds.

There are many things that can get in the way of that function being run when you expect it.
If you move to a different tab and come back, for example,
there’s no guarantee that the background tab would keep chugging along,
running my function every seconds.
Browsers have better things to do
and they’ll de-prioritize pages that aren’t being actively shown to users.
This means that sometimes `setTimeout(fn, 1000)` runs `fn` 1 second from now,
but depending on what else the browser is doing it could be a lot longer than that.

So how do we get around this? 🤔

### All New JavaScript

The new JavaScript version of countdown does something really simple.
It doesn’t rely on `setTimeout()` directly to keep track of the time.

Yes, it still schedules the next tick on 1 second intervals,
but it doesn’t trust that *exactly one second* has passed.
Now, when the user starts the timer,
countdown will note when the timer should end
and recalculates the remaining time with each tick.
This means the updates are always accurate,
even if there happen to be 4 seconds between consecutive ticks.

It also means that we can bump a running timer up or down
by moving that end time later or earlier.
To stop the timer,
we just note how much time is left
and to restart it again we recalculate the end time
based on how much time was left when we paused.

There’s a small amount of internal state to keep track of,
which happens to basically cry out for a
[JavaScript class](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/class).
So the new countdown timer is implemented via a `CountdownTimer` class.

Here’s a sketch of the class containing three core methods:

1.  `tick()` runs the timer, like above, except this time we calculate the remaining number of seconds on each tick.
    When there are less than 0 seconds left, we call the `finish()` method.

2.  `start()` gets things started by calculating when the timer should end and kicking off the `tick()` method.

3.  `finish()` wraps up by resetting the timer.

``` js
class Timer {
  constructor(el, duration) {
    // The timer's attached to a button
    this.element = el
    // it has a duration that's set when initiated
    this.duration = duration
    // and it will have an end when running
    this.end = null
  }
  
  tick () {
    // decide and report how much time is left
    const remaining = this.end - Date.now()
    console.log(`${remaining / 1000}s remaining...`)
    
    // and then schedule the next tick or finish up
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
    // the timer ends duration (s) * 1000 (ms) from now
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
    // The timer's attached to a button
    this.element = el
    // it has a duration that's set when initiated
    this.duration = duration
    // and it will have an end when running
    this.end = null
  }
  
  tick () {
    // decide and report how much time is left
    const remaining = this.end - Date.now()
    console.log(\`\${remaining / 1000}s remaining...\`)
    
    // and then schedule the next tick or finish up
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
    // the timer ends duration (s) * 1000 (ms) from now
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

Run the 5-second timer by clicking the button above.
Notice that even though we used the same `setTimeout(code, 1000)` as before
to schedule each tick for one second later,
because this version precisely reports how much time is left
you can see that our timer drifts a bit away from running perfectly
*once per second*.

### New buttons and keyboard interactions

Beyond the improved timer,
the new `CountdownTimer` class
makes it a whole lot easier to add additional features
that need to build on the timer’s internal state.

For example, you can now

- Click to start or stop the timer

- Double click to reset

- Bump the timer up or down using the **+** and **−** buttons

- Do all of the above with keyboard shortcus:

  - <kbd>Space</kbd> or <kbd>Enter</kbd> to start or stop the timer

  - <kbd>Esc</kbd> to reset

  - <kbd>↑</kbd> or <kbd>↓</kbd> to bump up or down

### Shiny!

The shiny new countdown package also has plenty of Shiny features.
Countdown timers can be controlled directly from Shiny
with `countdown_action()` or `countdown_update()`
and timers are now also inputs that report their state!

You can find an example Shiny app with a timer,
plus an explanation of how it all works,
by running

to launch an example app.
The example app is also available on my website at
[apps.garrickadenbuie.com/countdown-shiny-example](https://apps.garrickadenbuie.com/countdown-shiny-example).

In a nutshell,
the timer will report its state using its input `id`.
For example,
`countdown(id = "timer")` will report its state to Shiny
via `input$timer`.
The input reports the `event` that caused the state to change
and the state of the `timer`:

Here’s another small app that demonstrate how you could use a button
to toggle the state of the timer.

### Improved countdown App

<div class="fr-ns ph4" style="max-width:22rem">

![A screenshot of the full screen countdown timer app.](https://pkg.garrickadenbuie.com/countdown/img/countdown-app.png)

</div>

All of the Shiny updates mentioned above are used to power `countdown_app()`,
a full screen Shiny app for running timers.
These work really well for timing speakers at conferences
or for a quick way to keep track of a break out session in workshops or meetings.

The app itself received a few upgrades,
most importantly is the ability to share a timer
with the settings you want
using the URL.
This uses Shiny’s [Bookmarking state](https://shiny.rstudio.com/articles/bookmarking-state.html)
features to save your settings in the URL
and restore them when you load that link.

For example,
[this timer is a 20 minute timer with a warning at 5 minutes that updates every 10 seconds](https://apps.garrickadenbuie.com/countdown/?_inputs_&time=%2220%3A00%22&update_every=%2210%22&warn_time=%225%3A00%22).

### New Options

Finally, countdown gained a new option.
You can now start the timer as soon as it is visible
by setting `start_immediately = TRUE`.
The “as as soon as it’s visible” works pretty well:
in xaringan and Quarto slides it starts when you land on the slide
and in regular HTML documents the timer starts when you
scroll the timer into view.

It’s also worth mentioning that countdown now uses
[prismatic](https://emilhvitfeldt.github.io/prismatic/)
for color calculations.
I was really happy to see that [Emil](https://twitter.com/Emil_Hvitfeldt)
added [`best_contrast()`](https://emilhvitfeldt.github.io/prismatic/reference/best_contrast.html)
and switching to use that function cleaned up a lot of internal code for me!

## Thank you!

Huge thanks to the many people who opened issues or contributed code to countdown
over these years. You all rock 🧡

[@andrewpbray](https://github.com/andrewpbray),
[@apreshill](https://github.com/apreshill),
[@ConnorJPSmith](https://github.com/ConnorJPSmith),
[@csgillespie](https://github.com/csgillespie),
[@Dr-Joe-Roberts](https://github.com/Dr-Joe-Roberts),
[@fvitalini](https://github.com/fvitalini),
[@hadley](https://github.com/hadley),
[@HaoZeke](https://github.com/HaoZeke),
[@jhelvy](https://github.com/jhelvy),
[@jvcasillas](https://github.com/jvcasillas),
[@moshpirit](https://github.com/moshpirit),
[@rtheodoro](https://github.com/rtheodoro),
[@sje30](https://github.com/sje30),
[@spcanelon](https://github.com/spcanelon),and
[@thiyangt](https://github.com/thiyangt).

If you’ve read this far, thank you!
Thanks for using countdown and making developing R packages fun.
Reach out in the comments or on Twitter (I’m [@grrrck](https://twitter.com/grrrck))
with any questions or thoughts ☺️

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

<div id="out-unnamed-chunk-6">

<pre></pre>

</div>

<script type="text/javascript">
const log_out_unnamed_chunk_6 = redirectLogger(document.querySelector("#out-unnamed-chunk-6 > pre"))
document.addEventListener("DOMContentLoaded", function() {
log_out_unnamed_chunk_6(`document.querySelector('.superlative').addEventListener('click', function(ev) {
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

[^1]: At least until October: [RStudio is becoming Posit](https://www.rstudio.com/blog/rstudio-is-becoming-posit/).
