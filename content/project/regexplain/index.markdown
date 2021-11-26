---
title: ":male_detective:   RegExplain"
slug: "regexplain"
description: "An RStudio addin slash utility belt for regular expressions"
images: [ "/images/project/regexplain/regexplain-gadget-tabs.png" ]
date: 2018-04-04T00:00:00+00:00
type: project
categories:
  - Project
tags: ["R", "R Package", "Shiny", "RStudio", "Addin", "Gadget"]
---



[regexplain-src]: https://github.com/gadenbuie/regexplain

**Project Links:** [source][regexplain-src], [installation](#installation), [try the app](#demo), [overview](#overview)

<!-- https://buttons.github.io/ -->
<a class="github-button" href="https://github.com/gadenbuie" data-show-count="true" aria-label="Follow @gadenbuie on GitHub">Follow @gadenbuie</a>&nbsp;
<a class="github-button" href="https://github.com/gadenbuie/regexplain" data-icon="octicon-star" data-show-count="true" aria-label="Star gadenbuie/regexplain on GitHub">Star</a>&nbsp;
<a class="github-button" href="https://github.com/gadenbuie/regexplain/fork" data-icon="octicon-repo-forked" data-show-count="true" aria-label="Fork gadenbuie/regexplain on GitHub">Fork</a>

#### *Regular expressions are tricky.* RegExplain *makes it easier to see what you’re doing.*

**RegExplain** is an RStudio addin slash utility belt for regular
expressions. Interactively build your regexp, check the output of common
string matching functions, consult the interactive help pages, or use
the included resources to learn regular expressions. And more.

Inspired by [RegExr.com](https://regexr.com/) and `stringr::str_view()`.

## Installation

Installation is easy with `devtools`

``` r
devtools::install_github("gadenbuie/regexplain")
```

or for hands-free installation

    source("https://install-github.me/gadenbuie/regexplain")

## Try it out! {#demo}

<iframe src="https://apps.garrickadenbuie.com/regexplain/" style="border: #DDDDDD 2px solid; background-color: #F9F9F9; width: 650px; height: 750px">
<p>Your browser doesn't support <code>iframes</code> or you have blocker enabled.
You can try the regexplain addin live at <a href="https://apps.garrickadenbuie.com/regexplain">https://apps.garrickadenbuie.com/regexplain</a>.
</iframe>

A demo version of the app is available online at <a href="https://apps.garrickadenbuie.com/regexplain">https://apps.garrickadenbuie.com/regexplain</a>.
Clicking the "Cancel" or "Send RegEx To Console" buttons will kill the app.
Reload this page to restart the app.

## RegExplain in Action

#### Overview

![RegExplain Selection](/images/project/regexplain/regexplain-selection.gif)

#### Regular Expressions Library

![RegExplain Library](/images/project/regexplain/regexplain-library.gif)

#### Try the Built-In Examples

![RegExplain Examples](/images/project/regexplain/regexplain-try-this.gif)

## RStudio Addin

The main feature of this package is the RStudio Addin **RegExplain
Selection**. Just select the text or object containing text (such as the
variable name of a vector or a data.frame column) and run **RegExplain
Selection** from the RStudio Addins
dropdown.

<img src="/images/project/regexplain/rstudio-addin-list.png" width = "250px;" alt="regexplain in the Rstudio Addins dropdown">

The addin will open an interface with 4 panes where you can

  - edit the **text** you’ve imported
  - build up a **regex** expression and interactively see it applied to
    your text
  - test the **output** of common string matching and replacement
    functions from `base` and `stringr`
  - and refer to a **help**ful cheatsheet

<a href="/images/project/regexplain/regexplain-gadget-tabs.png" data-featherlight="image">
<img src=" /images/project/regexplain/regexplain-gadget-tabs.png " alt=" The panes of regexplain "   >
</a>


When you’re done, click on the **Send Regex to Console** to send your
regex expression to… the
console\!

``` r
> pattern <- "\\b(red|orange|yellow|green|blue|purple|white|brown)(?:\\s(\\w+))?"
```

Notice that *RegExplain* handled the extra backslashes needed for
storing the RegEx characters `\b`, `\s`, and `\w`. Inside the gadget you
can use regular old regular expressions as you found them in the wild
(hello, [Stack
Overflow](https://stackoverflow.com/questions/tagged/regex)\!).

### Help and Cheat Sheet

The **Help** tab is full of resources, guides, and R packages and
includes an easy-to-navigate reference of commonly used regular
expression syntax.

<a href="/images/project/regexplain/regexplain-gadget-help.png" data-featherlight="image">
<img src=" /images/project/regexplain/regexplain-gadget-help.png " alt=" regexplain help windows "   >
</a>


Open **RegExplain Cheatsheet** from the RStudio Addins drop down to open
the regex reference page in the Viewer pane without blocking your
current R session.

### Import Your Text

There are two ways to get your text into *RegExplain*. The first way was
described above: select an object name or lines of text or code in the
RStudio source pane and run **RegExplain Selection**. To import text
from a file, use **RegExplain File** to you import the text you want to
process with regular expressions.

When importing text, *RegExplain* automatically reduces the text to the
unique entries and limits the number of lines.

<a href="/images/project/regexplain/addin-screenshots.png" data-featherlight="image">
<img src=" /images/project/regexplain/addin-screenshots.png " alt=" regexplain addins "   >
</a>


### Regular Expressions Library

The *RegExplain* gadget includes a regular expressions library in the
**RegEx** tab. The library features common regular expressions, sourced
from [qdapRegex](https://github.com/trinker/qdapRegex) and [Regex
Hub](https://projects.lukehaas.me/regexhub), with several additional
patterns.

The full library is stored as a JSON file in
[inst/extdata/patterns.json](https://github.com/gadenbuie/regexplain/blob/master/inst/extdata/patterns.json), feel free to
contribute patterns you find useful or use regularly via pull
request.

<a href="/images/project/regexplain/regexplain-gadget-library.png" data-featherlight="image">
<img src=" /images/project/regexplain/regexplain-gadget-library.png " alt=" regexplain library modal "  height="400px" >
</a>


## View Static Regex Results

*RegExplain* provides the function `view_regex()` that you can use as a
`stringr::str_view()` replacement. In addition to highlighting matched
portions of the text, `view_regex()` colorizes groups and attempts to
colorize the regex expression itself as well.

``` r
text <- c("breakfast=eggs;lunch=pizza",
          "breakfast=bacon;lunch=spaghetti",
          "no food here")
pattern <- "((\\w+)=)(\\w+).+(ch=s?p)"

view_regex(text, pattern)
```

<a href="/images/project/regexplain/view-regex.png" data-featherlight="image">
<img src=" /images/project/regexplain/view-regex.png " alt=" Example view_regex(text, pattern). "   >
</a>


``` r
t_nested <- "anestedgroupwithingroupexample"
r_nested <- "(a(nested)(group(within(group))(example)))"
view_regex(t_nested, r_nested)
```

<a href="/images/project/regexplain/view-nested.png" data-featherlight="image">
<img src=" /images/project/regexplain/view-nested.png " alt=" Example of nested groups "   >
</a>


## Notes

Regular expressions are nothing if not a collection of corner cases.
Trying to pass regular expressions through Shiny and HTML inputs is a
bit of a labyrinth. For now, assume any issues or oddities you
experience with this addin are entirely my fault and have nothing to do
with the fine packages this addin is built on. If you do find an issue,
[please file an issue](https://github.com/gadenbuie/regexplain). Pull
requests are welcomed!
