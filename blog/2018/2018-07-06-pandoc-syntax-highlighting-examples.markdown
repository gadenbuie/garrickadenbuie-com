---
title: Pandoc Syntax Highlighting Examples
date: "2018-07-06"
slug: pandoc-syntax-highlighting-examples
aliases: /blog/2018/07/06/pandoc-syntax-highlighting-examples
---

The R Markdown book lists [many syntax highlighting color schemes](https://bookdown.org/yihui/rmarkdown/html-document.html#appearance-and-style):

> `highlight` specifies the syntax highlighting style. Supported styles include `default`, `tango`, `pygments`, `kate`, `monochrome`, `espresso`, `zenburn`, `haddock`, and `textmate`. Pass null to prevent syntax highlighting.

Which is the same as running `pandoc --list-highlight-styles` (see [Syntax Highlighting](http://pandoc.org/MANUAL.html#syntax-highlighting) in the [pandoc manual](http://pandoc.org/MANUAL.html)).[^1]

[^1]: Note that at the time of this writing 2021-11-23, pandoc has a new highlighting style `breezedark` that `rmarkdown::pdf_document` rejects. Also, `textmate` ~~seems to have been deprecated because it~~ is an HTML higlight style, so it is also rejected by `pdf_document`.

But I couldn't find a gallery for choosing among these syntax styles, so here's a quick comparison.


![highlight: default](/images/2018/pandoc-highlights/highlights_default.png)

![highlight: espresso](/images/2018/pandoc-highlights/highlights_espresso.png)

![highlight: haddock](/images/2018/pandoc-highlights/highlights_haddock.png)

![highlight: kate](/images/2018/pandoc-highlights/highlights_kate.png)

![highlight: monochrome](/images/2018/pandoc-highlights/highlights_monochrome.png)

![highlight: pygments](/images/2018/pandoc-highlights/highlights_pygments.png)

![highlight: tango](/images/2018/pandoc-highlights/highlights_tango.png)

![highlight: zenburn](/images/2018/pandoc-highlights/highlights_zenburn.png)

![&ndash;&ndash;highlight=breezedark](/images/2018/pandoc-highlights/highlights_breezedark.png)

**Update:** `rmarkdown::pdf_document()` doesn't currently accept `breezedark` as a highlight style, but you can use the `pandoc_args` parameter to request this style (added in [pandoc 1.19.2](https://github.com/jgm/pandoc/releases/tag/1.19.2)):

```yaml
---
output: 
  pdf_document:
    pandoc_args: "--highlight=breezedark"
---
```
