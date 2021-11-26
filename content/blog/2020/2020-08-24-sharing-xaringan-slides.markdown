---
title: Sharing Your xaringan Slides
author: Garrick Aden-Buie
date: '2020-09-01'
slug: sharing-xaringan-slides
categories:
  - Blog
tags:
  - R
  - xaringan
  - xaringanExtra
  - Slides
  - xaringan Tip
description: How to share your xaringan slides in style, on social media sites and embedded in your web page.
twitterImage: /blog/sharing-xaringan-slides/sharing-xaringan-social-card.jpg
keywords: rstats
editor_options:
  chunk_output_type: console
---

<script src="/rmarkdown-libs/clipboard-2.0.6/clipboard.min.js"></script>
<link href="/rmarkdown-libs/xaringanExtra-clipboard-0.2.6/xaringanExtra-clipboard.css" rel="stylesheet" />
<script src="/rmarkdown-libs/xaringanExtra-clipboard-0.2.6/xaringanExtra-clipboard.js"></script>
<script>window.xaringanExtraClipboard(null, {"button":"Copy Code","success":"Copied!","error":"Press Ctrl+C to Copy"})</script>
<script src="/rmarkdown-libs/fitvids-2.1.1/fitvids.min.js"></script>
<link href="/rmarkdown-libs/applause-button-3.3.2/applause-button.css" rel="stylesheet" />
<script src="/rmarkdown-libs/applause-button-3.3.2/applause-button.js"></script>
<!-- Links -->

<div class="lead">

Showcase your presentations in style
with great-looking social media cards
and responsive, seamlessly embedded slides in web pages.

</div>

You put a lot of time and effort into your slides:
structuring content,
choosing the right gifs,
tweaking colors and picking fonts.
In short: slidecrafting.

<center>
<a href="https://twitter.com/grrrck/status/1159087961931169795"><img src="tweet-slidecraft.png" style="width:100%;max-width:400px;" /></a>
</center>

In this post,
I’ll share some tips and strategies for publishing your <span class="pkg">[xaringan](https://slides.yihui.org/xaringan)</span> slides online.
Use the linked checklist below to get started or for review when prepping your next presentation.

This post covers some new features just released in my package <span class="pkg">[xaringanExtra](https://pkg.garrickadenbuie.com/xaringanExtra/)</span>.
If you haven’t used it before,
it provides a *playground of enhancements for* <span class="pkg">xaringan</span>.
It’s not available on CRAN,
so you’ll need to install it from GitHub:

``` r
# install.packages("remotes")
remotes::install_github("gadenbuie/xaringanExtra")
```

## Checklist

<style type="text/css">
.checklist ul {
    list-style: none;
  padding-left: 1em;
}
.checklist ul li {
  text-indent: -1.25em;
}
.checklist ul li .fa {
  display: inline;
}
</style>

<div class="checklist">

-   <input type="checkbox"></input>

<a href="#fill-in-metadata">
<i class="fa fa-info-circle"></i>
</a>

Fill in metadata with <span class="pkg">metathis</span>

-   <input type="checkbox"></input>

<a href="#create-a-social-media-card">
<i class="fa fa-info-circle"></i>
</a>

Create a social media card

-   <input type="checkbox"></input>

<a href="#add-a-share-bar">
<i class="fa fa-info-circle"></i>
</a>

Add a “share bar” with `use_share_again()` from <span class="pkg">xaringanExtra</span>

-   <input type="checkbox"></input>

<a href="#get-your-slides-online">
<i class="fa fa-info-circle"></i>
</a>

Get your slides online

-   <input type="checkbox"></input>

<a href="#pre-flight-checks">
<i class="fa fa-info-circle"></i>
</a>

Pre-flight checks

-   <input type="checkbox"></input>

<a href="#embed-your-slides">
<i class="fa fa-info-circle"></i>
</a>

Embed your slides with `embed_xaringan()` from <span class="pkg">xaringanExtra</span>

-   <input type="checkbox"></input>

<a href="#share-with-the-world">
<i class="fa fa-info-circle"></i>
</a>

Share with the world!

</div>

## Fill in Metadata

The first step is to give your slides all the metadata required
to be found via search engines or to look great
when shared on social media sites.

To do this,
I recommend using a small package I wrote called <span class="pkg">[metathis](https://pkg.garrickadenbuie.com/metathis/)</span>.
It’s available on CRAN!

``` r
install.packages("metathis")
```

Basically,
<span class="pkg">metathis</span> helps fill out `<meta>` tags in your HTML document.
These tags are used by
search engines and
social media sites like Twitter and Facebook
to describe your page,
list the title and author,
link to your profile,
and show a preview image for the page
(we’ll get to this in [the next section](#create-a-social-media-card)).

Here’s a template you can use for your own slides.
I’m using a [recent presentation](/talk/build-your-own-universe/) as an example,
or you can reference [the example in the metathis documentation](https://pkg.garrickadenbuie.com/metathis/#in-xaringan-slides).

```` markdown
```{r metathis, echo=FALSE}
library(metathis)
meta() %>%
  meta_name("github-repo" = "gadenbuie/build-your-own-universe") %>%
  meta_social(
    title = "Build your own universe",
    description = paste(
      "Scale high-quality research data provisioning with R packages.",
      "Presented at R/Medicine 2020."
    ),
    url = "https://build-your-own-universe.netlify.app",
    image = "https://build-your-own-universe.netlify.app/social-card.png",
    image_alt = paste(
      "Title slide of Build your own universe:",
      "Scale high-quality research data provisioning with R packages,",
      "presented at R/Medicine 2020 by Travis Gerke and Garrick Aden-Buie"
    ),
    og_type = "website",
    og_author = "Travis Gerke",
    twitter_card_type = "summary_large_image",
    twitter_creator = "@grrrck",
    twitter_site = "@travisgerke"
  )
```
````

Most of the arguments are self-explanatory or well-described in `?meta_social`.
One thing to watch out for is that the `image`
argument must be the full-qualified URL to the image.
In other words, the entire URL including the `https://` bit,
taking into account where the slides will live when you [put them online](#get-your-slides-online).

## Create a Social Media Card

### Why should you add a preview image?

Social media cards are the rich link previews
you see on websites like Twitter and Facebook.
I think it’s worth the extra work
to include a preview image for several reasons.

First, it’s much more likely that your link will be seen,
especially if your preview image is interesting or visually compelling.
Users are more likely
to click through and take a look at your slides
when they have some idea of what’s on the other side of the link.

Second,
the preview image is a tiny window into your own personal style.
You have no control over
the rest of the time line where your link is being shared —
your 280 characters look just like everyone else’s —
but your preview image is **your space**
to visually communicate your personal style.

And finally, using a preview image means that your crafted message
will appear every time your link is shared,
not just the first time.
A common alternative is to share the link to the slides,
but to add an image to share post.
This looks great *the first time* the link is shared,
but when someone else shares your slides’ link,
they probably won’t go to the trouble of including a screenshot.

Here are three examples of tweets sharing slides
that illustrate the various approaches to link previews.

<style type="text/css">
.grid {
  display: grid;
  grid-gap: 1em;
}
.grid-col-3 {
  grid-template-columns: repeat(3, 1fr);
}
.grid-col-2 {
  grid-template-columns: repeat(2, 1fr);
}
.grid p.caption {
    text-align: center;
    padding-left: 1.5em;
    padding-right: 1.5em;
}
@media screen and (max-width: 400px) {
  .grid-col-3, .grid-col-2 {
    max-width: 300px;
    margin-left: auto;
    margin-right: auto;
    grid-template-columns: repeat(1, auto);
  }
  .grid p.caption {
    padding: 0;
    text-align: right;
  }
}
</style>

<div class="grid grid-col-3">

<div class="tweet">

<div class="figure">

<a href="tweet-slides-no-preview.png" data-featherlight="image">
<img src="tweet-slides-no-preview.png" alt="Tweet from @revodavid sharing a link to slides. The slides' link has limited metadata and only text is shown in the link preview.">
</a>
<p class="caption">
Slide link with limited metadata. (<a href="https://twitter.com/revodavid/status/471320054874009600">tweet</a>)
</p>

</div>

</div>

<div class="tweet">

<div class="figure">

<a href="tweet-slides-shared-image.png" data-featherlight="image">
<img src="tweet-slides-shared-image.png" alt="Tweet from @i_steves sharing a link to slides, with a screenshot of the first slide shared as an image attached to the tweet.">
</a>
<p class="caption">
Slide link with a shared image. (<a href="https://twitter.com/i_steves/status/1086028069519933440">tweet</a>)
</p>

</div>

</div>

<div class="tweet">

<div class="figure">

<a href="tweet-slides-share-card.png" data-featherlight="image">
<img src="tweet-slides-share-card.png" alt="Tweet from @hadleywickham sharing a link to slides, with complete metadata. The preview image from the link shows the first slide.">
</a>
<p class="caption">
Slide link with a preview image and complete metadata. (<a href="https://twitter.com/hadleywickham/status/1096461439609511936">tweet</a>)
</p>

</div>

</div>

</div>

### Taking a screenshot of your slides

How do you create an image for your social media cards?
I’m glad you asked!
Typically, I like to take a screenshot of the title slide
and use that as the preview image.

Taking a screenshot of your slides is incredibly easy
if you’re using [Firefox](https://firefox.com),
which has a [built-in screenshot feature](https://screenshots.firefox.com/).
On Chrome, you can install an extension, like [Nimbus Capture](https://nimbusweb.me/screenshot.php).

To take a screenshot, I open my slides in Firefox
and select *Take a Screenshot* from the three-dots menu in the browser URL bar.

![Firefox’s **Take a Screenshot** menu option](screenshot-firefox-step1.png)

Then, don’t click “Save full page” or “Save visible.”
Instead, click on your slides area so the entire slide is selected
and then click “Download.”

<div class="grid grid-col-2">

<div class="firefox-screenshot">

<div class="figure">

<a href="screenshot-firefox-step2.png" data-featherlight="image">
<img src="screenshot-firefox-step2.png" alt="Firefox's screenshot feature, step 2. The user needs to click on the slides area to select the entire slide.">
</a>
<p class="caption">
Click on the slides area to select the entire slide.
</p>

</div>

</div>

<div class="firefox-screenshot">

<div class="figure">

<a href="screenshot-firefox-step3.png" data-featherlight="image">
<img src="screenshot-firefox-step3.png" alt="Firefox's screenshot feature, step 3. The user needs to select 'Download' to save the image.">
</a>
<p class="caption">
Download the screenshot to save the file into your Downloads folder.
</p>

</div>

</div>

</div>

### The perfect share image ratio

If you’re using
a `4:3` (the <span class="pkg">xaringan</span> default)
or `16:9` (my personal favorite)
slide ratio,
chances are that your share image will look okay…
but not *perfect*.
In particular,
if you’re targeting Twitter
(for sharing with [\#rstats](https://twitter.com/hashtag/rstats)),
you might find that parts of your preview image
are cut off if the image width and height aren’t *just right*.

It turns out that
[the best ratio for share card images](https://marketing.twitter.com/na/en/solutions/ad-format-specs/website-card.html)
on Twitter
is `1.91:1`.

So to get the best image possible,
you’ll need to temporarily render your slides with this aspect ratio
by changing the `ratio` to `191:100` in your slides’ YAML header.
(It turns out that [remarkjs](https://remarkjs.com)
doesn’t like fractional ratio units, hence the need to multiply by 100.)

``` yaml
output:
  xaringan::moon_reader:
    # ... other xaringan options ...
    nature:
      ratio: 191:100
```

Set the YAML header,
render your slides,
open in a browser,
and [take a screenshot](#taking-a-screenshot-of-your-slides).

If this sounds like a hassle, it’s because it kind of is.
Fortunately,
we can use the <span class="pkg">[webshot2](https://github.com/rstudio/webshot2)</span> package
to automate the entire process.
Note <span class="pkg">webshot2</span> requires that you have Chrome installed on your computer
and is only available from GitHub.

``` r
# install.packages("remotes")
remotes::install_github("rstudio/webshot2")
```

Then, you can use this little function below
to render your `slides_rmd` in the funky ratio needed for the share image,
saving a screenshot of the first slide to `path`.

``` r
#' Screenshot Your Title Slide for Share Image
#'
#' Takes a screenshot of your title slide for sharing on Twitter
#' (and other social media sites).
#'
#' @param slides_rmd Your slides file
#' @param path Path to new share image
screenshot_share_image <- function(
  slides_rmd,
  path_image = "share-card.png"
) {
  if (!requireNamespace("webshot2", quietly = TRUE)) {
    stop(
      "`webshot2` is required: ",
      'remotes::install_github("rstudio/webshot2")'
    )
  }

  webshot2::rmdshot(
    doc = slides_rmd,
    file = path_image,
    vheight = 600,
    vwidth = 600 * 191 / 100,
    rmd_args = list(
      output_options = list(
        nature = list(ratio = "191:100"),
        self_contained = TRUE
      )
    )
  )

  path_image
}
```

To use the function, just give it the path to your slides `.Rmd`
and `share-card.png` will be created in your working directory.

``` r
screenshot_share_image("my_slides.Rmd")
```

## Add a “share bar”

You’re almost done prepping your slides for sharing!
If you know that you’ll embed your slides
on your website or someone else’s page,
you’ll want to add a **share bar** to your slides
using [`use_share_again()`](https://pkg.garrickadenbuie.com/xaringanExtra/#/share-again)
from <span class="pkg">xaringanExtra</span>.

```` markdown
```{r xaringanExtra-share-again, echo=FALSE}
xaringanExtra::use_share_again()
```
````

!<span class="pkg">Meet **share again** from [xaringanExtra</span>](meet-share-again.jpg)

The **share again** extension adds a small bar at the bottom of your slides —
but only when the slides are embedded in an `<iframe>`.
The bar contains buttons to move between slides,
which often isn’t obvious when you’re looking at embedded slides.
It also makes it easy to go full screen
and there’s a sharing menu for quickly sharing your slides on social media sites.

It turns out that the **Viewer** pane in RStudio is also an `<iframe>`,
so the share bar will show up when you preview your slides in RStudio,
but it won’t appear if you load your slides directly in a browser window.

Check out the [full *share again* documentation for more information](https://pkg.garrickadenbuie.com/xaringanExtra/#/share-again).

## Get Your Slides Online

Now that your slides are all set up and ready to be shared (or presented!),
you need to get your slides online!
For tips on how to best get your slides online,
I’ll defer to the excellent presentation,
[Sharing on Short Notice](https://rstudio-education.github.io/sharing-short-notice/),
by Alison Hill and Desirée De Leon.

<div class="figure">

<a href="https://rstudio-education.github.io/sharing-short-notice"><img src="rstudio-sharing.jpg" alt=""></a>
<p class="caption">
<a href="https://rstudio-education.github.io/sharing-short-notice">Sharing on Short Notice</a> by Alison Hill and Desirée De Leon
</p>

</div>

Those slides are also available at the short link [rstd.io/sharing](https://rstd.io/sharing).

## Pre-Flight Checks

Now that your slides are online,
it’s time to check that they look as good as you expect
before you share them with the world.

To **check your metadata**,
you can use Twitter’s [share card validator](https://cards-dev.twitter.com/validator).
Drop in your link and Twitter will show you a preview of the share card for your link.
Much better than sending yourself private messages to find out how your share card looks!

Similarly, you can also test your [Open Graph](https://ogp.me/) tags
(used by Facebook and other sites)
with [opengraphcheck.com](https://opengraphcheck.com) or
on Facebook’s [Sharing Debugger](https://developers.facebook.com/tools/debug/).

Finally,
it’s a good idea to open your slides in every browser you have on your machine
— or at the very least in just one browser —
and walk through your slides to make sure everything works
and that you haven’t forgotten to upload any images or assets.

## Embed Your Slides

Now that your slides are out in the world,
you might want to embed them in your web page,
for example in a [talk page](/talks/build-your-own-universe)
or the [talks](/talks) section of your website.

To do this, I recommend using `embed_xaringan()` from <span class="pkg">xaringanExtra</span>.
It embeds your slides in a responsive, aspect-ratio `<iframe>`,
meaning that the slides are seamlessly embedded in the page
and their size is automatically adjusted to maintain the aspect ratio
that matches your slides.

Here’s an example of embedded slides from a recent talk I gave with [Travis Gerke](https://travisgerke.com).

``` r
xaringanExtra::embed_xaringan(
  url = "https://build-your-own-universe.netlify.app",
  ratio = "16:9"
)
```

<div class="shareagain" style="min-width:300px;margin:1em auto;">
<iframe src="https://build-your-own-universe.netlify.app" width="1600" height="900" style="border:2px solid currentColor;" loading="lazy" allowfullscreen></iframe>
<script>fitvids('.shareagain', {players: 'iframe'});</script>
</div>

Notice that if you’ve used [share again](#add-a-share-bar),
your embedded slides will have a nice share bar for navigation and sharing.

## Share with the World!

You’re finally ready!
Good luck with your presentation
and don’t forget to tweet out your awesome slides when you’re done
(or right before you start!).

<div style="width:100%;height:0;padding-bottom:100%;position:relative;">

<iframe src="https://giphy.com/embed/11F0d3IVhQbreE" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen>
</iframe>

</div>

<p class="caption">
<a href="https://giphy.com/gifs/bill-murray-pointing-you-got-this-11F0d3IVhQbreE">via GIPHY</a>
</p>

------------------------------------------------------------------------

<applause-button style="width: 50px; height: 50px;float: left;margin-right: 1em;" color="var(--accent)"></applause-button>
Thanks for reading!
Feel free to share your presentation-sharing tips with me on Twitter
[@grrrck](https://twitter.com/grrrck)!
