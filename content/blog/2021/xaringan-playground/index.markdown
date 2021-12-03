---
title: "xaringan Playground: Using xaringan to learn web development"
author: Garrick Aden-Buie
date: '2021-01-21'
slug: xaringan-playground
categories:
  - Blog
tags:
  - R
  - xaringan
  - Presentation
  - CSS
  - Web Development
description: |
  Making slides with xaringan is a great way to learn more about CSS
  and web development.
images:
  - /blog/xaringan-playground/xaringan-playground-social.png
source_link: 'https://github.com/gadenbuie/garrickadenbuie-com/blob/main/content/blog/2021/xaringan-playground/index.Rmarkdown'
keywords: rstats
references: ~
editor_options:
  chunk_output_type: console
---

<!-- Links -->

<div class="lead">

This year, I’m presenting a lightning talk at [rstudio::global](https://global.rstudio.com/) — [xaringan Playground: Using xaringan to learn web development](https://global.rstudio.com/student/page/40609).

The talk is short and covers just a taste of how xaringan can make learning web development fun.
In future posts I’ll dive deeper into CSS and web development basics for xaringan users.

For now I just want to share some of the reasons why I love xaringan for tinkering with web development ideas.

</div>

<div class="figure">

<img src="xaringan-playground-social.png" style="max-height: 300px; margin: 0 auto; display: block;" alt="Title slide for xaringan playground talk">
<p class="caption">
<a href="https://slides.garrickadenbuie.com/xaringan-playground">Slides - xaringan playground</a>
</p>

</div>

## xaringan ❤️ CSS

Over the last few years, I’ve built many presentations with <span class="pkg">[xaringan](https://github.com/yihui/xaringan)</span>.
There are a lot of things to love about <span class="pkg">xaringan</span>,
but one thing I’ve noticed is that <span class="pkg">xaringan</span> presentations
can be a gateway into the world of web development.

If you’ve worked with [R Markdown](https://rmarkdown.rstudio.com) to create a report or blog or website to share online,
you’ve probably encountered a few stylistic things you’ve wanted to change.
These changes tend to be small,
like choosing a new font family or changing the color of links.
If you don’t like the look of your report,
there are [lots of themes to choose from](https://www.datadreaming.org/post/r-markdown-theme-gallery/)
in <span class="pkg">rmarkdown</span>, or in other packages like
[prettydocs](https://prettydoc.statr.me/),
[rmdformats](https://github.com/juba/rmdformats),
or [cleanrmd](https://pkg.garrickadenbuie.com/cleanrmd/).

<span class="pkg">xaringan</span> is a little different.
Slides are a visual medium.
You probably have an idea of how you want your slides to look as you work on them.

You can get really far with plain markdown using the few little extras that <span class="pkg">xaringan</span> provides,
but at a certain point in the process of transferring your vision of your talk to the screen,
you’ve probably said,
out loud and not without a slight hint of frustration:
*I just want that thing to go right **there***.

In point-and-click software, this is where you’d spend some time dragging text and images around or digging through menus to make your slides look awesome.
In <span class="pkg">xaringan</span>, your slides are web page,
so we instead need to turn to CSS to style our slides.
I’m not going to say that one method is necessarily better than the other,
just that I personally love writing code and I actually enjoy CSS.
I might be weird in that respect,
but since you’re still reading this I’m guessing you are too.

This is why I love <span class="pkg">xaringan</span>.
Each slide is a small, self-contained web design project.
The constraints are well-defined:
you aren’t building an *entire website*.
You don’t have to make an app or think about a user interface.
You just need to make *this slide* look great.

There are two advantages of using <span class="pkg">xaringan</span> and CSS for our slides that I think are important.
First, knowing CSS is useful in more places than just making slides.
Many of the things I’ve designed for a presentation
have been useful in other areas of my life as an R Markdown user and person who puts things on the internet for others to enjoy.

Second, while CSS can be daunting to learn,
the stakes are relatively low with <span class="pkg">xaringan</span>.
You don’t need to know everything about CSS or web development.
When you create a new slide,
you only need to worry about the things you’re going to put in that slide.
You don’t have to think about laying out an entire web page.
And as long as you slides look good when you present them,
then your job was well done.

This is why I see <span class="pkg">xaringan</span> as a playground for trying new things.
It sets you up to play with CSS, to learn something new, and to get quick, immediate feedback.
Plus, it feels good to make things that look great and to share them with the world!

Not only that, <span class="pkg">xaringan</span> has a few tricks up its sleeve.
Catch the talk or wait for the next post in this series to learn more!
