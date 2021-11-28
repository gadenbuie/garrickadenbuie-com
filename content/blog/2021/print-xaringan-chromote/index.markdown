---
title: Printing xaringan slides with chromote
author: Garrick Aden-Buie
date: '2021-01-25'
slug: print-xaringan-chromote
categories:
  - Blog
tags:
  - R
  - xaringan
  - xaringanExtra
  - Slides
  - Tips
  - Scripts
description: Create PDF versions of complicated xaringan slides using {chromote} and a little magic.
rmd_source: 'https://github.com/gadenbuie/garrickadenbuie-com/tree/main/content/blog/2021/print-xaringan-chromote/index.Rmd'
keywords: rstats
editor_options:
  chunk_output_type: console
---

<script src="{{< blogdown/postref >}}index_files/clipboard-2.0.6/clipboard.min.js"></script>
<link href="{{< blogdown/postref >}}index_files/xaringanExtra-clipboard-0.2.6/xaringanExtra-clipboard.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/xaringanExtra-clipboard-0.2.6/xaringanExtra-clipboard.js"></script>
<script>window.xaringanExtraClipboard('pre.r', {"button":"Copy Code","success":"Copied!","error":"Press Ctrl+C to Copy"})</script>
<!-- Links -->

<div class="lead">

There are a number of options for producing PDF versions of <span class="pkg">[xaringan](https://github.com/yihui/xaringan)</span> slides,
provided you use the standard <span class="pkg">xaringan</span> features.

If you add interactive elements,
like [panelsets](https://pkg.garrickadenbuie.com/xaringanExtra/#/panelset) from <span class="pkg">[xaringanExtra](https://pkg.garrickadenbuie.com/xaringanExtra)</span>,
printing your slides to convert them to PDF may not capture everything in your slides.

This post demonstrates a function that uses <span class="pkg">[chromote](https://github.com/rstudio/chromote)</span>
to print <span class="pkg">xaringan</span> slides to PDF files that should give better results,
in particular when using [panelsets](https://pkg.garrickadenbuie.com/xaringanExtra/#/panelset).

</div>

## The Problem

Typically, it’s fairly easy to convert <span class="pkg">xaringan</span> slides to PDF.
There are three methods that I’ve used that each work well
and produce relatively similar results:

1.  Print the slides from a browser. Typically this works best in Chrome.

2.  Use `xaringan::decktape()` to virtually print the slides to PDF.
    This requires docker or an installed version of the [decktape.js](https://github.com/astefanutti/decktape) utility.

3.  Use `pagedown::chrome_print()`. This is similar to the first option,
    but uses a [headless](#headless) version of Chrome to do the printing
    behind the scenes.

These methods all work well but have one significant drawback:
they don’t work well with <span class="pkg">xaringanExtra</span>’s [panelsets](https://pkg.garrickadenbuie.com/xaringanExtra/#/panelset).
The problem with the panelsets is that they essentially add “within-slide” slides.
All of the panels are contained in a single slide,
so when printed,
only the first panel in the panelset is shown.

## The Idea

The solution is easy but took me a bit of fiddling to figure out:
we use <span class="pkg">chromote</span> to control our own headless version of Chrome.
Then we ask a programmatic monkey to push the <kbd>→</kbd> button repeatedly,
once per second(-ish),
to advance through the slides,
printing each slide to its own PDF.

Once all the slides are printed,
we ask our monkey assistant to please staple the slides together into one (big) PDF file.
All of this happens inside a headless Chrome browser controlled by <span class="pkg">chromote</span>.

That’s it!
And okay, the monkey assistant is actually a little bit of JavaScript that mashes a virtual right arrow key.
And the stapler is actually the fantastic <span class="pkg">[pdftools](https://docs.ropensci.org/pdftools)</span> package.

Oh, and <a id="headless">*headless*</a> isn’t as spooky as it sounds.
Basically it’s Chrome without the *chrome*.
In other words,
it’s a version of Chrome that runs as a command line utility
and doesn’t have a user interface that you can click around in.
Instead, you communicate with the browser by sending it commands,
all of which are made easier by <span class="pkg">chromote</span>.

## The Solution

I’ve written a function, `xaringan_to_pdf()`,
that you can point either at your slides online or your at local rendered slides (which may require `file://` before the full path to the `.html` file).

You can [copy the code below](#the-code), or you can source it from [this gist](https://gist.github.com/gadenbuie/f6b8ec0335bdd45ed5a68bead60ef4fa) using the code and shortlink below[^1].
*Please check the source before you run it!*

``` r
source("https://git.io/xaringan2pdf")
```

Running `xaringan_to_pdf()` will walk through your slides,
printing them one-by-one,
and returning one big PDF file.
I’m not linking one here because they can be *big*.

<pre id="asciicast"><img src="asciicast-xaringan2pdf.svg"></pre>

## The Code

Before you can print your slides with `xaringan_to_pdf()`, you’ll need a few things:

1.  [Google Chrome](https://www.google.com/chrome/)

2.  The <span class="pkg">chromote</span> package, which isn’t on CRAN yet:

    ``` r
    remotes::install_github("rstudio/chromote")
    ```

3.  A few other packages that you can get from CRAN:

    ``` r
    install.packages(c("progress", "jsonlite", "pdftools", "digest"))
    ```

Once you have those things installed and ready to go,
copy the source code below and then run `xaringan_to_pdf()` to print your slides!

If you have any problems with the code,
feel free to [leave a comment on the gist](https://gist.github.com/gadenbuie/f6b8ec0335bdd45ed5a68bead60ef4fa).

<style type="text/css">
.gist { display: none; }
#xaringan-chromote-print-r {
  max-height: 80vh;
  overflow-y: auto;
}
#asciicast > img {
  margin-bottom: 0;
}
</style>
<pre class="r"><code id = "xaringan-chromote-print-r">#' Print xaringan slides to PDF
#'
#' Prints xaringan slides to a PDF file, even complicated slides
#' with panelsets or other html widgets or advanced features.
#' Requires a local installation of Chrome.
#'
#' @param input Path to Rmd or html file of xaringan slides.
#' @param output_file The name of the output file. If using NULL then
#'   the output filename will be based on filename for the input file.
#'   If a filename is provided, a path to the output file can also be provided.
#' @param delay Seconds of delay between advancing to and printing
#'   a new slide.
#' @param include_partial_slides Should partial (continuation) slides be
#'   included in the output? If `FALSE`, the default, only the complete slide
#'   is included in the PDF.
xaringan_to_pdf <- function(
  input,
  output_file = NULL,
  delay = 1,
  include_partial_slides = FALSE
) {
  if (!requireNamespace("chromote", quietly = TRUE)) {
    stop("`chromote` is required: devtools::install_github('rstudio/chromote')")
  }
  required_packages <- c("progress", "jsonlite", "pdftools", "digest", "fs")
  for (pkg in required_packages) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      stop("`", pkg, "` is required: install.packages('", pkg, "')")
    }
  }

  is_url <- grepl("^(ht|f)tp", tolower(input))

  if (is.null(output_file)) {
    if (is_url) {
      output_file <- fs::path_ext_set(fs::path_file(input), "pdf")
    } else {
      output_file <- fs::path_ext_set(input, "pdf")
    }
  }

  if (!is_url && !grepl("^file://", input)) {
    if (!tolower(fs::path_ext(input)) %in% c("htm", "html")) {
      stop("`input` must be the HTML version of the slides.")
    }
    input <- paste0("file://", fs::path_abs(input))
  }

  b <- chromote::ChromoteSession$new()
  on.exit(b$close(), add = TRUE)

  b$Page$navigate(input, wait_ = TRUE)
  b$Page$loadEventFired()

  has_remark <- b$Runtime$evaluate("typeof slideshow !== 'undefined'")$result$value
  if (!has_remark) {
    stop("Input does not appear to be xaringan slides: ", input)
  }

  current_slide <- function() {
    x <- b$Runtime$evaluate("slideshow.getCurrentSlideIndex()")$result$value
    as.integer(x) + 1L
  }

  slide_is_continuation <- function() {
    b$Runtime$evaluate(
      "document.querySelector('.remark-visible').matches('.has-continuation')"
    )$result$value
  }

  hash_current_slide <- function() {
    digest::digest(b$Runtime$evaluate(
      "document.querySelector('.remark-visible').innerHTML"
    )$result$value)
  }

  get_ratio <- function() {
    r <- b$Runtime$evaluate('slideshow.getRatio()')$result$value
    r <- lapply(strsplit(r, ":"), as.integer)
    width <- r[[1]][1]
    height <- r[[1]][2]
    page_width <- 8/width * width
    list(
      width = as.integer(908 * width / height),
      height = 681L,
      page = list(width = page_width, height = page_width * height / width)
    )
  }

  slide_size <- get_ratio()

  expected_slides <- as.integer(
    b$Runtime$evaluate("slideshow.getSlideCount()")$result$value
  )

  max_slides <- expected_slides * 4

  b$Browser$setWindowBounds(1, bounds = list(
    width = slide_size$width,
    height = slide_size$height
  ))

  b$Emulation$setEmulatedMedia("print")
  b$Runtime$evaluate(paste0(
    "let style = document.createElement('style')\n",
    "style.innerText = '@media print { ",
    ".remark-slide-container:not(.remark-visible){ display:none; }",
    if (include_partial_slides) " .has-continuation { display: block }",
    "}'\n",
    "document.head.appendChild(style)"
  ))

  pb <- progress::progress_bar$new(
    format = "Slide :slide (:part) [:bar] Eta: :eta",
    total = expected_slides
  )

  idx_slide <- current_slide()
  last_hash <- ""
  idx_part <- 0L
  pdf_files <- c()
  for (i in seq_len(max_slides)) {
    if (i > 1) {
      b$Input$dispatchKeyEvent(
        "rawKeyDown",
        windowsVirtualKeyCode = 39,
        code = "ArrowRight",
        key = "ArrowRight",
        wait_ = TRUE
      )
    }

    if (current_slide() == idx_slide) {
      step <- 0L
      idx_part <- idx_part + 1L
    } else {
      step <- 1L
      idx_part <- 1L
    }
    idx_slide <- current_slide()
    pb$tick(step, tokens = list(slide = idx_slide, part = idx_part))

    if (!isTRUE(include_partial_slides) && slide_is_continuation()) next
    Sys.sleep(delay)

    this_hash <- hash_current_slide()
    if (identical(last_hash, this_hash)) break
    last_hash <- this_hash

    pdf_file_promise <- b$Page$printToPDF(
      landscape = TRUE,
      printBackground = TRUE,
      paperWidth = 12,
      paperHeight = 9,
      marginTop = 0,
      marginRight = 0,
      marginBottom = 0,
      marginLeft = 0,
      pageRanges = "1",
      preferCSSPageSize = TRUE,
      wait_ = FALSE
    )$then(function(value) {
      filename <- tempfile(fileext = ".pdf")
      writeBin(jsonlite::base64_dec(value$data), filename)
      filename
    })
    pdf_files <- c(pdf_files, b$wait_for(pdf_file_promise))
  }

  pdftools::pdf_combine(pdf_files, output = output_file)
  fs::file_delete(pdf_files)

  invisible(output_file)
}</code></pre>

<script
  type="text/javascript"
  src="https://gist.github.com/f6b8ec0335bdd45ed5a68bead60ef4fa.js?file=xaringan-chromote-print.R"
></script>
<script type="text/javascript">
var code = []
document.addEventListener('DOMContentLoaded', function() {
  var gist = document.querySelectorAll('.gist .file .js-file-line')
  if (gist.length) {
    gist.forEach(function(el) {
      code.push(el.textContent)
    })
    var rscript = document.getElementById('xaringan-chromote-print-r')
    rscript.classList = 'r'
    rscript.textContent = code.join('\n').replace(/\n\n/g, '\n')
    hljs.highlightBlock(rscript)
  }
})
</script>

[^1]: I wasn’t really sure where to put this function. Maybe I’ll eventually add it to \[xaringanExtra</span>, but for now it’ll live here where hopefully it can still be useful to you!
