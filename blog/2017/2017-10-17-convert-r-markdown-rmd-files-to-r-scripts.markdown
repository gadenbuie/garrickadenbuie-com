---
title: Convert R Markdown (Rmd) Files to R Scripts
author: Garrick Aden-Buie
date: '2017-10-17'
slug: convert-r-markdown-rmd-files-to-r-scripts
aliases: /blog/2017/10/17/convert-r-markdown-rmd-files-to-r-scripts
categories:
  - Blog
tags:
  - pandoc
  - R
  - Scripts
  - Workflow
  - Markdown
---



> **tl; super dr:** I'm really not sure how `knitr::purl()` escaped my attention -- maybe I thought it didn't do something I felt was necessary at the time -- but if you've stumbled on this page looking for a way to convert an R Markdown file into an R script, then the function you are looking for is called `knitr::purl()`.
>
> Try `knitr::purl(input, output, documentation = 2)`. It's exactly what you're looking for.

***

> **tl;dr:** A [function called backstitch][gist-link] that backstitches `knitr::knit`able R Markdown files to `knitr::spin`able R Scripts.

There are two great ways of writing R Markdown reports.
The most well known way is to use "literate programming", where the writing and the code are intermingled an `.Rmd` file.
This is the style of file you get when you create a new "R Markdown" file inside RStudio.

There's another way of mixing code and writing inside a script, and it's essentially the inverse of an `.Rmd` file.

In an R Markdown file, text is considered to be writing unless you wrap it in decoration, by adding backticks around inline code or by putting code in a "code chunk":

````markdown
```{r chunk-name}
table(mtcars$cyl, mtcars$gear)
```
````

To get your final report, you call knitr's **`knit`** function, which runs the code chunks, knits the results into the text, and writes an output file (PDF, HTML, Word, etc.).

In the inverse universe, you write your code and text in regular R scripts, mark specific lines as regular text by starting the lines with `#'`, and you **`spin`** your code and text together instead of knitting.

This format is great for computationally-heavy scripts.
The other advantage is that you can call the script directly to run all the code directly, ignoring the text aspect.
I also use it a lot when I want to quickly write up a report on a set of scripts that I've been working with.

Dean Attali has a [great write up from a couple years ago about `spin`][dean-attali] that I highly recommend.
And there's a [quick intro to `spin` in the knitr documentation][yihui-spin], too.

I usually try to keep computation and reporting scripts separate.
But writing up the results of your code while putting it together is an incredible paradigm for data analysis...and sometimes I keep digging and digging while writing and exploring.
And then I end up with a very "heavy" R Markdown (or notebook), where a lot of the data processing code really should be run separately from the reporting and visualization code.

But how do you convert an R Markdown file to a regular R script (or one that you could **`spin`** if you wanted to)?

I couldn't find the answer online, so I wrote a function called `backstitch` that does the conversion.
It only goes one way, for now: from `.Rmd` to `.R`.
But it lets you convert the whole R Markdown document to an R script, or just pull out the code chunks into a script (or both!).

Because it's just a function, I made it [available as a gist][gist-link], which you can source directly with `devtools`.


```r
devtools::source_gist('284671997992aefe295bed34bb53fde6', filename = 'backstitch.R')
```

Give it an input file or connection (`infile`), an output file name (`outfile`, leave as `NULL` to return as text vector), choose `output_type` from `script`, `code`, `both` and it does the rest of the work.
(There's also an extra option called `chunk_header`, for you to set the initial characters for chunk sections.)

For example, using Yihui's [knitr-spin.Rmd](https://github.com/yihui/knitr/blob/master/inst/examples/knitr-spin.Rmd) example, but in reverse, we start with this file:

~~~r
This is a special R script which can be used to generate a report. You can
write normal text in roxygen comments.

First we set up some options (you do not have to do this):

```{r setup, include=FALSE}
library(knitr)
opts_chunk$set(fig.path = 'figure/silk-')
```

The report begins here.

```{r test-a, cache=FALSE}
# boring examples as usual
set.seed(123)
x = rnorm(5)
mean(x)
```

You can use the special syntax {{code}} to embed inline expressions, e.g.
`r mean(x) + 2`
is the mean of x plus 2.
The code itself may contain braces, but these are not checked.  Thus,
perfectly valid (though very strange) R code such as `{{2 + 3}} - {{4 - 5}}`
can lead to errors because `2 + 3}} - {{4 - 5` will be treated as inline code.

Now we continue writing the report. We can draw plots as well.

```{r test-b, fig.width=5, fig.height=5}
par(mar = c(4, 4, .1, .1)); plot(x)
```

Actually you do not have to write chunk options, in which case knitr will use
default options. For example, the code below has no options attached:

```{r }
var(x)
quantile(x)
```

And you can also write two chunks successively like this:

```{r test-chisq5}
sum(x^2) # chi-square distribution with df 5
```
```{r test-chisq4}
sum((x - mean(x))^2) # df is 4 now
```

Done. Call spin('knitr-spin.R') to make silk from sow's ear now and knit a
lovely purse.
~~~

and `backstitch` it into this file:


```r
infile <- url('https://raw.githubusercontent.com/yihui/knitr/master/inst/examples/knitr-spin.Rmd')
output <- backstitch(infile, output_type = 'script', chunk_header = "#+")
cat("```r", output, "```", sep = "\n")
```

```r
#' This is a special R script which can be used to generate a report. You can
#' write normal text in roxygen comments.
#' 
#' First we set up some options (you do not have to do this):

#+ setup, include=FALSE
library(knitr)
opts_chunk$set(fig.path = 'figure/silk-')


#' The report begins here.

#+ test-a, cache=FALSE
# boring examples as usual
set.seed(123)
x = rnorm(5)
mean(x)


#' You can use the special syntax {{code}} to embed inline expressions, e.g.
#' {{mean(x) + 2}}
#' is the mean of x plus 2.
#' The code itself may contain braces, but these are not checked.  Thus,
#' perfectly valid (though very strange) R code such as `{{2 + 3}} - {{4 - 5}}`
#' can lead to errors because `2 + 3}} - {{4 - 5` will be treated as inline code.
#' 
#' Now we continue writing the report. We can draw plots as well.

#+ test-b, fig.width=5, fig.height=5
par(mar = c(4, 4, .1, .1)); plot(x)


#' Actually you do not have to write chunk options, in which case knitr will use
#' default options. For example, the code below has no options attached:

#+ 
var(x)
quantile(x)


#' And you can also write two chunks successively like this:

#+ test-chisq5
sum(x^2) # chi-square distribution with df 5

#+ test-chisq4
sum((x - mean(x))^2) # df is 4 now


#' Done. Call spin('knitr-spin.R') to make silk from sow's ear now and knit a
#' lovely purse.
```

[gist-link]: https://gist.github.com/gadenbuie/284671997992aefe295bed34bb53fde6
[dean-attali]: http://deanattali.com/2015/03/24/knitrs-best-hidden-gem-spin/
[yihui-spin]: https://yihui.name/knitr/demo/stitch/
