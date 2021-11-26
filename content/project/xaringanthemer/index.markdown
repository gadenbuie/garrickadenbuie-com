---
title: ":art:  xaringanthemer"
description: "Give your xaringan slides some style without (much) CSS"
author: Garrick Aden-Buie
date: '2018-05-12'
slug: xaringanthemer
images: [/images/project/xaringanthemer/examples.gif]
categories: ["Project"]
tags:
  - xaringan
  - R Package
  - Slides
  - Presentation
  - R
  - RStudio
---

[xt-src]: https://github.com/gadenbuie/xaringanthemer
[devtools]: https://github.com/r-lib/devtools
[xaringan]: https://github.com/yihui/xaringan
[xt-docs]: https://pkg.garrickadenbuie.com/xaringanthemer

**Project Links:** [source][xt-src], [docs][xt-docs], [installation](#installation), [usage](#usage)

<!-- https://buttons.github.io/ -->
<a class="github-button" href="https://github.com/gadenbuie" data-show-count="true" aria-label="Follow @gadenbuie on GitHub">Follow @gadenbuie</a>&nbsp;
<a class="github-button" href="https://github.com/gadenbuie/xaringanthemer" data-icon="octicon-star" data-show-count="true" aria-label="Star gadenbuie/xaringanthemer on GitHub">Star</a>&nbsp;
<a class="github-button" href="https://github.com/gadenbuie/xaringanthemer/fork" data-icon="octicon-repo-forked" data-show-count="true" aria-label="Fork gadenbuie/xaringanthemer on GitHub">Fork</a>

Give your [xaringan] slides some style with **xaringanthemer** within your `slides.Rmd` file without (much) CSS.

![](/images/project/xaringanthemer/examples.gif)

## Installation

**xaringanthemer** currently [lives on GitHub][xt-src].

```r
# install.packages("devtools")
devtools::install_github("gadenbuie/xaringanthemer")
```

Read on for a quick overview, or read through the [xaringanthemer documentation][xt-docs] for more information.

## Usage

<!-- Set link to theme-settings, template-variables, theme functions -->
[theme-settings]: https://pkg.garrickadenbuie.com/xaringanthemer/articles/xaringanthemer.html#theme-settings
[template-variables]: https://pkg.garrickadenbuie.com/xaringanthemer/articles/template-variables.html
[theme-functions]: https://pkg.garrickadenbuie.com/xaringanthemer/articles/singles/themes.html

First, add the `xaringan-themer.css` file to the YAML header of your xaringan slides.

```yaml
output:
  xaringan::moon_reader:
    lib_dir: libs
    css: xaringan-themer.css
```

Then, in a hidden chunk just after the knitr setup chunk, load **xaringanthemer** and try one of the [theme functions][theme-functions].

````markdown
```{r xaringan-themer, include = FALSE}
library(xaringanthemer)
mono_light(
  base_color = "#1c5253",
  header_font_google = google_font("Josefin Sans"),
  text_font_google   = google_font("Montserrat", "300", "300i"),
  code_font_google   = google_font("Droid Mono")
)
```
````

![xaringanthemer example with mono_light theme](/images/project/xaringanthemer/example_mono_light_1c5253.png)


### Tab Completion

**xaringanthemer** is <kbd>Tab</kbd> friendly -- [use autocomplete to explore][theme-settings] the [template variables][template-variables] that you can adjust in each of the themes!

![xaringanthemer rstudio autocompletion example](/images/project/xaringanthemer/xaringanthemer-rstudio-help.gif)

### R Markdown Template in RStudio

You can also skip the above and just create a *Ninja Themed Presentation* from the New R Markdown Document menu in RStudio.

<center>
![rstudio xaringanthemer rmarkdown template](/images/project/xaringanthemer/rmarkdown-template-screenshot.png){width=350px}
</center>


***

[xaringan]: https://github.com/yihui/xaringan
[remarkjs]: https://github.com/gnab/remark

**xaringanthemer** was built by [Garrick Aden-Buie](https://www.garrickadenbuie.com) ([&commat;grrrck](https://twitter.com/grrrck)).

Big thank you to [Yihui Xie](https://yihui.name), especially for [xaringan].
Also thanks to [Ole Petter Bang](http://gnab.org) for [remark.js][remarkjs].

Feel free to [file an issue](https://github.com/gadenbuie/xaringanthemer/issues)
if you find a bug or have a theme suggestion -- or better yet, submit a pull request!
