---
title: A Calendar in Your R Console
author: Garrick Aden-Buie
date: '2020-09-21'
slug: r-console-calendar
categories:
  - Blog
tags:
  - R
  - lubridate
description: post description
images:
  - /blog/r-console-calendar/social-card.png
rmd_source: 'https://github.com/gadenbuie/garrickadenbuie-com/blob/main/content/blog/2020/2020-09-21-a-calendar-in-your-r-console.Rmd'
keywords: rstats
editor_options:
  chunk_output_type: console
---
<script src="/rmarkdown-libs/clipboard-2.0.6/clipboard.min.js"></script>
<link href="/rmarkdown-libs/xaringanExtra-clipboard-0.2.6/xaringanExtra-clipboard.css" rel="stylesheet" />
<script src="/rmarkdown-libs/xaringanExtra-clipboard-0.2.6/xaringanExtra-clipboard.js"></script>
<script>window.xaringanExtraClipboard(null, {"button":"Copy Code","success":"Copied!","error":"Press Ctrl+C to Copy"})</script>

<!-- Links -->
[lubridate]: https://lubridate.tidyverse.org





Today I was [nerd sniped](https://xkcd.com/356/)
by [Mike FC](https://coolbutuseless.com)
who goes by [&commat;coolbutuseless](https://twitter.com/coolbutuseless)
on Twitter despite the fact that he makes cool and useful things on the regular.

In his tweet, he shows a neat trick that works on Unix or macOS machines.
These systems come with a command-line utility called `cal` ([read more here](https://www.computerhope.com/unix/ucal.htm)).
By calling `cal` from the R console using `system()`,
you can print a calendar in your console.




```r
system("cal")
```

```
   November 2021
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30

```

Here's Mike's [original tweet](https://twitter.com/coolbutuseless/status/1308163906674790402).



<center><a href="https://twitter.com/coolbutuseless/status/1308163906674790402"><img src="coolbutuseless-tweet.png" style="width:100%;max-width:400px;" /></a></center>

This is neat and all, but it doesn't work on [Windows](https://twitter.com/davidbraze/status/1308177449784610817) &#x1F622; &#x1F937;&#x200D;.

So I used <span class="pkg"><span class="pkg">lubridate]</span> and [[crayon](https://github.com/r-lib/crayon)</span>
to recreate `cal` with an R function `cal()`.
I'm not going to do a full walk through of the code,
but I still wanted to share it.
Read on to explore the code or to try out the function yourself.

## Tidy Dates

The first step was to write a function to set up a data frame of dates.
This I cribbed heavily from <span class="pkg">[ggweekly](/blog/ggplot2-weekly-planner/)</span>.


```r
make_month_dates <- function(start_date, end_date, week_start = 1) {
  if (identical(week_start, 7)) {
    get_week <- lubridate::epiweek
    get_year <- lubridate::epiyear
  } else if (identical(week_start, 1)) {
    get_week <- lubridate::isoweek
    get_year <- lubridate::isoyear
  }

  if (!inherits(start_date, "Date")) {
    start_date <- lubridate::ymd(start_date, truncated = 1)
  }
  if (!inherits(end_date, "Date")) {
    end_date <- lubridate::ymd(end_date, truncated = 1)
  }

  start_date <- lubridate::floor_date(start_date, "month")
  end_date <- lubridate::rollback(lubridate::ceiling_date(end_date, "month"))

  tibble::tibble(
    date      = seq(start_date, end_date, by = "day"),
    day       = lubridate::day(date),
    wday      = lubridate::wday(.data$date, label = FALSE, abbr = TRUE, week_start = week_start),
    weekend   = lubridate::wday(.data$date, label = FALSE, week_start = 1) %in% 6:7,
    week      = get_week(.data$date),
    month     = lubridate::month(.data$date, label = TRUE, abbr = FALSE),
    month_int = lubridate::month(.data$date, label = FALSE),
    year      = get_year(.data$date)
  )
}
```

The `make_month_dates()` function takes a full year-month-day or a year-month
and returns the dates between the month start of the `start_date`
and the month end of the `end_date`.
Weeks can start on Monday (`1`) or Sunday (`7`).


```r
make_month_dates("2020-09", "2020-11", week_start = 1)
```

```
## # A tibble: 91 × 8
##    date         day  wday weekend  week month     month_int  year
##    <date>     <int> <dbl> <lgl>   <dbl> <ord>         <dbl> <dbl>
##  1 2020-09-01     1     2 FALSE      36 September         9  2020
##  2 2020-09-02     2     3 FALSE      36 September         9  2020
##  3 2020-09-03     3     4 FALSE      36 September         9  2020
##  4 2020-09-04     4     5 FALSE      36 September         9  2020
##  5 2020-09-05     5     6 TRUE       36 September         9  2020
##  6 2020-09-06     6     7 TRUE       36 September         9  2020
##  7 2020-09-07     7     1 FALSE      37 September         9  2020
##  8 2020-09-08     8     2 FALSE      37 September         9  2020
##  9 2020-09-09     9     3 FALSE      37 September         9  2020
## 10 2020-09-10    10     4 FALSE      37 September         9  2020
## # … with 81 more rows
```

## Make it a Calendar

The next step is to wrangle the dates into a calendar shape.
For this step, I used <span class="pkg">dplyr</span>, <span class="pkg">tidyr</span>, and <span class="pkg">lubridate</span> together.

The gist of the process is to

1. Fill in the blank days for "missing" weekdays in the first or last week of each month

1. Create the month-calendar title and collapse each week into a single line

1. Determine how many calendars fit on each row and paste each *n*th week together into a single line

1. Finally print each line to print rows of calendars!

Check out the whole function below for the complete details.
I used package prefixes (and `cur_group_id()` from <span class="pkg">dplyr</span> 1.0.0),
and I inlined the code from `make_month_dates()` above to facilitate copy-pasting-calendaring.

<h4 id="code-cal" class="js-expandmore expand-for-code">R code</h4>

<div class="js-to_expand is-opened">


```r
cal <- function(
  start_date = lubridate::today(),
  end_date = start_date + 28,
  week_start = 1
) {
  `%>%` <- dplyr::`%>%`

  if (!inherits(start_date, "Date")) {
    start_date <- lubridate::ymd(start_date, truncated = 1)
  }
  if (!inherits(end_date, "Date")) {
    end_date <- lubridate::ymd(end_date, truncated = 1)
  }

  start_date <- lubridate::floor_date(start_date, "month")
  end_date <- lubridate::rollback(lubridate::ceiling_date(end_date, "month"))

  tibble::tibble(
    date      = seq(start_date, end_date, by = "day"),
    day       = lubridate::day(date),
    wday      = lubridate::wday(.data$date, label = FALSE, abbr = TRUE, week_start = week_start),
    weekend   = lubridate::wday(.data$date, label = FALSE, week_start = 1) %in% 6:7,
    week      = as.integer(lubridate::floor_date(.data$date, unit = "week", week_start = week_start)),
    month     = lubridate::month(.data$date, label = TRUE, abbr = FALSE),
    month_int = lubridate::month(.data$date, label = FALSE),
    year      = lubridate::year(lubridate::floor_date(.data$date, unit = "year", week_start = week_start))
  ) %>%
    dplyr::group_by(month, year) %>%
    dplyr::mutate(week = week - min(week) + 1) %>%
    dplyr::ungroup() %>%
    tidyr::complete(tidyr::nesting(year, month_int, month), wday = 1:7, week) %>%
    dplyr::arrange(year, month_int, week, wday) %>%
    dplyr::mutate(
      day = sprintf("%2s", day),
      day = dplyr::if_else(weekend, as.character(crayon::silver(day)), day),
      day = dplyr::if_else(
        date == lubridate::today(),
        as.character(crayon::bold(crayon::red(day))),
        day
      ),
      month_label = paste(month, year)
    ) %>%
    tidyr::replace_na(list(day = "  ")) %>%
    dplyr::group_by(year, month_int, month_label, week) %>%
    dplyr::summarize(day = paste(day, collapse = " "), .groups = "drop") %>%
    dplyr::group_by(month_int) %>%
    dplyr::mutate(
      width = max(crayon::col_nchar(day)),
      day = crayon::col_align(day, width = width, align = "right"),
      month_label = crayon::col_align(month_label, width = width, align = "center"),
      month_label = crayon::bold(month_label)
    ) %>%
    dplyr::ungroup() %>%
    dplyr::bind_rows(
      dplyr::distinct(., year, month_int, day = month_label, week = 0)
    ) %>%
    dplyr::mutate(width = max(crayon::col_nchar(day))) %>%
    dplyr::arrange(year, month_int, week) %>%
    dplyr::group_by(year, month_int) %>%
    dplyr::mutate(
      row = dplyr::cur_group_id() - 1,
      row = floor(row / (getOption("width") %/% (width + 2))),
    ) %>%
    dplyr::group_by(row, week) %>%
    dplyr::summarize(text = paste(day, collapse = "    "), .groups = "drop_last") %>%
    dplyr::mutate(text = dplyr::if_else(week == max(week), paste0(text, "\n"), text)) %>%
    dplyr::pull(text) %>%
    cli::cat_line()
}
```

Phew, that's a lot.
But now I have a function `cal()` that prints out a calendar in my R console!

</div>

<STYLE type='text/css' scoped>
PRE.fansi SPAN {padding-top: .25em; padding-bottom: .25em};
</STYLE>


```r
cal("2020-09", "2020-12")
```

<PRE class="fansi fansi-output"><CODE><span style='font-weight: bold;'>   September 2020   </span>    <span style='font-weight: bold;'>    October 2020    </span>
    1  2  3  4 <span style='color: #555555;'> 5</span> <span style='color: #555555;'> 6</span>              1  2 <span style='color: #555555;'> 3</span> <span style='color: #555555;'> 4</span>
 7  8  9 10 11 <span style='color: #555555;'>12</span> <span style='color: #555555;'>13</span>     5  6  7  8  9 <span style='color: #555555;'>10</span> <span style='color: #555555;'>11</span>
14 15 16 17 18 <span style='color: #555555;'>19</span> <span style='color: #555555;'>20</span>    12 13 14 15 16 <span style='color: #555555;'>17</span> <span style='color: #555555;'>18</span>
21 22 23 24 25 <span style='color: #555555;'>26</span> <span style='color: #555555;'>27</span>    19 20 21 22 23 <span style='color: #555555;'>24</span> <span style='color: #555555;'>25</span>
28 29 30                26 27 28 29 30 <span style='color: #555555;'>31</span>


<span style='font-weight: bold;'>    November 2020   </span>    <span style='font-weight: bold;'>    December 2020   </span>
                  <span style='color: #555555;'> 1</span>        1  2  3  4 <span style='color: #555555;'> 5</span> <span style='color: #555555;'> 6</span>
 2  3  4  5  6 <span style='color: #555555;'> 7</span> <span style='color: #555555;'> 8</span>     7  8  9 10 11 <span style='color: #555555;'>12</span> <span style='color: #555555;'>13</span>
 9 10 11 12 13 <span style='color: #555555;'>14</span> <span style='color: #555555;'>15</span>    14 15 16 17 18 <span style='color: #555555;'>19</span> <span style='color: #555555;'>20</span>
16 17 18 19 20 <span style='color: #555555;'>21</span> <span style='color: #555555;'>22</span>    21 22 23 24 25 <span style='color: #555555;'>26</span> <span style='color: #555555;'>27</span>
23 24 25 26 27 <span style='color: #555555;'>28</span> <span style='color: #555555;'>29</span>    28 29 30 31
30
</CODE></PRE>

***

Edited on 2021-01-28 to fix a bug that caused days whose ISO weeks occur in an earlier year —
e.g. 2021-01-01 is assigned to week 53 of 2020 —
to appear in an incorrect year. Thanks [&commat;Darkyben](https://twitter.com/Darkyben/status/1354740287877378048)!
