---
title: Highlight lines without breaking the code in Xaringan
author: Garrick Aden-Buie
date: '2018-01-23'
slug: highlight-lines-without-breaking-the-code-in-xaringan
aliases: /blog/2018/01/23/highlight-lines-without-breaking-the-code-in-xaringan
categories:
  - Blog
tags:
  - R
  - Presentation
  - xaringan
---

Update 2: This feature [has been added](https://github.com/yihui/xaringan/blob/master/NEWS.md#changes-in-xaringan-version-05) to the latest version of [xaringan]! See it in action: <https://slides.yihui.name/xaringan/#29>

Update: I went ahead and submitted a PR with this new feature to xaringan: <https://github.com/yihui/xaringan/pull/103>

Have you met [xaringan] yet?
It's yet another fantastic package from Yihui Xie that makes it easy to blend R code and text into presentations that look great on the web, in print and on screens.
Check out the [demo/intro slides][demo-slides]!

It's built on [remark.js] with few extra features, and one of my favorite features is the ability to highlight specific lines of code.
In presentations, this draws attention to the most important part of the code demonstration, but doesn't break the reproducibility.

![The line highlighting example from the [xaringan demo slides][demo-slides].](/images/2018/highlight-xaringan/highlight-demo-slides.png)

Basically, if you wrap a line in your code with `{{..code..}}`, that line will be highlighted in the slides.
This works because `{{x}}` is a valid expression in R that just returns `x`, so the source code in the chunk runs correctly and an output hook cleans up the line.

I love the feature, but it feels a little clunky in practice.
When you add the braces into your code, you can't rely on RStudio's auto-indenter to get the code alignment right.
The alignment in the chunk is fine after compiling, with the second line highlighted, but it looks a little odd in the source code.

````
```{r} 
paste("This looks",
     {{"a little odd"}},
      "but it's right")
```
````

Also, the braces only work when wrapped around expressions -- like `{{"a little odd"}}` -- so you have to pick out the part of the line that is a valid R expression.

````
```{r} 
{{paste(}}
  "This won't work"
)
```

```{r} 
{{paste}}(
  "But this works"
)
```
````

Instead, I thought it might be easier to mark the line with a code comment on the right-hand side.
Like this

````r
```{r}
paste("This looks",
      "kinda normal",  #<<
      "and it is")
```
````

Sidenote: I picked `#<<` because it kinda looks like *hashtag looking left* (`#<_<`) but is easier to type.

To make this work, just add the following lines to your setup chunk:

```r
hook_source <- knitr::knit_hooks$get('source')
knitr::knit_hooks$set(source = function(x, options) {
  x <- stringr::str_replace(x, "^[[:blank:]]?([^*].+?)[[:blank:]]*#<<[[:blank:]]*$", "*\\1")
  hook_source(x, options)
})
```

This add a *source hook* that processes the source code of the code chunk on its way into the output document after it has been evaluated.
Basically, any lines in the source code with the `#<<` mark at the end of the line are modified to have the remark.js style leading `*` highlight indicator.



```r
lines <- c('paste("This looks",', 
           '      "kinda normal", #<<',
           '      "and it is")')

lines <- stringr::str_replace(lines, "^[[:blank:]]?([^*].+?)[[:blank:]]*#<<[[:blank:]]*$", "*\\1")
cat(lines, sep = '\n')
```

```
paste("This looks",
*     "kinda normal",
      "and it is")
```

Here's a real example of it in practice with a code chunk from a recent presentation:

````
```{r example-plot}
ggplot(tips) +
  aes(x = tip) +
  geom_histogram(   #<<
    binwidth = 0.25 #<<
  )                 #<<
```
````

![](/images/2018/highlight-xaringan/highlight-demo-out.png)

Notice that the code in the source chunk and the output are both lined up!
Here's a full slide with a few more examples.

![](/images/2018/highlight-xaringan/highlight-more-examples.png)

[xaringan]: https://github.com/yihui/xaringan
[remark.js]: http://remarkjs.com/
[demo-slides]: https://slides.yihui.name/xaringan/
