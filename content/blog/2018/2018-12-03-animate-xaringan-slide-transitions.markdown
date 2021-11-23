---
title: Animate Xaringan Slide Transitions
description: Add animations to xaringan slide transitions with animate.css
author: Garrick Aden-Buie
date: '2018-12-03'
slug: animate-xaringan-slide-transitions
aliases: /blog/2018/12/03/animate-xaringan-slide-transitions
twitterImage: /images/2018/animated-xaringan-slides/xaringan-animated.gif
categories:
  - Blog
tags:
  - xaringan
  - Tips
  - R
---

[xaringan]: https://github.com/yihui/xaringan
[remark.js]: https://github.com/gnab/remark
[animate.css]: https://daneden.github.io/animate.css

> [xaringan] is an excellent package for creating slideshows with [remark.js] using R Markdown.
For an example presentation showing off all of xaringan's ninja presentation skills, take a look at the [introductory presentation](https://slides.yihui.name/xaringan/).

You can easily add slide transitions and animations to your xaringan presentation using [animate.css].
It [turns out that remark.js supports animations](https://github.com/gnab/remark/pull/69) via [animate.css], which means that xaringan does, too!

**tl;dr:** Add [animate.css] to your slide's CSS and add `animated` and the animation class to a slide's class to add a transition.
Check out [this gist](https://gist.github.com/gadenbuie/6ba134aec862e781cbb97e4bbf125814) for a quick example.

## Add animate.css to your slide's css

The first thing you need to do to add animations is to include `animate.css` in the css argument to `moon_reader()`.
You can download the [animate.css  file](https://raw.githubusercontent.com/daneden/animate.css/master/animate.css) into your slides directory 

```r
download.file(
  "https://raw.githubusercontent.com/daneden/animate.css/master/animate.css",
  "animate.css"
)
```

and then list `animate.css` in the `css` YAML section. 

```yaml
output:
  xaringan::moon_reader:
    lib_dir: libs
    css: [default, default-fonts, animate.css]
```

Or if you'll have reliable internet during your presentation you can link directly to a [CDN](https://cdnjs.com).

```yaml
output:
  xaringan::moon_reader:
    lib_dir: libs
    css:
      - default
      - default-fonts 
      - "https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css"
```

## Add animation classes to your slide's class

Animations are specified on a per-slide basis and are applied to partial slide reveals as well.
You can also use `layout: true` to apply animations to multiple slides, but I'm not aware of a way to set a default transition for all slides. 
Here's [a short gist](https://gist.github.com/gadenbuie/6ba134aec862e781cbb97e4bbf125814) as an example to get you started.

To animate a slide's transition, add `animated` and the [animation type of your choice](https://github.com/daneden/animate.css#animations) to the slide's class.

```
---
class: center, middle, animated, slideInRight

# xaringan

### /ʃæ.'riŋ.ɡæn/

---
class: inverse, center, middle, animated, bounceInDown

# Get Started
```

The end result will look something like this. Have fun! &#x1F60E;

![Animated xaringan slides](/images/2018/animated-xaringan-slides/xaringan-animated.gif)

## More xaringan fun

This topic came up in a [xaringan GitHub issue](https://github.com/yihui/xaringan/issues/184), where [pzhaonet](https://github.com/pzhaonet) shared a link to a demonstration of [all 77 available transitions](http://www.pzhao.org/zh/post/xaringan-animate-single/).

If you like xaringan, you might also like my package for customizing its colors and themes: [xaringanthemer](/project/xaringanthemer).
