---
title: Custom Discrete Color Scales for ggplot2
author: Garrick Aden-Buie
date: '2019-08-15'
slug: custom-discrete-color-scales-for-ggplot2
categories:
  - Blog
tags:
  - R
  - ggplot2
  - Visualization
  - Tips
description: >
  Building discrete color scales for ggplot2
  with some cool features for binary categorical variables.
images:
  - /blog/2019/2019-08-15-custom-discrete-color-scales-for-ggplot2_files/figure-html/title-card-1.png
rmd_source: 'https://github.com/gadenbuie/garrickadenbuie-com/blob/main/content/blog/2019/2019-08-15-custom-discrete-color-scales-for-ggplot2.Rmd'
keywords: rstats
editor_options:
  chunk_output_type: console
---

<!-- Links -->

This is a quick post demonstrating a custom discrete color scale for <span class="pkg">[ggplot2](https://ggplot2.tidyverse.org)</span>.
The goal is to create a branded color scale that we can apply to a ggplot2 plot
with `+ scale_color_branded()`.

I’m going to demonstrate how to customize the order of the colors used in the palette
by showcasing a neat setup for setting the colors of binary variables.
Whenever two discrete values are used for the color scale,
the palette will automatically choose a primary color and a softer secondary
(or other) color.
Both will be parameterized so that we can change the colors as needed,
choosing automatically from a branded color palette.

## A color palette for our “brand”

Suppose we have color palette for our brand or organization.
I just grabbed a random color palette from [coolors.co](https://coolors.co/app/2e4057-66a182-edae49-d1495b-00798c)
(but I think it actually looks okay!).
We’ll store this in a list called `branded_colors`,
that you would ideally export from the package containing your brand’s <span class="pkg">ggplot2</span> themes.

``` r
branded_colors <- list(
  "blue"   = "#00798c",
  "red"    = "#d1495b",
  "yellow" = "#edae49",
  "green"  = "#66a182",
  "navy"   = "#2e4057",
  "grey"   = "#8d96a3"
)
```

<img src="/blog/2019/2019-08-15-custom-discrete-color-scales-for-ggplot2_files/figure-html/show-brand-colors-1.png" width="1728" />

## Create a palette function

Next we create the palette function.
Ultimately, what we need from a palette function is
a function that takes a single argument `n` and returns `n` colors.

But in our case, we want to give the user some control over which colors are used,
so our palette function needs to have some additional parameters.
To balance both needs, we’ll use a *closure*,
which is fancy word for a function that returns another function.
The outer function sets up the color choices
and the inner function returns a simple function of `n` that gives <span class="pkg">ggplot2</span>
our brand’s colors.

What’s great is that we can do whatever we want inside these functions.
You can use this opportunity to re-order the colors for specific values of `n`, for example.

We’re going to make specific decisions about the colors used when `n == 2`.
We want the palette to return two colors, `branded_colors[primary]` and another color.
The `other` argument specifies the name of the second (or other) color,
and we’ll first try to lookup the color name from the brand colors,
but we’ll also let the user specify a manual color.

``` r
branded_pal <- function(
  primary = "blue",
  other = "grey",
  direction = 1
) {
  stopifnot(primary %in% names(branded_colors))

  function(n) {
    if (n > 6) warning("Branded Color Palette only has 6 colors.")

    if (n == 2) {
      other <- if (!other %in% names(branded_colors)) {
        other
      } else {
        branded_colors[other]
      }
      color_list <- c(other, branded_colors[primary])
    } else {
      color_list <- branded_colors[1:n]
    }

    color_list <- unname(unlist(color_list))
    if (direction >= 0) color_list else rev(color_list)
  }
}
```

Here are a few examples of the colors
given by the pallete function
returned by `branded_pal()`
for various values of `n`.

``` r
branded_pal()(2)
```

    ## [1] "#8d96a3" "#00798c"

``` r
branded_pal(other = "green")(2)
```

    ## [1] "#66a182" "#00798c"

``` r
branded_pal()(3)
```

    ## [1] "#00798c" "#d1495b" "#edae49"

``` r
branded_pal(direction = -1)(3)
```

    ## [1] "#edae49" "#d1495b" "#00798c"

## Create a discrete color scale

Now, we wrap this palette into a `scale_colour_branded()` function,
using `ggplot2::discrete_scale()` to turn our palette into a <span class="pkg">ggplot2</span> scale.
Note that ggplot2 convention is to spell `colour` with a `u`
and to create an alias to the American spelling.

``` r
scale_colour_branded <- function(
  primary = "blue",
  other = "grey",
  direction = 1,
  ...
) {
  ggplot2::discrete_scale(
    "colour", "branded",
    branded_pal(primary, other, direction),
    ...
  )
}

scale_color_branded <- scale_colour_branded
```

## Demonstration

Let’s see our new discrete color scale in action.
We’ll create a simple plot using `mtcars` using the binary variable `vs`
(engine shape, V or straight)
for the point colors.

Here’s our plot using the standard <span class="pkg">ggplot2</span> colors.

``` r
library(ggplot2)

# Convert vs, gear to character so ggplot2 uses discrete scales
mtcars$vs   <- paste(mtcars$vs)
mtcars$gear <- paste(mtcars$gear)

g <- ggplot(mtcars) +
  aes(mpg, wt, color = vs) +
  geom_point(size = 3) +
  theme_bw()

g
```

<img src="/blog/2019/2019-08-15-custom-discrete-color-scales-for-ggplot2_files/figure-html/demo-1.png" width="768" />

Using our discrete color scale automatically uses our brand’s primary color
with the brand’s grey color we chose as the default `other` value.

``` r
g + scale_color_branded()
```

<img src="/blog/2019/2019-08-15-custom-discrete-color-scales-for-ggplot2_files/figure-html/demo2-1.png" width="768" />

The default value is designed to highlight `TRUE` values and soften `FALSE` values,
but you may want complementary colors instead.

``` r
g + scale_color_branded(other = "yellow")
```

<img src="/blog/2019/2019-08-15-custom-discrete-color-scales-for-ggplot2_files/figure-html/demo3-1.png" width="768" />

When the level ordering doesn’t match the colors,
we let the user reverse the direction of the palette by setting `direction = -1`.

``` r
g + scale_color_branded(other = "yellow", direction = -1)
```

<img src="/blog/2019/2019-08-15-custom-discrete-color-scales-for-ggplot2_files/figure-html/demo4-1.png" width="768" />

If you’d rather use a custom color for the `other` color,
we’ve given the user a small amount of leeway to deviate from the brand colors.

``` r
g + scale_color_branded(other = "#a2d729")
```

<img src="/blog/2019/2019-08-15-custom-discrete-color-scales-for-ggplot2_files/figure-html/demo5-1.png" width="768" />

But when there are more than 2 categorical levels,
the brand color palette is used…

``` r
g + aes(color = gear) + scale_color_branded()
```

<img src="/blog/2019/2019-08-15-custom-discrete-color-scales-for-ggplot2_files/figure-html/demo6-1.png" width="768" />

…and `primary` and `other` options are ignored…

``` r
g + aes(color = gear) + scale_color_branded(other = "yellow")
```

<img src="/blog/2019/2019-08-15-custom-discrete-color-scales-for-ggplot2_files/figure-html/demo7-1.png" width="768" />

…but the `direction` argument is still helpful.

``` r
g + aes(color = gear) + scale_color_branded(direction = -1)
```

<img src="/blog/2019/2019-08-15-custom-discrete-color-scales-for-ggplot2_files/figure-html/demo8-1.png" width="768" />

## Final thoughts

I used this technique to create a branded <span class="pkg">ggplot2</span> theme
at work and I’ve found that
this special treatment of binary categorical variables is incredibly helpful.

I frequently need to communicate two values or trends
in a way that allows for comparisons but clearly highlights one category.
A common example would be comparing local cancer rates with statewide averages,
and in these cases having a muted color for the comparison is incredibly helpful.

Here’s an example
using the Texas housing sales data that ships with <span class="pkg">ggplot2</span>
to showcase monthly total home sales in Austin
with Dallas sale volume shown for reference.

<img src="/blog/2019/2019-08-15-custom-discrete-color-scales-for-ggplot2_files/figure-html/tx-housing-example-1.png" width="768" />

### Indicate discrete/continuous in the function name

If you’re using this as guidance for building your own discrete color scale,
my final tip would be to modify the name of the scale function and
append `_d` to the end to indicate that the scale is discrete.

``` r
scale_color_branded_d()
```

You’ll want to leave space in your package for a continuous color scale
that will receive a `_c()` suffix.

### Create fill scale functions, too

Finally, you’ll also want to create `scale_fill_...()` functions as well.
You can create those using the same `branded_palette()` functions
you used for `scale_color_branded()`,
with the small tweak of replacing `"color"` with `"fill"`
as the first argument to `ggplot2::discrete_scale()`

### What about three colors?

[Emily Riederer](https://emilyriederer.netlify.com/)
has a neat function in her [Rtistic](https://github.com/emilyriederer/rtistic) package template
that I highly recommend you check out if you’re making a package of branded <span class="pkg">ggplot2</span> and <span class="pkg">rmarkdown</span> themes.

She calls it `scale_color_opinionated()`
and it works similarly to the functions I’ve laid out,
except that it provides a color scale specifically for categorical variables with three levels: `"good"`, `"neutral"`, and `"bad"`.

If this sounds like something you do frequently, consider adding an opinionated function to your package!

### Thanks

Thanks for reading!
Find me on Twitter [@grrrck](https://twitter.com/grrrck)
to let me know if this post was helpful.

And thanks to
[Benjamin Wolfe](https://twitter.com/BenjaminWolfe)
for inspiring this post!

{{% twitter "1161844769624137728" %}}
