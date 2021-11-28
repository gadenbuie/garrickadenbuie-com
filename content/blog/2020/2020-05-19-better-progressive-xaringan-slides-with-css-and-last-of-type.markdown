---
title: Better Progressive xaringan Slides with CSS and :last-of-type
author: Garrick Aden-Buie
date: '2020-05-20'
slug: better-progressive-xaringan
categories:
  - Blog
tags:
  - R
  - xaringan
  - xaringan Tip
  - CSS
  - Slides
description: A few CSS rules for focused, progressively revealed lists and R code chunks in xaringan slides.
twitterImage: /blog/better-progressive-xaringan/better-progressive-xaringan.png
rmd_source: https://github.com/gadenbuie/garrickadenbuie-com/blob/main/content/blog/2020/2020-05-19-better-progressive-xaringan-slides-with-css-and-last-of-type.Rmd
head_custom: |
  <link href="/css/flexy.css" rel="stylesheet">
keywords: rstats
editor_options:
  chunk_output_type: console
---

<!-- Links -->
<style type="text/css">
.iframe-slides {
  max-width: 625px;
  margin-left: auto;
  margin-right: auto;
  box-shadow: none;
  border: none;
}
.iframe-slides iframe {
  border: 2px solid #ddd;
}
.panel > p:first-of-type,
.panel > .iframe-slides:first-of-type {
    margin-top: 1em;
}
</style>

Here’s a quick tip
for making your <span class="pkg">[xaringan](https://github.com/yihui/xaringan)</span> slides shine
with a little CSS.
Specifically,
I’m going to show you how to use the
[`:last-of-type` pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-of-type)
to highlight the current bullet in progressive slides.
We can also use the `:last-of-type` selector
to show only the output of the last R chunk in a slide full of many R chunks.
In each case,
these techniques work best for *progressive* slides,
or slides with content that builds up slowly.

In this post,
I’ll demonstrate how `:last-of-type` can be used to
[highlight the last list item](#highlight-last-list-item),
[bold the last list item](#bold-last-item),
or [reveal only the last R code chunk output](#show-only-last-code-output).

## Progressive List Slides

To create progressive slides in <span class="pkg">xaringan</span>,
use two dashes `--`,
all alone on their own line,
to indicate a pause in the current slide.

``` markdown
---
class: highlight-last-item

# Best Brownies, Ingredients

- 1 cup milk chocolate chips

--

- 2 large eggs

--

- 2 teaspoons vanilla extract
```

<span class="pkg">xaringan</span> actually creates new slides for each *pause*,
where each slide shows the content up to the pause.
So the markdown below creates three slides,
the first having one bullet point,
the second having two bullet points,
and the third having the full list.

When rendered,
three slides are created
and the final slide contains the following HTML.

``` html
<div class="remark-slide-content highlight-last-item">
  <h1 id="best-brownies-ingredients">Best Brownies, Ingredients</h1>
  <ul>
    <li><p>1 cup milk chocolate chips</p></li>
    <li><p>2 large eggs</p></li>
    <li><p>2 teaspoons vanilla extract</p></li>
  </ul>
  <div class="remark-slide-number">3 / 3</div>
</div>
```

The first and second partial slides look exactly the same,
except that the `<ul>`
[unordered list element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ul)
contains only the first one or first two `<li>` list items.

If you’re building up a slide full of bullet points,
you’re probably talking about the last element in the list
as you reveal each new list item.
We can create a neat effect where the last list item —
hence the `:last-of-type` pseudo-class —
is highlighted by softening the previous list items
or by changing the styling of the last item.

In HTML, lists are unordered `<ul>` or ordered `<ol>` lists
containing list elements created with the `<li>` tag.
Here’s a small example,
similar to the structure of the HTML and CSS we’ll use for <span class="pkg">xaringan</span>.

<div class="flex flex-row-m flex-column">

<div class="w-third-m w-100">

#### HTML

<pre><code>&lt;ul class="demo"&gt;
&nbsp;&nbsp;&lt;li&gt;item one&lt;/li&gt;
&nbsp;&nbsp;&lt;li&gt;item two&lt;/li&gt;
&nbsp;&nbsp;<span style="background: var(--purple);color: var(--text-lightest)">&lt;li&gt;item three&lt;/li&gt;</span>
&lt;ul&gt;</code></pre>

</div>

<div class="w-third-m w-100">

#### CSS

<pre><code>.demo &gt; li {
&nbsp;&nbsp;color: gray;
}
.demo &gt; <span style="background: var(--purple);color: var(--text-lightest)">li:last-of-type</span> {
&nbsp;&nbsp;color: purple;
&nbsp;&nbsp;font-weight: bold;
}</code></pre>

</div>

<div class="w-third-m w-100">

#### Result

<ul class="demo">
<li>item one</li>
<li>item two</li>
<li>item three</li>
<ul>

</div>

</div>

<style type="text/css">
.demo > li {
  color: var(--text-light);
}
.demo > li:last-of-type {
  color: var(--purple);
  font-weight: bold;
}
</style>

The `.demo > li` rule styles the list items
under the `<ul>` tag with the `.demo` class,
setting the text color to a muted gray.
The `.demo > li:last-of-type` rule
styles the last `<li>` that’s one level below
(that’s what the `>` means)
the `.demo` element.

## Highlight Last List Item

Use the following CSS chunk —
you can just copy and paste the chunk below into your slides’ Rmd file —
to highlight the last list item by reducing the opacity of the other list items.

```` markdown
```{css echo=FALSE}
.highlight-last-item > ul > li,
.highlight-last-item > ol > li {
  opacity: 0.5;
}
.highlight-last-item > ul > li:last-of-type,
.highlight-last-item > ol > li:last-of-type {
  opacity: 1;
}
```
````

Then, add the `highlight-last-item` class to any progressively revealed slide
to focus on the current list item.

Here’s a complete example.
Click into the *Slides* tab to preview the style
in an embedded <span class="pkg">xaringan</span> presentation.

<div class="panelset">

<section class="panel">
<h3 class="panel-name">
R Markdown
</h3>

``` markdown
class: highlight-last-item

# Best Brownies, Ingredients

- 1 cup milk chocolate chips

--

- 2 large eggs

--

- ... more list items...
```

</section>
<section class="panel">
<h3 class="panel-name">
Slides
</h3>

Click inside the slides below
and press the <kbd>←</kbd>/<kbd>→</kbd>
arrows to progressively reveal the bullet points.

<div class="iframe-container iframe-slides">

<iframe src="example/highlight-last-item.html" width="480px" height="270px">
</iframe>

</div>

</section>

</div>

As written above,
the last list item of *each list* on the slide will be highlighted,
which may not be what you want if you have multiple lists on the slide.
You could also add the `:last-of-type` pseudo-class
to the `ul` and `ol` elements as well
to target the last item of the last list on the slide.

## Bold Last Item

You can use this pattern to style progressive lists any way you want.
Here’s another example to do something similar,
this time simply making the last list items **bold**.

    ```{css eval=FALSE}
    .bold-last-item > ul > li:last-of-type,
    .bold-last-item > ol > li:last-of-type {
      font-weight: bold;
    }
    ```

Drop the CSS chunk above into your slides,
to create slides like the example below.

<div class="panelset">

<section class="panel">
<h3 class="panel-name">
R Markdown
</h3>

``` markdown
class: bold-last-item

# Best Brownies, Steps

1. Preheat oven to 350 degrees F. Line a metal 9x9 pan with parchment paper.
--

1. Pour melted butter into a large mixing bowl.
    1. Whisk in sugar by hand until smooth, 30 seconds.
--
1. Add in eggs and vanilla extract. Whisk 1 minute.
-

1. ... More Steps ...
```

</section>
<section class="panel">
<h3 class="panel-name">
Slides
</h3>

<div class="iframe-container iframe-slides">

<iframe src="example/bold-last-item.html" width="480px" height="270px">
</iframe>

</div>

</section>

</div>

## Show Only Last Code Output

As a final example,
we can also apply this trick to slides with multiple R code chunks.
I sometimes want to demonstrate multiple R commands on a slide,
but only the output of the last example matters.

This example is a little bit more complicated,
but you can drop the CSS chunk below into your slides
to create a `show-only-last-code-result` class.

    ```{css eval=FALSE}
    .show-only-last-code-result pre + pre:not(:last-of-type) code[class="remark-code"] {
        display: none;
    }
    ```

Here’s a complete example demonstrating a random sample
of random sampling functions in R
and only showing the output from the last command.

<div class="panelset">

<div class="panel">

<span class="panel-name">R Markdown</span>

```` markdown
class: show-only-last-code-result

# Random Sampling in R

```{r}
runif(5)
```
--

```{r}
rnorm(5)
```
--

```{r}
rbinom(5, 1, 0.5)
```
--

```{r}
rcauchy(5)
```
````

</div>

<div class="panel">

<span class="panel-name">Slides</span>

<div class="iframe-container iframe-slides">

<iframe src="example/show-only-last-code-result.html" width="480px" height="270px">
</iframe>

</div>

</div>

</div>

------------------------------------------------------------------------

If you like <span class="pkg">[xaringan](https://github.com/yihui/xaringan)</span>,
you should check out my package, <span class="pkg">[xaringanthemer](https://pkg.garrickadenbuie.com/xaringanthemer)</span>!

If you *really like* <span class="pkg">xaringan</span>,
you might also enjoy another package I’ve created: <span class="pkg">[xaringanExtra](https://pkg.garrickadenbuie.com/xaringanExtra)</span>.
It’s also how I created the
[panelsets](https://pkg.garrickadenbuie.com/xaringanExtra/#panelset)
above, which work in <span class="pkg">[blogdown](https://bookdown.org/yihui/blogdown/)</span> as well!

<script src="/js/fitvids.min.js"></script>
<script>fitvids('.iframe-slides', {players: ['iframe[src^="example"]']});</script>
