---
title: My ggridges Twitter Header
author: ''
date: '2018-03-30'
slug: my-ggridges-twitter-header
aliases: /blog/2018/03/30/my-ggridges-twitter-header
categories: ["Blog"]
tags: ["R", "ggplot2", "Visualization", "Scripts", "Note to Self"]
---



First, I created a 1500 x 500 pixel image with the letter `g`.

![](/images/2018/garrick-text.png)

Then I made it fancy.


```r
# Requires
library(png)
library(ggplot2)
library(ggridges)
library(dplyr)
# also: purrr and reshape2
set.seed(4242)

theme_color <- "#002b36"

readPNG(image_file) %>% 
  .[, , 4] %>% 
  reshape2::melt() %>% 
  mutate(
    value = value + rnorm(length(value), sd = 0.25),
    value = case_when(value > 0 ~ value, TRUE ~ 0)
  ) %>% 
  filter(Var1 %in% seq(0, 500, 15)) %>% 
  group_by(Var1) %>% 
  split(.$Var1) %>% 
  purrr::map_df(~ {
    mutate(., value = zoo::rollmean(value, k = 20, fill = 0.1))
  }) %>% 
  ggplot() + 
  aes(Var2, -Var1, height = value, group = Var1) + 
  geom_ridgeline(
    scale = 30, 
    fill = theme_color, 
    alpha = 0.5, 
    color = "#cccccc") +
  theme_minimal() +
  theme(
    axis.text = element_blank(),
    panel.grid = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    axis.ticks = element_blank(),
    axis.line = element_blank(), axis.title = element_blank(),
    plot.background = element_rect(fill = theme_color, color = NA), 
    plot.margin = margin(32, 0, 32, 0))
```

<img src="/blog/2018/2018-03-30-my-ggridges-twitter-header_files/figure-html/unnamed-chunk-1-1.png" width="1440" />

Save the image at 1500x500, the preferred size for Twitter headers.

```r
ggsave("new-twitter-header.png", 
       width = 15, height = 5, 
       units = 'in', dpi = 100)
```

### Accidental Art

While hacking on the above, I ran into this [&commat;accidental_aRt](https://twitter.com/accidental__aRt):


```r
set.seed(4242)
readPNG(image_file) %>% 
  .[, , 4] %>% 
  reshape2::melt() %>% 
  mutate(value = value + rnorm(length(value), sd = 0.25)) %>% 
  filter(Var1 %in% seq(0, 500, 25)) %>% 
  mutate(Var2 = floor(Var2/20)*20) %>%
  ggplot(aes(Var2, -Var1, height = value, group = Var1)) + 
  geom_ridgeline_gradient(scale = 40, fill = "#394e5a") +
  theme_void()
```

<img src="/blog/2018/2018-03-30-my-ggridges-twitter-header_files/figure-html/unnamed-chunk-2-1.png" width="1440" />
