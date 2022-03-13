---
title: Daylight with Daylight Saving Time
author: Garrick Aden-Buie
date: '2022-03-12'
slug: daylight-saving-time
categories:
  - Blog
tags:
  - Visualization
description: post description
twitterImage: /path/to/image.png
source_link: ''
keywords: rstats
editor_options:
  chunk_output_type: console
---

<!-- Links -->



## Inspiration

[How long are the nights?](https://plotparade.com/gallery_sunrise.html)

![How long are the nights in New York City? by [Krisztina Szucs](https://krisztinaszucs.com/)](https://plotparade.com/chartimg/SUNRISE/c_NYC.jpg)

## Where are you?


```r
i_am_here <- as.list(ipapi::geolocate(NA, .progress = FALSE))
i_am_here$lat <- i_am_here$lat + runif(1, min = -1)
i_am_here$lon <- i_am_here$lon + runif(1, min = -1)

i_am_here[c("lat", "lon", "timezone")]
```

```
## $lat
## [1] 34.34348
## 
## $lon
## [1] -84.57913
## 
## $timezone
## [1] "America/New_York"
```

## Sunrise and Sunset Times


```r
sun_times <- 
  suncalc::getSunlightTimes(
    date = seq(
      as.Date("2022-01-01"),
      as.Date("2023-01-01"),
      by = "day"
    ),
    lat = i_am_here$lat,
    lon = i_am_here$lon,
    tz = i_am_here$timezone,
    keep = c("dawn", "nauticalDawn", "dusk", "nauticalDusk", "sunrise", "sunset")
  )
```

## Tidy Sun Times


```r
library(tidyverse)

tidy_sun_times <- 
  sun_times %>% 
  select(-lat, -lon) %>%
  pivot_longer(-date, names_to = "event", values_to = "time") %>% 
  mutate(
    tz = strftime(time, "%Z"), 
    time = hms::as_hms(time)
  )
```


## First Looks


```r
ggplot(tidy_sun_times) + 
  aes(x = date, y = time, color = event) +
  geom_line()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/plot-first-looks-1.png" width="864" />

## Paired Events (Start and End)


```r
tidier_sun_times <- 
  tidy_sun_times %>%
  mutate(
    period = case_when(
      str_detect(event, "[dD]awn|sunrise") ~ "starts",
      str_detect(event, "[dD]usk|sunset") ~ "ends"
    ),
    label = recode(
      event,
      nauticalDusk = "nauticalDawn",
      sunset = "sunrise",
      dusk = "dawn"
    )
  ) %>% 
  pivot_wider(
    names_from = "period", 
    values_from = "time"
  ) %>% 
  group_by(date, tz, label) %>% 
  summarize(
    events = paste(event, collapse = ","),
    label = first(event),
    starts = starts[!is.na(starts)],
    ends = ends[!is.na(ends)]
  ) %>% 
  ungroup() %>% 
  mutate(label = factor(label, c("nauticalDawn", "dawn", "sunrise")))
```

## Another plot


```r
ggplot(tidier_sun_times) +
  aes(date, ymin = starts, ymax = ends, fill = label) +
  geom_ribbon()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/plot-tidier-sun-times-1.png" width="864" />

Reverse the time axes and provide our own labels


```r
ggplot(tidier_sun_times) +
  aes(date, ymin = starts, ymax = ends, fill = label) +
  geom_ribbon() +
  scale_y_reverse(
    limits = c(24*60^2, 0),
    breaks = seq(0, 24*60^2, by = 3 * 60^2),
    labels = paste0(seq(0, 24, by = 3), ":00"),
    expand = expansion()
  )
```

<img src="{{< blogdown/postref >}}index_files/figure-html/plot-tidier-sun-times-2-1.png" width="864" />

## Make it pretty


```r
sysfonts::font_add_google("Outfit")
```


```r
x_breaks <- seq(
  from = as.Date("2022-01-01"),
  to = as.Date("2023-01-01"),
  by = "2 months"
)
y_breaks <- seq(0, 24*60^2, by = 3 * 60^2)
color_text <- "#F2CDB9"

ggplot(tidier_sun_times) +
  aes(date) +
  geom_text(
    data = cross_df(list(date = x_breaks, time = y_breaks, label = "+")) %>% 
      mutate(across(date, as.Date, origin = "1970-01-01")),
    aes(label = label, y = time),
    color = "#C29F5F"
  ) +
  geom_ribbon(
    aes(ymin = starts, ymax = ends, fill = label, alpha = label),
    show.legend = FALSE
  ) +
  geom_hline(
    yintercept = c(9, 17) * 60^2,
    color = "#39304a",
    alpha = 0.5,
    linetype = 2
  ) +
  annotate(
    geom = "text",
    x = min(tidier_sun_times$date),
    y = c(9, 17) * 60^2,
    label = c("9am", "5pm"),
    color = "#39304a",
    hjust = -0.25,
    vjust = c(2, -1)
  ) +
  geom_text(
    data = . %>% 
      filter(tz != coalesce(lag(tz), first(tz))) %>% 
      slice_head(n = 1),
    aes(y = ends, label = tz),
    hjust = 1,
    vjust = 1,
    nudge_x = -21,
    nudge_y = -60^2 * 1.5,
    lineheight = 0.8,
    color = color_text
  ) +
  geom_curve(
    data = . %>% 
      filter(label == "nauticalDawn") %>%
      filter(tz != coalesce(lag(tz), first(tz))) %>% 
      slice_head(n = 1), 
    aes(x = date - 17, xend = date, y = ends - (-60^2 * 1.2), yend = ends + 500),
    arrow = arrow(length = unit(0.08, "inch")), 
    size = 0.5,
    color = color_text,
    curvature = 0.4
  ) +
  geom_text(
    data = . %>% 
      filter(tz != coalesce(lag(tz), first(tz))) %>% 
      slice_tail(n = 1),
    aes(y = starts, label = tz),
    hjust = 1,
    nudge_x = -21,
    nudge_y = 60^2 * 1.5,
    lineheight = 0.8,
    color = color_text
  ) +
  geom_curve(
    data = . %>% 
      filter(label == "nauticalDawn") %>%
      filter(tz != coalesce(lag(tz), first(tz))) %>% 
      slice_tail(n = 1),
    aes(x = date - 17, xend = date, y = starts - 60^2, yend = starts - 500),
    arrow = arrow(length = unit(0.08, "inch")), 
    size = 0.5,
    color = color_text,
    curvature = -0.4
  ) +
  ggrepel::geom_label_repel(
    data = . %>% filter(date == max(date)) %>% 
      separate_rows(events, sep = ",") %>% 
      mutate(
        date = date + 12,
        time = if_else(events == label, starts, ends),
        events = snakecase::to_title_case(events)
      ),
    aes(y = time, fill = label, label = events),
    color = "#39304a",
    fontface = "bold",
    show.legend = FALSE,
    direction = "y",
    min.segment.length = 20,
    hjust = 0,
    label.size = 0,
    label.padding = 0.33,
    box.padding = 0.25,
    xlim = c(as.Date("2023-01-07"), NA)
  ) +
  scale_fill_manual(
    values = c(
      nauticalDawn = "#b56576",
      dawn = "#eaac8b",
      sunrise = "#ffd27d"
    )
  ) +
  scale_alpha_discrete(range = c(0.5, 0.9)) +
  scale_x_date(
    breaks = x_breaks, 
    date_labels = "%b", 
    limits = c(
      as.Date("2022-01-01"),
      as.Date("2023-03-15")
    ),
    expand = expansion()
  ) +
  scale_y_reverse(
    limits = c(max(tidier_sun_times$ends + 60^2), min(tidier_sun_times$starts - 60^2)),
    breaks = y_breaks,
    labels = paste0(seq(0, 24, by = 3), ":00"),
    expand = expansion()
  ) +
  labs(
    x = NULL,
    y = NULL,
    title = "How long are the days near me?",
    subtitle = "Atlanta, GA",
    caption = "garrickadenbuie.com"
  ) +
  coord_cartesian(clip = "off") +
  theme_minimal(base_family = "Outfit", base_size = 16) +
  theme(
    plot.title = element_text(color = color_text, hjust = 0, size = 14),
    plot.subtitle = element_text(color = color_text, hjust = 0, size = 24, margin = margin(b = 6)),
    plot.title.position = "plot",
    plot.background = element_rect(fill = "#39304a"),
    plot.margin = margin(20, 0, 20, 10),
    # panel.border = element_rect(color = color_text, fill = NA),
    panel.grid = element_blank(),
    axis.text = element_text(color = color_text),
    axis.title = element_text(color = color_text),
    plot.caption = element_text(color = "#726194", hjust = 0.97, vjust = -1),
    plot.caption.position = "plot"
  )
```

<img src="{{< blogdown/postref >}}index_files/figure-html/daylight-hours-atlanta-1.png" width="864" />


