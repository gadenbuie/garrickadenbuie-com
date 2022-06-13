---
title: Process Profile Picture Preparation with magick
author: Garrick Aden-Buie
date: '2022-06-12'
slug: process-profile-picture-prep
categories:
  - Blog
tags:
  - R
  - magick
  - Images
  - Unexpected Uses of R
description: post description
twitterImage: /path/to/image.png
source_link: ''
keywords: rstats
editor_options:
  chunk_output_type: console
references: ~
post_data:
  photos:
    - id: DItYlc26zVI
      credit: christian buehner
    - id: bpxgyD4YYt4
      credit: Eunice Lituañas
    - id: 6anudmpILw4
      credit: Foto Sushi
    - id: 3dqSZidOkvs
      credit: Eye for Ebony
---

<!-- Links -->

## Send me your profile picture, please

Suppose you’ve asked 100-ish people to send you a profile picture
and to your surprise they all followed through and sent you an actual image.

But, of course, you now have a new problem.
Each of those 100-ish people has used slightly different sizes for their profile picture.
They’re all sorts of different shapes, sizes, and resolutions.

Some people’s profile images feature their faces, centered and tightly cropped.
Others are photographed at a distance or off-center.

<figure class="mh-auto mw6">
<img alt="A profile picture of a man, early 30s and smiling, against a soft gray background." src="profiles/DItYlc26zVI.jpg"/>
<figcaption>
An example profile picture you received.
Image by <a href="https:/unsplash.com/photos/DItYlc26zVI">christian buehner</a>.
</figcaption>
</figure>

In their final placement,
you want all of the profile images to be circular images
centered on the person’s face as much as possible.
If we took the image above and simply centered it inside a circle,
we would get something like this:

<div class="pa4 tc br-100 h4 w4 mh-auto shadow-4" style="background-size: cover; background-image: url(profiles/DItYlc26zVI.jpg)">

<div class="clip">

The example profile image clipped to fit a circular avatar image. The subject appears at the right edge of the circle. About 40% of their face is clipped.

</div>

</div>

Obviously, we’d rather clip 50% of the person out of their profile image,
so we’ll need to edit this photo.
But there are hundreds of these photos.
And you have access to R,
where we can use tools like magick to read and process the images,
or face detection with neural networks.

So with a few hours of work you can save yourself
[an hour of mindless clicking](https://xkcd.com/1319).
Let’s do this!

To see how this all works,
I’ve downloaded four example profile pictures from [unsplash](https://unsplash.com)[^1].

``` r
dir.create("profiles")
photo_ids <- c("DItYlc26zVI", "bpxgyD4YYt4", "6anudmpILw4", "3dqSZidOkvs")

for (id in photo_ids) {
  download.file(
    sprintf("https://source.unsplash.com/%s", id),
    sprintf("profiles/%s.jpg", id)
  )
}
```

## Magick with R

The first step is to use the magick package to read in our profile pictures.

``` r
library(magick)
library(purrr)

profiles <- 
  fs::dir_ls("profiles") |>
  map(image_read)

profiles
## $`profiles/3dqSZidOkvs.jpg`
##   format width height colorspace matte filesize density
## 1   JPEG  1080    810       sRGB FALSE   135368   72x72
## 
## $`profiles/6anudmpILw4.jpg`
##   format width height colorspace matte filesize density
## 1   JPEG  1080    720       sRGB FALSE    46181   72x72
## 
## $`profiles/DItYlc26zVI.jpg`
##   format width height colorspace matte filesize density
## 1   JPEG  1080    720       sRGB FALSE    87827   72x72
## 
## $`profiles/bpxgyD4YYt4.jpg`
##   format width height colorspace matte filesize density
## 1   JPEG  1080    608       sRGB FALSE    80277   72x72
## 
## $`profiles/sibVwORYqs0.jpg`
##   format width height colorspace matte filesize density
## 1   JPEG  1080    720       sRGB FALSE   127261   72x72
```

Here are the four profiles.
As you can see, they come in a variety of sizes
and the person in the frame is rarely centered.

<div class="tc">

![](index_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

</div>

[^1]: Images by <a href="https:/unsplash.com/photos/DItYlc26zVI">christian buehner</a>, <a href="https:/unsplash.com/photos/bpxgyD4YYt4">Eunice Lituañas</a>, <a href="https:/unsplash.com/photos/6anudmpILw4">Foto Sushi</a>, and <a href="https:/unsplash.com/photos/3dqSZidOkvs">Eye for Ebony</a>.
