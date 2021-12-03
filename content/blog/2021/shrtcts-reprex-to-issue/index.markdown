---
title: Create a GitHub issue from a reprex with shrtcts
author: Garrick Aden-Buie
date: '2021-09-03'
slug: shrtcts-reprex-to-issue
categories:
  - Blog
tags:
  - R
  - Addin
  - Shortcuts
  - GitHub
  - reprex
description: |
  Turn a reprex into a GitHub issue using a custom RStudio addin with shrtcts.
source_link: 'https://github.com/gadenbuie/garrickadenbuie-com/blob/main/content/blog/2021/shrtcts-reprex-to-issue/index.Rmarkdown'
keywords: rstats
references: ~
---

<script src="{{< blogdown/postref >}}index_files/clipboard/clipboard.min.js"></script>
<link href="{{< blogdown/postref >}}index_files/xaringanExtra-clipboard/xaringanExtra-clipboard.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/xaringanExtra-clipboard/xaringanExtra-clipboard.js"></script>
<script>window.xaringanExtraClipboard('pre.r', {"button":"Copy Code","success":"Copied!","error":"Press Ctrl+C to Copy"})</script>

<div class="lead">

Have you ever spent a few ~~minutes~~ hours turning a bug in your code
into a [reprex](https://reprex.tidyverse.org/) – a minimal **repr**oducible **ex**ample?

Getting to a reprex is 90% of the challenge.
Most of the time, I find my mistake in the journey to a reprex.
But sometimes, I find a legitimate bug and in those cases,
I want to quickly turn my reprex into a GitHub issue.

Here’s a quick way to get there using an RStudio addin and <span class="pkg">[shrtcts](https://pkg.garrickadenbuie.com/shrtcts)</span>.

</div>

## `reprex` is awesome

The <span class="pkg">[reprex](https://reprex.tidyverse.org/)</span> package is **awesome**.
If you’ve never used it before,
I highly recommend that you stop reading this blog
and go watch [Sharla Gelfand’s *make a reprex… please*](https://youtu.be/G5Nm-GpmrLw?t=60)
(or [read the slides from the talk](https://make-a-reprex-please.netlify.app/)).

Your goal when making a reprex is to come up with a short bit of code
that demonstrates the problem you’ve experienced
and that is as self-contained as possible.

To disentangle your problem from your personal R environment,
<span class="pkg">reprex</span> takes your code,
runs it in an isolated environment,
and returns a rendered version of your code
that’s ready to be copy-pasted into a text box
on a number of common websites where R users go for help.

This last feature is one of my favorites:
the rendered format of a `reprex`
is the perfect way to start crafting a GitHub issue.
Typically, I’ll work out the reprex locally,
then use the **Reprex selection** RStudio addin to render the code,
and finally jump over to the issues tab of a GitHub repo to paste the code right there.

Here’s an example reprex from [Sharla’s talk](https://make-a-reprex-please.netlify.app/#33).
We start with plain [R code](/blog/shrtcts-reprex-to-issue/?panelset=r-code#panelset_r-code).
<span class="pkg">reprex</span> renders the R code with additional information about my session
and [shows me a preview](/blog/shrtcts-reprex-to-issue/?panelset=reprex-preview#panelset_reprex-preview).
And finally it also copies [the markdown I need](/blog/shrtcts-reprex-to-issue/?panelset=clipboard#panelset_clipboard)
in order to paste the reprex into a GitHub issue or other online location.

<div class="panelset panelset--bordered">

<div class="panel">

<span class="panel-name">R Code</span>

``` r
library(tidyverse)

tibble(date = "2020-01-01") %>%
  mutate(year = case_when(
    date <= "2020-12-31" & date >= "2020-01-01" ~ 2020,
    is.na(date) ~ NA
  ))
```

</div>

<div class="panel">

<span class="panel-name">Reprex Preview</span>

``` r
library(tidyverse)

tibble(date = "2020-01-01") %>%
  mutate(year = case_when(
    date <= "2020-12-31" & date >= "2020-01-01" ~ 2020,
    is.na(date) ~ NA
  ))
#> Error: Problem with `mutate()` column `year`.
#> ℹ `year = case_when(...)`.
#> ✖ must be a double vector, not a logical vector.
```

<sup>Created on 2021-12-03 by the [reprex package](https://reprex.tidyverse.org) (v2.0.1)</sup>

<details style="margin-bottom:10px;">
<summary>
Session info
</summary>

``` r
sessioninfo::session_info()
#> ─ Session info ───────────────────────────────────────────────────────────────
#>  setting  value                       
#>  version  R version 4.1.0 (2021-05-18)
#>  os       macOS Big Sur 10.16         
#>  system   x86_64, darwin17.0          
#>  ui       X11                         
#>  language (EN)                        
#>  collate  en_US.UTF-8                 
#>  ctype    en_US.UTF-8                 
#>  tz       America/New_York            
#>  date     2021-12-03                  
#> 
#> ─ Packages ───────────────────────────────────────────────────────────────────
#>  package     * version date       lib source            
#>  assertthat    0.2.1   2019-03-21 [1] standard (@0.2.1) 
#>  backports     1.3.0   2021-10-27 [1] standard (@1.3.0) 
#>  broom         0.7.6   2021-04-05 [1] standard (@0.7.6) 
#>  cellranger    1.1.0   2016-07-27 [1] standard (@1.1.0) 
#>  cli           3.1.0   2021-10-27 [1] standard (@3.1.0) 
#>  colorspace    2.0-1   2021-05-04 [1] standard (@2.0-1) 
#>  crayon        1.4.2   2021-10-29 [1] standard (@1.4.2) 
#>  DBI           1.1.1   2021-01-15 [1] standard (@1.1.1) 
#>  dbplyr        2.1.1   2021-04-06 [1] standard (@2.1.1) 
#>  digest        0.6.28  2021-09-23 [1] standard (@0.6.28)
#>  dplyr       * 1.0.7   2021-06-18 [1] standard (@1.0.7) 
#>  ellipsis      0.3.2   2021-04-29 [1] standard (@0.3.2) 
#>  evaluate      0.14    2019-05-28 [1] standard (@0.14)  
#>  fansi         0.5.0   2021-05-25 [1] standard (@0.5.0) 
#>  fastmap       1.1.0   2021-01-25 [1] standard (@1.1.0) 
#>  forcats     * 0.5.1   2021-01-27 [1] standard (@0.5.1) 
#>  fs            1.5.0   2020-07-31 [1] standard (@1.5.0) 
#>  generics      0.1.1   2021-10-25 [1] standard (@0.1.1) 
#>  ggplot2     * 3.3.5   2021-06-25 [1] standard (@3.3.5) 
#>  glue          1.5.0   2021-11-07 [1] standard (@1.5.0) 
#>  gtable        0.3.0   2019-03-25 [1] standard (@0.3.0) 
#>  haven         2.4.1   2021-04-23 [1] standard (@2.4.1) 
#>  highr         0.9     2021-04-16 [1] standard (@0.9)   
#>  hms           1.1.1   2021-09-26 [1] standard (@1.1.1) 
#>  htmltools     0.5.2   2021-08-25 [1] standard (@0.5.2) 
#>  httr          1.4.2   2020-07-20 [1] standard (@1.4.2) 
#>  jsonlite      1.7.2   2020-12-09 [1] standard (@1.7.2) 
#>  knitr         1.36    2021-09-29 [1] standard (@1.36)  
#>  lifecycle     1.0.1   2021-09-24 [1] standard (@1.0.1) 
#>  lubridate     1.8.0   2021-10-07 [1] standard (@1.8.0) 
#>  magrittr      2.0.1   2020-11-17 [1] standard (@2.0.1) 
#>  modelr        0.1.8   2020-05-19 [1] standard (@0.1.8) 
#>  munsell       0.5.0   2018-06-12 [1] standard (@0.5.0) 
#>  pillar        1.6.4   2021-10-18 [1] standard (@1.6.4) 
#>  pkgconfig     2.0.3   2019-09-22 [1] standard (@2.0.3) 
#>  purrr       * 0.3.4   2020-04-17 [1] standard (@0.3.4) 
#>  R6            2.5.1   2021-08-19 [1] standard (@2.5.1) 
#>  Rcpp          1.0.7   2021-07-07 [1] standard (@1.0.7) 
#>  readr       * 2.1.0   2021-11-11 [1] standard (@2.1.0) 
#>  readxl        1.3.1   2019-03-13 [1] standard (@1.3.1) 
#>  reprex        2.0.1   2021-08-05 [1] standard (@2.0.1) 
#>  rlang         0.4.12  2021-10-18 [1] standard (@0.4.12)
#>  rmarkdown     2.11    2021-09-14 [1] standard (@2.11)  
#>  rvest         1.0.0   2021-03-09 [1] standard (@1.0.0) 
#>  scales        1.1.1   2020-05-11 [1] standard (@1.1.1) 
#>  sessioninfo   1.1.1   2018-11-05 [1] standard (@1.1.1) 
#>  stringi       1.7.5   2021-10-04 [1] standard (@1.7.5) 
#>  stringr     * 1.4.0   2019-02-10 [1] standard (@1.4.0) 
#>  styler        1.4.1   2021-03-30 [1] standard (@1.4.1) 
#>  tibble      * 3.1.6   2021-11-07 [1] standard (@3.1.6) 
#>  tidyr       * 1.1.4   2021-09-27 [1] standard (@1.1.4) 
#>  tidyselect    1.1.1   2021-04-30 [1] standard (@1.1.1) 
#>  tidyverse   * 1.3.1   2021-04-15 [1] standard (@1.3.1) 
#>  tzdb          0.2.0   2021-10-27 [1] standard (@0.2.0) 
#>  utf8          1.2.2   2021-07-24 [1] standard (@1.2.2) 
#>  vctrs         0.3.8   2021-04-29 [1] standard (@0.3.8) 
#>  withr         2.4.2   2021-04-18 [1] standard (@2.4.2) 
#>  xfun          0.27    2021-10-18 [1] standard (@0.27)  
#>  xml2          1.3.2   2020-04-23 [1] standard (@1.3.2) 
#>  yaml          2.2.1   2020-02-01 [1] standard (@2.2.1) 
#> 
#> [1] /Library/Frameworks/R.framework/Versions/4.1/Resources/library
```

</details>

</div>

<div class="panel">

<span class="panel-name">Clipboard</span>

```` markdown
``` r
library(tidyverse)

tibble(date = "2020-01-01") %>%
  mutate(year = case_when(
    date <= "2020-12-31" & date >= "2020-01-01" ~ 2020,
    is.na(date) ~ NA
  ))
#> Error: Problem with `mutate()` column `year`.
#> ℹ `year = case_when(...)`.
#> ✖ must be a double vector, not a logical vector.
```

<sup>Created on 2021-12-03 by the [reprex package](https://reprex.tidyverse.org) (v2.0.1)</sup>

<details style="margin-bottom:10px;">
<summary>
Session info
</summary>

``` r
sessioninfo::session_info()
#> ─ Session info ───────────────────────────────────────────────────────────────
#>  setting  value                       
#>  version  R version 4.1.0 (2021-05-18)
#>  os       macOS Big Sur 10.16         
#>  system   x86_64, darwin17.0          
#>  ui       X11                         
#>  language (EN)                        
#>  collate  en_US.UTF-8                 
#>  ctype    en_US.UTF-8                 
#>  tz       America/New_York            
#>  date     2021-12-03                  
#> 
#> ─ Packages ───────────────────────────────────────────────────────────────────
#>  package     * version date       lib source            
#>  assertthat    0.2.1   2019-03-21 [1] standard (@0.2.1) 
#>  backports     1.3.0   2021-10-27 [1] standard (@1.3.0) 
#>  broom         0.7.6   2021-04-05 [1] standard (@0.7.6) 
#>  cellranger    1.1.0   2016-07-27 [1] standard (@1.1.0) 
#>  cli           3.1.0   2021-10-27 [1] standard (@3.1.0) 
#>  colorspace    2.0-1   2021-05-04 [1] standard (@2.0-1) 
#>  crayon        1.4.2   2021-10-29 [1] standard (@1.4.2) 
#>  DBI           1.1.1   2021-01-15 [1] standard (@1.1.1) 
#>  dbplyr        2.1.1   2021-04-06 [1] standard (@2.1.1) 
#>  digest        0.6.28  2021-09-23 [1] standard (@0.6.28)
#>  dplyr       * 1.0.7   2021-06-18 [1] standard (@1.0.7) 
#>  ellipsis      0.3.2   2021-04-29 [1] standard (@0.3.2) 
#>  evaluate      0.14    2019-05-28 [1] standard (@0.14)  
#>  fansi         0.5.0   2021-05-25 [1] standard (@0.5.0) 
#>  fastmap       1.1.0   2021-01-25 [1] standard (@1.1.0) 
#>  forcats     * 0.5.1   2021-01-27 [1] standard (@0.5.1) 
#>  fs            1.5.0   2020-07-31 [1] standard (@1.5.0) 
#>  generics      0.1.1   2021-10-25 [1] standard (@0.1.1) 
#>  ggplot2     * 3.3.5   2021-06-25 [1] standard (@3.3.5) 
#>  glue          1.5.0   2021-11-07 [1] standard (@1.5.0) 
#>  gtable        0.3.0   2019-03-25 [1] standard (@0.3.0) 
#>  haven         2.4.1   2021-04-23 [1] standard (@2.4.1) 
#>  highr         0.9     2021-04-16 [1] standard (@0.9)   
#>  hms           1.1.1   2021-09-26 [1] standard (@1.1.1) 
#>  htmltools     0.5.2   2021-08-25 [1] standard (@0.5.2) 
#>  httr          1.4.2   2020-07-20 [1] standard (@1.4.2) 
#>  jsonlite      1.7.2   2020-12-09 [1] standard (@1.7.2) 
#>  knitr         1.36    2021-09-29 [1] standard (@1.36)  
#>  lifecycle     1.0.1   2021-09-24 [1] standard (@1.0.1) 
#>  lubridate     1.8.0   2021-10-07 [1] standard (@1.8.0) 
#>  magrittr      2.0.1   2020-11-17 [1] standard (@2.0.1) 
#>  modelr        0.1.8   2020-05-19 [1] standard (@0.1.8) 
#>  munsell       0.5.0   2018-06-12 [1] standard (@0.5.0) 
#>  pillar        1.6.4   2021-10-18 [1] standard (@1.6.4) 
#>  pkgconfig     2.0.3   2019-09-22 [1] standard (@2.0.3) 
#>  purrr       * 0.3.4   2020-04-17 [1] standard (@0.3.4) 
#>  R6            2.5.1   2021-08-19 [1] standard (@2.5.1) 
#>  Rcpp          1.0.7   2021-07-07 [1] standard (@1.0.7) 
#>  readr       * 2.1.0   2021-11-11 [1] standard (@2.1.0) 
#>  readxl        1.3.1   2019-03-13 [1] standard (@1.3.1) 
#>  reprex        2.0.1   2021-08-05 [1] standard (@2.0.1) 
#>  rlang         0.4.12  2021-10-18 [1] standard (@0.4.12)
#>  rmarkdown     2.11    2021-09-14 [1] standard (@2.11)  
#>  rvest         1.0.0   2021-03-09 [1] standard (@1.0.0) 
#>  scales        1.1.1   2020-05-11 [1] standard (@1.1.1) 
#>  sessioninfo   1.1.1   2018-11-05 [1] standard (@1.1.1) 
#>  stringi       1.7.5   2021-10-04 [1] standard (@1.7.5) 
#>  stringr     * 1.4.0   2019-02-10 [1] standard (@1.4.0) 
#>  styler        1.4.1   2021-03-30 [1] standard (@1.4.1) 
#>  tibble      * 3.1.6   2021-11-07 [1] standard (@3.1.6) 
#>  tidyr       * 1.1.4   2021-09-27 [1] standard (@1.1.4) 
#>  tidyselect    1.1.1   2021-04-30 [1] standard (@1.1.1) 
#>  tidyverse   * 1.3.1   2021-04-15 [1] standard (@1.3.1) 
#>  tzdb          0.2.0   2021-10-27 [1] standard (@0.2.0) 
#>  utf8          1.2.2   2021-07-24 [1] standard (@1.2.2) 
#>  vctrs         0.3.8   2021-04-29 [1] standard (@0.3.8) 
#>  withr         2.4.2   2021-04-18 [1] standard (@2.4.2) 
#>  xfun          0.27    2021-10-18 [1] standard (@0.27)  
#>  xml2          1.3.2   2020-04-23 [1] standard (@1.3.2) 
#>  yaml          2.2.1   2020-02-01 [1] standard (@2.2.1) 
#> 
#> [1] /Library/Frameworks/R.framework/Versions/4.1/Resources/library
```

</details>
````

</div>

</div>

## But wait, there’s more!

When you’re working on debugging something,
going from code in your RStudio IDE to something you can share with others is **huge**.
But <span class="pkg">reprex</span> can do more!

Because reprex uses `knitr::spin()` —
[*knitr’s best hidden gem* according to Dean Attali](https://deanattali.com/2015/03/24/knitrs-best-hidden-gem-spin/) —
to turn R code into an R Markdown document,
you have a few more options.

`knitr::spin()` has a cool feature that lets you write markdown *in an R script*.
You can check out
[Dean Attali’s post](https://deanattali.com/2015/03/24/knitrs-best-hidden-gem-spin/)
for more details,
but the gist is this:
any text on a line starting with a special comment format `#'`
becomes markdown.

This means we can add text directly to our reprex using these comments!
Below you can see that I’ve added some exposition around the problematic code.

<div class="panelset panelset--bordered">

<div class="panel">

<span class="panel-name">R Code</span>

``` r
#' I'm using the latest version of the `tidyverse`,
#' freshly installed.
library(tidyverse)

#' Suppose we have a data frame with a date column.
#' The date is stored as a _character_ vector, and
#' I'd like to convert it to a _year_ with a simple
#' comparison. The first function I thought of was
#' `case_when()`, but it doesn't seem to be doing
#' what I expect. Why am I getting this error?
tibble(date = "2020-01-01") %>%
  mutate(year = case_when(
    date <= "2020-12-31" & date >= "2020-01-01" ~ 2020,
    is.na(date) ~ NA
  ))
```

</div>

<div class="panel">

<span class="panel-name">Reprex Preview</span>

I’m using the latest version of the `tidyverse`,
freshly installed.

``` r
library(tidyverse)
```

Suppose we have a data frame with a date column.
The date is stored as a *character* vector, and
I’d like to convert it to a *year* with a simple
comparison. The first function I thought of was
`case_when()`, but it doesn’t seem to be doing
what I expect. Why am I getting this error?

``` r
tibble(date = "2020-01-01") %>%
  mutate(year = case_when(
    date <= "2020-12-31" & date >= "2020-01-01" ~ 2020,
    is.na(date) ~ NA
  ))
#> Error: Problem with `mutate()` column `year`.
#> ℹ `year = case_when(...)`.
#> ✖ must be a double vector, not a logical vector.
```

<sup>Created on 2021-12-03 by the [reprex package](https://reprex.tidyverse.org) (v2.0.1)</sup>

<details style="margin-bottom:10px;">
<summary>
Session info
</summary>

``` r
sessioninfo::session_info()
#> ─ Session info ───────────────────────────────────────────────────────────────
#>  setting  value                       
#>  version  R version 4.1.0 (2021-05-18)
#>  os       macOS Big Sur 10.16         
#>  system   x86_64, darwin17.0          
#>  ui       X11                         
#>  language (EN)                        
#>  collate  en_US.UTF-8                 
#>  ctype    en_US.UTF-8                 
#>  tz       America/New_York            
#>  date     2021-12-03                  
#> 
#> ─ Packages ───────────────────────────────────────────────────────────────────
#>  package     * version date       lib source            
#>  assertthat    0.2.1   2019-03-21 [1] standard (@0.2.1) 
#>  backports     1.3.0   2021-10-27 [1] standard (@1.3.0) 
#>  broom         0.7.6   2021-04-05 [1] standard (@0.7.6) 
#>  cellranger    1.1.0   2016-07-27 [1] standard (@1.1.0) 
#>  cli           3.1.0   2021-10-27 [1] standard (@3.1.0) 
#>  colorspace    2.0-1   2021-05-04 [1] standard (@2.0-1) 
#>  crayon        1.4.2   2021-10-29 [1] standard (@1.4.2) 
#>  DBI           1.1.1   2021-01-15 [1] standard (@1.1.1) 
#>  dbplyr        2.1.1   2021-04-06 [1] standard (@2.1.1) 
#>  digest        0.6.28  2021-09-23 [1] standard (@0.6.28)
#>  dplyr       * 1.0.7   2021-06-18 [1] standard (@1.0.7) 
#>  ellipsis      0.3.2   2021-04-29 [1] standard (@0.3.2) 
#>  evaluate      0.14    2019-05-28 [1] standard (@0.14)  
#>  fansi         0.5.0   2021-05-25 [1] standard (@0.5.0) 
#>  fastmap       1.1.0   2021-01-25 [1] standard (@1.1.0) 
#>  forcats     * 0.5.1   2021-01-27 [1] standard (@0.5.1) 
#>  fs            1.5.0   2020-07-31 [1] standard (@1.5.0) 
#>  generics      0.1.1   2021-10-25 [1] standard (@0.1.1) 
#>  ggplot2     * 3.3.5   2021-06-25 [1] standard (@3.3.5) 
#>  glue          1.5.0   2021-11-07 [1] standard (@1.5.0) 
#>  gtable        0.3.0   2019-03-25 [1] standard (@0.3.0) 
#>  haven         2.4.1   2021-04-23 [1] standard (@2.4.1) 
#>  highr         0.9     2021-04-16 [1] standard (@0.9)   
#>  hms           1.1.1   2021-09-26 [1] standard (@1.1.1) 
#>  htmltools     0.5.2   2021-08-25 [1] standard (@0.5.2) 
#>  httr          1.4.2   2020-07-20 [1] standard (@1.4.2) 
#>  jsonlite      1.7.2   2020-12-09 [1] standard (@1.7.2) 
#>  knitr         1.36    2021-09-29 [1] standard (@1.36)  
#>  lifecycle     1.0.1   2021-09-24 [1] standard (@1.0.1) 
#>  lubridate     1.8.0   2021-10-07 [1] standard (@1.8.0) 
#>  magrittr      2.0.1   2020-11-17 [1] standard (@2.0.1) 
#>  modelr        0.1.8   2020-05-19 [1] standard (@0.1.8) 
#>  munsell       0.5.0   2018-06-12 [1] standard (@0.5.0) 
#>  pillar        1.6.4   2021-10-18 [1] standard (@1.6.4) 
#>  pkgconfig     2.0.3   2019-09-22 [1] standard (@2.0.3) 
#>  purrr       * 0.3.4   2020-04-17 [1] standard (@0.3.4) 
#>  R6            2.5.1   2021-08-19 [1] standard (@2.5.1) 
#>  Rcpp          1.0.7   2021-07-07 [1] standard (@1.0.7) 
#>  readr       * 2.1.0   2021-11-11 [1] standard (@2.1.0) 
#>  readxl        1.3.1   2019-03-13 [1] standard (@1.3.1) 
#>  reprex        2.0.1   2021-08-05 [1] standard (@2.0.1) 
#>  rlang         0.4.12  2021-10-18 [1] standard (@0.4.12)
#>  rmarkdown     2.11    2021-09-14 [1] standard (@2.11)  
#>  rvest         1.0.0   2021-03-09 [1] standard (@1.0.0) 
#>  scales        1.1.1   2020-05-11 [1] standard (@1.1.1) 
#>  sessioninfo   1.1.1   2018-11-05 [1] standard (@1.1.1) 
#>  stringi       1.7.5   2021-10-04 [1] standard (@1.7.5) 
#>  stringr     * 1.4.0   2019-02-10 [1] standard (@1.4.0) 
#>  styler        1.4.1   2021-03-30 [1] standard (@1.4.1) 
#>  tibble      * 3.1.6   2021-11-07 [1] standard (@3.1.6) 
#>  tidyr       * 1.1.4   2021-09-27 [1] standard (@1.1.4) 
#>  tidyselect    1.1.1   2021-04-30 [1] standard (@1.1.1) 
#>  tidyverse   * 1.3.1   2021-04-15 [1] standard (@1.3.1) 
#>  tzdb          0.2.0   2021-10-27 [1] standard (@0.2.0) 
#>  utf8          1.2.2   2021-07-24 [1] standard (@1.2.2) 
#>  vctrs         0.3.8   2021-04-29 [1] standard (@0.3.8) 
#>  withr         2.4.2   2021-04-18 [1] standard (@2.4.2) 
#>  xfun          0.27    2021-10-18 [1] standard (@0.27)  
#>  xml2          1.3.2   2020-04-23 [1] standard (@1.3.2) 
#>  yaml          2.2.1   2020-02-01 [1] standard (@2.2.1) 
#> 
#> [1] /Library/Frameworks/R.framework/Versions/4.1/Resources/library
```

</details>

</div>

<div class="panel">

<span class="panel-name">Clipboard</span>

```` markdown
I’m using the latest version of the `tidyverse`,
freshly installed.

``` r
library(tidyverse)
```

Suppose we have a data frame with a date column.
The date is stored as a *character* vector, and
I’d like to convert it to a *year* with a simple
comparison. The first function I thought of was
`case_when()`, but it doesn’t seem to be doing
what I expect. Why am I getting this error?

``` r
tibble(date = "2020-01-01") %>%
  mutate(year = case_when(
    date <= "2020-12-31" & date >= "2020-01-01" ~ 2020,
    is.na(date) ~ NA
  ))
#> Error: Problem with `mutate()` column `year`.
#> ℹ `year = case_when(...)`.
#> ✖ must be a double vector, not a logical vector.
```

<sup>Created on 2021-12-03 by the [reprex package](https://reprex.tidyverse.org) (v2.0.1)</sup>

<details style="margin-bottom:10px;">
<summary>
Session info
</summary>

``` r
sessioninfo::session_info()
#> ─ Session info ───────────────────────────────────────────────────────────────
#>  setting  value                       
#>  version  R version 4.1.0 (2021-05-18)
#>  os       macOS Big Sur 10.16         
#>  system   x86_64, darwin17.0          
#>  ui       X11                         
#>  language (EN)                        
#>  collate  en_US.UTF-8                 
#>  ctype    en_US.UTF-8                 
#>  tz       America/New_York            
#>  date     2021-12-03                  
#> 
#> ─ Packages ───────────────────────────────────────────────────────────────────
#>  package     * version date       lib source            
#>  assertthat    0.2.1   2019-03-21 [1] standard (@0.2.1) 
#>  backports     1.3.0   2021-10-27 [1] standard (@1.3.0) 
#>  broom         0.7.6   2021-04-05 [1] standard (@0.7.6) 
#>  cellranger    1.1.0   2016-07-27 [1] standard (@1.1.0) 
#>  cli           3.1.0   2021-10-27 [1] standard (@3.1.0) 
#>  colorspace    2.0-1   2021-05-04 [1] standard (@2.0-1) 
#>  crayon        1.4.2   2021-10-29 [1] standard (@1.4.2) 
#>  DBI           1.1.1   2021-01-15 [1] standard (@1.1.1) 
#>  dbplyr        2.1.1   2021-04-06 [1] standard (@2.1.1) 
#>  digest        0.6.28  2021-09-23 [1] standard (@0.6.28)
#>  dplyr       * 1.0.7   2021-06-18 [1] standard (@1.0.7) 
#>  ellipsis      0.3.2   2021-04-29 [1] standard (@0.3.2) 
#>  evaluate      0.14    2019-05-28 [1] standard (@0.14)  
#>  fansi         0.5.0   2021-05-25 [1] standard (@0.5.0) 
#>  fastmap       1.1.0   2021-01-25 [1] standard (@1.1.0) 
#>  forcats     * 0.5.1   2021-01-27 [1] standard (@0.5.1) 
#>  fs            1.5.0   2020-07-31 [1] standard (@1.5.0) 
#>  generics      0.1.1   2021-10-25 [1] standard (@0.1.1) 
#>  ggplot2     * 3.3.5   2021-06-25 [1] standard (@3.3.5) 
#>  glue          1.5.0   2021-11-07 [1] standard (@1.5.0) 
#>  gtable        0.3.0   2019-03-25 [1] standard (@0.3.0) 
#>  haven         2.4.1   2021-04-23 [1] standard (@2.4.1) 
#>  highr         0.9     2021-04-16 [1] standard (@0.9)   
#>  hms           1.1.1   2021-09-26 [1] standard (@1.1.1) 
#>  htmltools     0.5.2   2021-08-25 [1] standard (@0.5.2) 
#>  httr          1.4.2   2020-07-20 [1] standard (@1.4.2) 
#>  jsonlite      1.7.2   2020-12-09 [1] standard (@1.7.2) 
#>  knitr         1.36    2021-09-29 [1] standard (@1.36)  
#>  lifecycle     1.0.1   2021-09-24 [1] standard (@1.0.1) 
#>  lubridate     1.8.0   2021-10-07 [1] standard (@1.8.0) 
#>  magrittr      2.0.1   2020-11-17 [1] standard (@2.0.1) 
#>  modelr        0.1.8   2020-05-19 [1] standard (@0.1.8) 
#>  munsell       0.5.0   2018-06-12 [1] standard (@0.5.0) 
#>  pillar        1.6.4   2021-10-18 [1] standard (@1.6.4) 
#>  pkgconfig     2.0.3   2019-09-22 [1] standard (@2.0.3) 
#>  purrr       * 0.3.4   2020-04-17 [1] standard (@0.3.4) 
#>  R6            2.5.1   2021-08-19 [1] standard (@2.5.1) 
#>  Rcpp          1.0.7   2021-07-07 [1] standard (@1.0.7) 
#>  readr       * 2.1.0   2021-11-11 [1] standard (@2.1.0) 
#>  readxl        1.3.1   2019-03-13 [1] standard (@1.3.1) 
#>  reprex        2.0.1   2021-08-05 [1] standard (@2.0.1) 
#>  rlang         0.4.12  2021-10-18 [1] standard (@0.4.12)
#>  rmarkdown     2.11    2021-09-14 [1] standard (@2.11)  
#>  rvest         1.0.0   2021-03-09 [1] standard (@1.0.0) 
#>  scales        1.1.1   2020-05-11 [1] standard (@1.1.1) 
#>  sessioninfo   1.1.1   2018-11-05 [1] standard (@1.1.1) 
#>  stringi       1.7.5   2021-10-04 [1] standard (@1.7.5) 
#>  stringr     * 1.4.0   2019-02-10 [1] standard (@1.4.0) 
#>  styler        1.4.1   2021-03-30 [1] standard (@1.4.1) 
#>  tibble      * 3.1.6   2021-11-07 [1] standard (@3.1.6) 
#>  tidyr       * 1.1.4   2021-09-27 [1] standard (@1.1.4) 
#>  tidyselect    1.1.1   2021-04-30 [1] standard (@1.1.1) 
#>  tidyverse   * 1.3.1   2021-04-15 [1] standard (@1.3.1) 
#>  tzdb          0.2.0   2021-10-27 [1] standard (@0.2.0) 
#>  utf8          1.2.2   2021-07-24 [1] standard (@1.2.2) 
#>  vctrs         0.3.8   2021-04-29 [1] standard (@0.3.8) 
#>  withr         2.4.2   2021-04-18 [1] standard (@2.4.2) 
#>  xfun          0.27    2021-10-18 [1] standard (@0.27)  
#>  xml2          1.3.2   2020-04-23 [1] standard (@1.3.2) 
#>  yaml          2.2.1   2020-02-01 [1] standard (@2.2.1) 
#> 
#> [1] /Library/Frameworks/R.framework/Versions/4.1/Resources/library
```

</details>
````

</div>

</div>

## There should be a shortcut

Kick-starting an issue report using a reprex
right from within my RStudio session is great,
but there’s still the part where I have to slog
out of my IDE,
into a browser,
and find my way to the repo where this issue should go.

Most of the time, though, I’m already **in the repo**.
And <span class="pkg">usethis</span> has
[a helpful function](https://usethis.r-lib.org/reference/browse-this.html)
to get me right to the issues page:

``` r
usethis::browse_github_issues()
```

But there’s too much typing.
I want reprex to issue, *with magic* 🧙 ✨.

So that’s what we’ll do!
In the rest of this post,
we’ll use <span class="pkg">reprex</span> and the <span class="pkg">[rstudioapi](https://rstudio.github.io/rstudioapi/)</span> package
to automatically go from code to GitHub issue.
Then we’ll wrap that logic into a function
and turn it into an RStudio Addin with my package, <span class="pkg">[shrtcts](https://pkg.garrickadenbuie.com/shrtcts)</span>.

## From reprex to issue

Suppose we have some `input` code and a target `repo`.
Maybe we have a classic missing argument error
and we want to send the issue to [gadenbuie/shrtcts](https://github.com/gadenbuie/shrtcts)
(please don’t!).

``` r
input <- "runif(min = 0, max = 10)\n"
repo <- "gadenbuie/shrtcts"
```

### Prepare the issue body

Our goal is to render the reprex into an issue `body`
and then we’ll put together a URL
that takes us to GitHub’s
[new issue page](https://github.com/gadenbuie/shrtcts/issues/new)
for the `repo` with the issue `body` pre-filled when we get there.

``` r
body <- "... reprex body goes here ..."
url_new_issue <- glue::glue("https://github.com/{repo}/issues/new?body={body}")
browseURL(url_new_issue)
```

The trick here is that you can create a new issue by going to
`github.com/{owner}/{repo}/issues/new`
and we’re sending along the initial body using
[the query string](https://url.spec.whatwg.org/#dom-urlsearchparams-urlsearchparams)
`?body={body}`.

To put together the `body`, we first render the `input` using `reprex::reprex()`

``` r
body <- reprex::reprex(input = input, venue = "gh", html_preview = TRUE)
```

where we’ve asked for a reprex for GitHub — `venue = "gh"` —
and a local HTML preview — `html_preview = TRUE`.
You can adjust the arguments to `reprex()` to fit your needs, of course.

Unfortunately, `reprex::repex()` is only half the work…

``` r
body <- reprex::reprex(input = input, venue = "gh", html_preview = TRUE)
body
```

    ## [1] "``` r"                                                                           
    ## [2] "runif(min = 0, max = 10)"                                                        
    ## [3] "#> Error in runif(min = 0, max = 10): argument \"n\" is missing, with no default"
    ## [4] "```"

Notice that it returns a character vector
with one item per line of the rendered reprex.
We need to collapse it all into a single string.

``` r
body <- paste(body, collapse = "\n")
```

    ## [1] "``` r\nrunif(min = 0, max = 10)\n#> Error in runif(min = 0, max = 10): argument \"n\" is missing, with no default\n```"

But this still won’t fit in a URL
because it contains spaces, new lines, and other characters URLs don’t like.
So we need to use the base R function `URLencode()`
to turn the `body` text into something readable only by machines.

``` r
body <- URLencode(body, reserved = TRUE)
```

    ## [1] "%60%60%60%20r%0Arunif%28min%20%3D%200%2C%20max%20%3D%2010%29%0A%23%3E%20Error%20in%20runif%28min%20%3D%200%2C%20max%20%3D%2010%29%3A%20argument%20%22n%22%20is%20missing%2C%20with%20no%20default%0A%60%60%60"

Finally, we can make our new issue URL.

``` r
url_new_issue <- glue::glue("https://github.com/{repo}/issues/new?body={body}")
url_new_issue
```

    ## https://github.com/gadenbuie/shrtcts/issues/new?body=%60%60%60%20r%0Arunif%28min%20%3D%200%2C%20max%20%3D%2010%29%0A%23%3E%20Error%20in%20runif%28min%20%3D%200%2C%20max%20%3D%2010%29%3A%20argument%20%22n%22%20is%20missing%2C%20with%20no%20default%0A%60%60%60

I didn’t make the link clickable,
but if you were to follow it,
you’d find a brand new issue page ready for you.

![A new GitHub issue page with our reprex as the issue body](reprex-new-issue.png)

### Grab the input from the user

Of course,
we don’t want to have to define `input` manualy every time we run this function.
Instead, we’d rather get the `input` code from

-   the current selection in RStudio
-   or the clipboard if nothing is selected

To make things easy,
we’ll ignore the fact that RStudio has a multiple cursors feature,
and we’ll just get the first selection of code.
We’ll use the `getSourceEditorContext()` to get the currently open text file,
then we can grab the text from the first selection in that editor window.

``` r
ctx <- rstudioapi::getSourceEditorContext()
selection <- ctx$selection[[1]]$text
```

If nothing is selected, `selection` will be an empty string, `""`,
in which case we’d prefer to leave `input` as `NULL`
so that `reprex()` will look in the clipboard for our input.
We also need to make sure that `input` is a character vector
so that `reprex()` knows that `input` contains the reprex code and not a path to a file.

``` r
input <- if (nzchar(selection)) {
  c(strsplit(selection, "\n")[[1]], "")
}
```

We’ll be wrapping this up in a function where
`input` might be provided by the user,
so we’ll only want to check for a selection if `input` is `NULL`.

``` r
if (is.null(input)) {
  ctx <- rstudioapi::getSourceEditorContext()
  selection <- ctx$selection[[1]]$text
  input <- if (nzchar(selection)) {
    c(strsplit(selection, "\n")[[1]], "")
  }
}
```

### Pick the repository

Often, I’ll be working in the repository where I want to create the issue.
<span class="pkg">usethis</span> does a great job guessing the repository
from the information in a local copy of the repo.
Rather than spending forever writing our own version,
let’s just reach into <span class="pkg">usethis</span> with `:::` to call `target_repo_spec()`.

The function returns the current repo in the form `"owner/repo"`,
but since it isn’t designed to be user-facing
it throws an unusual error when called from outside a git repository.
We can soften this edge by catching the error with `tryCatch()`
and replacing the error with a `NULL` value.

``` r
repo_guess <- tryCatch(
  usethis:::target_repo_spec("source", FALSE),
  error = function(err) NULL
)
```

Of course, maybe I’ll want to create a reprex
in *another* repository that isn’t the one I’m currently working in.
So we can follow up with a prompt asking for the repo,
using our guess from <span class="pkg">usethis</span>.
The prompt is created with the `showPrompt()` function from <span class="pkg">rstudioapi</span>.

``` r
repo <- rstudioapi::showPrompt(
  title = "Which repository?",
  message = "Where should we create the issue? (owner/repo)",
  default = repo_guess
)
```

<p class="center">
<img src="ask-repo-manual.png" alt="RStudio menu asking to the user to manually enter a repository." style="max-width:min(400px, 100%);display: block">
</p>

Finally, the function we’re putting together will also take a `repo` argument
that *might be* provided when we call it.
In that case,
we’d wouldn’t need to guess or ask for a repo.

``` r
if (is.null(repo)) {
  repo_guess <- tryCatch(
    usethis:::target_repo_spec("source", FALSE),
    error = function(err) NULL
  )

  repo <- rstudioapi::showPrompt(
    title = "Which repository?",
    message = "Where should we create the issue? (owner/repo)",
    default = repo_guess
  )
}
```

## Make it a shortcut

The last step in our process is to make it easy to run this code in RStudio,
ideally as an
[RStudio addin](https://rstudio.github.io/rstudioaddins/)
that we can activate from the addins menu or
[the command palette](https://blog.rstudio.com/2020/10/14/rstudio-v1-4-preview-command-palette/).

This is the exact goal of the <span class="pkg">[shrtcts](https://pkg.garrickadenbuie.com/shrtcts)</span> package:
<span class="pkg">shrtcts</span> lets you turn any function into an RStudio addin.

### Set up `shrtcts`

If you’ve never used <span class="pkg">shrtcts</span> before,
you need to do two things to get started.
First, install the package,
from [my R-universe](https://gadenbuie.r-universe.dev)
or from [GitHub](https://github.com/gadenbuie/shrtcts).

<div class="panelset panelset--bordered">

<div class="panel">

<span class="panel-name">R-universe</span>

``` r
# Add my universe to your list of repos
options(repos = c(
  gadenbuie = "https://gadenbuie.r-universe.dev",
  getOption("repos")
))

install.package("shrtcts")
```

</div>

<div class="panel">

<span class="panel-name">GitHub</span>

``` r
# install.packages("remotes")

remotes::install_github("gadenbuie/shrtcts")
```

</div>

</div>

The next thing to do is to open a `.shrtcts.R` file
where we’ll add our new shortcut.
This is easy to do with `shrtcts::edit_shortcuts()`,
which will offer to create the `.shrtcts.R` file if it doesn’t exit.

``` r
shrtcts::edit_shortcuts()
```

    Would you like to create a new shrtcts file at
    '~/Library/Application Support/shrtcts/.shrtcts.R' (Yes/no/cancel) yes

### Creating a shortcut function

We’ll write R functions in the `.shrtcts.R` file
and turn them into RStudio addins
by annotating those functions with roxygen-style comments.

We start with a skeleton of a function that takes two arguments:
`input` and `repo`,
neither of which are required.
Inside the function, we’ll do all the steps from above,
which we’ll fill in in a second.

``` r
create_issue_from_reprex <- function(input = NULL, repo = NULL) {
  # guess or ask for repo
  # get current selection, if available
  # render reprex
  # compose new issue URL
  # go to the new issue page!
}
```

Our next step is to turn this function into a shortcut.
Using <span class="pkg">[roxygen2](https://roxygen2.r-lib.org/)</span> documentation syntax,
we give the function a title and description —
these will be used as the title and description of the shortcut.
We can also use the `@shortcut` tag to set a keyboard shortcut (if you want),
and the `@interactive` tag lets shortcuts know
that the addin should be run interactively rather than in the background.

``` r
#' Create issue from reprex
#'
#' Creates an issue from the selected or copied reprex.
#'
#' @shortcut Cmd+Ctrl+Shift+R
#' @interactive
create_issue_from_reprex <- function(input = NULL, repo = NULL) {
  # guess or ask for repo
  # get current selection, if available
  # render reprex
  # compose new issue URL
  # go to the new issue page!
}
```

Finally, we can replace our placeholder comments
with all of the code we wrote above.

``` r
#' Create issue from reprex
#'
#' Creates an issue from the selected or copied reprex.
#'
#' @shortcut Cmd+Ctrl+Shift+R
#' @interactive
create_issue_from_reprex <- function(input = NULL, repo = NULL) {
  if (is.null(repo)) {
    repo_guess <- tryCatch(
      usethis:::target_repo_spec("source", FALSE),
      error = function(err) NULL
    )
  
    repo <- rstudioapi::showPrompt(
      title = "Which repository?",
      message = "Where should we create the issue? (owner/repo)",
      default = repo_guess
    )
  }

  if (is.null(input)) {
    ctx <- rstudioapi::getSourceEditorContext()
    selection <- ctx$selection[[1]]$text
    input <- if (nzchar(selection)) {
      c(strsplit(selection, "\n")[[1]], "")
    }
  }

  body <- reprex::reprex(input = input, venue = "gh", html_preview = TRUE)
  body <- paste(body, collapse = "\n")
  body <- URLencode(body, reserved = TRUE)
  url_new_issue <- glue::glue("https://github.com/{repo}/issues/new?body={body}")
  browseURL(url_new_issue)
  invisible(url_new_issue)
}
```

Load your shortcuts and restart your R session to activate the addin
and you’ll be ready to jump from reprex to GitHub issue in no time!

``` r
shrtcts::add_rstudio_shortcuts(set_keyboard_shortcuts = TRUE)
```

<div class="figure">

<img src="shrtcts-reprex.gif" alt="A demonstration of the reprex shortcut: highlight code in RStudio editor, run the 'reprex to issue' shortcut, and create a new github issue" >
<p class="caption">
The reprex to GitHub issue shortcut in action.
</p>

</div>
