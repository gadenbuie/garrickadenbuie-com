---
title: 'Reuse Rmd fragments in package vignettes, README, blog posts and more'
author: Garrick Aden-Buie
description: >
  Use knitr's "child chunks" to reuse bits of documentation.
date: '2018-03-05'
slug: dry-vignette-and-readme
aliases: /blog/2018/03/05/dry-vignette-and-readme
categories:
  - Blog
tags:
  - R
  - Tips
  - Tricks
  - R Package
  - R Markdown
---

**Updated on December 4, 2019** with [new advice](#update)
that will most likely satisfy R CMD check.

------------------------------------------------------------------------

Jonathan Carroll ([@carroll\_jono](https://twitter.com/carroll_jono)) posted a twitter poll that turned out to be quite interesting this weekend:

{{% tweet "969442252610191361" %}}

## What I love to see in a README

Personally, I usually find out about a package while browsing GitHub or a blog post that leads me to check out the package on GitHub.
So I’m very partial to a highly explanatory README.

When I run into a new package, I’m hoping the README answers the following questions

1.  Why would I want to use this package?
2.  What does it look like to use this package?

So basically: an explanation of the problem the package solves and at least a short introduction to the functions or syntax of the package.

There are a lot of READMEs out there that just answer the first question with a very basic description of the package, or maybe even a detailed overview of the problem the package solves, but they don’t showcase the package in action.
I might not be the typical user, but this always seems like a missed opportunity to me.

Of course, writing good documentation is tricky.
And considering that a good package also has vignettes, a README, a related (<span class="pkg">[blogdown](https://bookdown.org/yihui/blogdown)</span>) blog post, and possibly even a <span class="pkg">[pkgdown](http://pkgdown.r-lib.org/)</span> site, making sure the documentation is up-to-date in all of these places can put undue burden on the package developers.

## Don’t Repeat Yourself, Clone Yourself

![](/images/2018/the-simpsons-s01e02-Bart-the-Genius.jpg)

In the spirit of Don’t Repeat Yourself and maximizing the potential of <span class="pkg">[knitr](https://yihui.name/knitr)</span> and [R Markdown](https://rmarkdown.rstudio.com/) – and the fact that you can use R Markdown for all of the above pieces – I remembered recently reading about child documents in knitr.

I posted my idea to [Jonathan’s thread](https://twitter.com/carroll_jono/status/969442252610191361) and shortly afterwards [@BrodieGaslam](https://twitter.com/BrodieGaslam) wrote back with an idea that [really makes the best of child documents](https://twitter.com/BrodieGaslam/status/969682597214343168).
Here’s the full idea:

### Write repeatable sections in short .Rmd files.

Adapting from Brodie’s
<span class="pkg">[vetr](https://github.com/brodieG/vetr)</span>
package as an example,
these files are stored in `man/fragments`:

    vignettes/
    ├── alike.Rmd
    ├── styles.css
    └── vetr.Rmd
    man/
    └── fragments/
        ├── declarative-checks.Rmd
        ├── microbenchmark.Rmd
        ├── related-packages.Rmd
        ├── trust-but-verify.Rmd
        ├── valaddin.Rmd
        └── vetting-expressions.Rmd

Notice `man/fragments/related-packages.Rmd`.
It’s a short R Markdown file with a list of (not surprisingly) related packages – the kind of section that might be included in both the package overview vignette and the README.

#### man/fragments/related-packages.Rmd &gt;

``` markdown
* [`vetr`](https://github.com/brodieG/vetr) by Yours Truly
* [`asserthat`](https://github.com/hadley/assertthat) by Hadley Wickham
* [`assertive`](https://www.r-pkg.org/pkg/assertive) by Richie Cotton
* [`checkmate`](https://github.com/mllg/checkmate) by Michel Lang

The following packages also perform related tasks ...
```

**Caution**:
If the fragments are stored in a sub-folder of `vignettes/`,
R CMD check may try to render them and
[can throw an error when they fail to render](https://stackoverflow.com/questions/50078849/package-build-fails-because-vignette-does-not-find-child-rmd-files)
because they aren’t complete documents.

### Reference the repeatable sections using the `child` chunk option.

<span class="pkg">knitr</span> provides a [child document chunk option](https://yihui.name/knitr/options/#child-documents) that you can use to embed R Markdown from an external file.
Anywhere that you would re-use the documentation, you simply include the following, such as in the <span class="pkg">vetr</span> package vignette.
Again, the following are from the [vetr package documentation files](https://github.com/brodieG/vetr).

#### vignettes/vetr.Rmd &gt;

```` markdown
## Alternatives

There are many alternatives available to `vetr`.  We do a survey of the
following in our [parameter validation functions][4] review:

```{r child="../man/fragments/related-packages.Rmd"} 
```
````

This R Markdown “chunk” can be used anywhere else you need it, such as in the package README.Rmd file.

#### README.Rmd &gt;

```` markdown
## Alternatives

There are many alternatives available to `vetr`.  We do a survey of the
following in our [parameter validation functions][5] review:

```{r child="man/fragments/related-packages.Rmd"} 
```
````

The major advantage here is to be able to update the documentation in one place and have those changes propagate to “parent” documents.
It’s also useful to be able to arrange or choose the content shown in certain places differently depending on the location
(or even during editing!).
For example, READMEs typically include installation instructions, but these would be redundant if included in the package vignettes.

The above examples can be extended for use in <span class="pkg">pkgdown</span> articles (which are essentially an extension of vignettes) or for blogdown posts if you develop your package and blog source on the same machine.

#### Update: December 4, 2019

[Maëlle Salmon](https://twitter.com/ma_salmon) helpfully
[pointed out](https://twitter.com/ma_salmon/status/1199655588457799680)
and then
[tracked down the solution](https://twitter.com/ma_salmon/status/1199979670026014720)
to an issue that may pop up
with the method I originally proposed in this post.

Rather than storing your R Markdown fragments in a subfolder in `vignettes/`, such as `vignettes/fragments`, they should instead be stored in `man/fragments`.

I updated the post above to match Maëlle’s advice.
Thanks to [Maëlle Salmon](https://twitter.com/ma_salmon) for the helpful advice that satisfies R CMD Check!

------------------------------------------------------------------------

Thanks [@BrodieGaslam](https://twitter.com/BrodieGaslam) for the tip and [@carroll\_jono](https://twitter.com/carroll_jono) for kicking off this thread!
