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

``` r
location <- as.list(ipapi::geolocate(NA, .progress = FALSE))
location$lat <- location$lat + runif(1, min = -1)
location$lon <- location$lon + runif(1, min = -1)

location[c("lat", "lon", "timezone")]
```

    ## $lat
    ## [1] 33.60087
    ## 
    ## $lon
    ## [1] -84.00078
    ## 
    ## $timezone
    ## [1] "America/New_York"

## Sunrise and Sunset Times

``` r
sun_times <- 
  suncalc::getSunlightTimes(
    date = seq(
      as.Date("2022-01-01"),
      as.Date("2023-01-01"),
      by = "day"
    ),
    lat = location$lat,
    lon = location$lon,
    tz = location$timezone,
    keep = c("dawn", "nauticalDawn", "dusk", "nauticalDusk", "sunrise", "sunset")
  )
```

## Tidy Sun Times

``` r
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

``` r
ggplot(tidy_sun_times) + 
  aes(x = date, y = time, color = event) +
  geom_line()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/plot-first-looks-1.png" width="864" />

## Paired Events (Start and End)

``` r
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

``` r
ggplot(tidier_sun_times) +
  aes(date, ymin = starts, ymax = ends, fill = label) +
  geom_ribbon()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/plot-tidier-sun-times-1.png" width="864" />

Reverse the time axes and provide our own labels

``` r
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

``` r
sysfonts::font_add_google("Outfit")
```

``` r
x_breaks <- seq(
  from = as.Date("2022-01-01"),
  to = as.Date("2023-01-01"),
  by = "2 months"
)
y_breaks <- seq(0, 24*60^2, by = 3 * 60^2)
color_text <- "#F2CDB9"
color_bg <- "#39304a"

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
    color = color_bg,
    alpha = 0.5,
    linetype = 2
  ) +
  annotate(
    geom = "text",
    x = min(tidier_sun_times$date),
    y = c(9, 17) * 60^2,
    label = c("9am", "5pm"),
    color = color_bg,
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
    color = color_bg,
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
    plot.background = element_rect(fill = color_bg),
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

## Around the World

<div class="pa">
<label class="b db mb2" for="choose-city">Pick a city</label>
<div class="mb2">
<select id="choose-city" class="input-reset db di-ns mb2 pa2 ba br1 select-dropdown-arrow custom-text-color custom-bg-light">
<option value="cities/saint_petersburg_russia.png" data-city="Saint Petersburg, Russia">Saint Petersburg, Russia</option>
<option value="cities/moscow_russia.png" data-city="Moscow, Russia">Moscow, Russia</option>
<option value="cities/berlin_germany.png" data-city="Berlin, Germany">Berlin, Germany</option>
<option value="cities/london_gb.png" data-city="London, GB">London, GB</option>
<option value="cities/kiev_ukraine.png" data-city="Kiev, Ukraine">Kiev, Ukraine</option>
<option value="cities/rome_italy.png" data-city="Rome, Italy">Rome, Italy</option>
<option value="cities/istanbul_turkey.png" data-city="Istanbul, Turkey">Istanbul, Turkey</option>
<option value="cities/new_york_city_us.png" data-city="New York City, US">New York City, US</option>
<option value="cities/madrid_spain.png" data-city="Madrid, Spain">Madrid, Spain</option>
<option value="cities/shanghai_china.png" data-city="Shanghai, China">Shanghai, China</option>
<option value="cities/alexandria_egypt.png" data-city="Alexandria, Egypt">Alexandria, Egypt</option>
<option value="cities/cairo_egypt.png" data-city="Cairo, Egypt">Cairo, Egypt</option>
<option value="cities/delhi_india.png" data-city="Delhi, India">Delhi, India</option>
<option value="cities/karachi_pakistan.png" data-city="Karachi, Pakistan">Karachi, Pakistan</option>
<option value="cities/dhaka_bangladesh.png" data-city="Dhaka, Bangladesh">Dhaka, Bangladesh</option>
<option value="cities/mexico_city_mexico.png" data-city="Mexico City, Mexico">Mexico City, Mexico</option>
<option value="cities/mumbai_india.png" data-city="Mumbai, India">Mumbai, India</option>
<option value="cities/manila_philippines.png" data-city="Manila, Philippines">Manila, Philippines</option>
<option value="cities/kano_nigeria.png" data-city="Kano, Nigeria">Kano, Nigeria</option>
<option value="cities/lagos_nigeria.png" data-city="Lagos, Nigeria">Lagos, Nigeria</option>
<option value="cities/abidjan_côte_d_ivoire.png" data-city="Abidjan, Côte d&#39;Ivoire">Abidjan, Côte d'Ivoire</option>
<option value="cities/bogota_colombia.png" data-city="Bogota, Colombia">Bogota, Colombia</option>
<option value="cities/kinshasa_drc.png" data-city="Kinshasa, DRC">Kinshasa, DRC</option>
<option value="cities/port_moresby_papua_new_guinea.png" data-city="Port Moresby, Papua New Guinea">Port Moresby, Papua New Guinea</option>
<option value="cities/lima_peru.png" data-city="Lima, Peru">Lima, Peru</option>
<option value="cities/suva_fiji.png" data-city="Suva, Fiji">Suva, Fiji</option>
<option value="cities/noumea_new_caledonia.png" data-city="Noumea, New Caledonia">Noumea, New Caledonia</option>
<option value="cities/rio_de_janeiro_brazil.png" data-city="Rio de Janeiro, Brazil">Rio de Janeiro, Brazil</option>
<option value="cities/sao_paulo_brazil.png" data-city="Sao Paulo, Brazil">Sao Paulo, Brazil</option>
<option value="cities/sydney_australia.png" data-city="Sydney, Australia">Sydney, Australia</option>
<option value="cities/cape_town_south_africa.png" data-city="Cape Town, South Africa">Cape Town, South Africa</option>
<option value="cities/buenos_aires_argentina.png" data-city="Buenos Aires, Argentina">Buenos Aires, Argentina</option>
<option value="cities/auckland_new_zealand.png" data-city="Auckland, New Zealand">Auckland, New Zealand</option>
<option value="cities/melbourne_australia.png" data-city="Melbourne, Australia">Melbourne, Australia</option>
<option value="cities/wellington_new_zealand.png" data-city="Wellington, New Zealand">Wellington, New Zealand</option>
</select>
<button id="choose-city-prev" class="link dim ph3 pv2 bn br1 custom-text-color custom-bg-light">
<i class="fa fa-arrow-left" role="presentation" aria-label="arrow-left icon"></i>
<span class="clip">Previous city</span>
</button>
<button id="choose-city-next" class="link dim ph3 pv2 bn br1 custom-text-color custom-bg-light">
<i class="fa fa-arrow-right" role="presentation" aria-label="arrow-right icon"></i>
<span class="clip">Next city</span>
</button>
</div>
</div>
<div id="city-plot" aria-live="polite">
<img src="cities/saint_petersburg_russia.png" alt="Saint Petersburg, Russia"/>
</div>
<!-- html_preserve -->
<style type="text/css">
.city-plots {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 1em;
}
.custom-bg-light {
  background-color: var(--slate-90);
}
@media (prefers-color-scheme: dark) {
  .custom-bg-light {
    background-color: var(--slate-20);
  }
}
</style>
<script type="text/javascript">
function updatePlotSelectedCity() {
  const plot = document.querySelector('#city-plot > img')
  const inputCity = document.getElementById('choose-city')
  plot.src = inputCity.value
  plot.setAttribute('alt', inputCity.dataset.city)
}
document.addEventListener('DOMContentLoaded', updatePlotSelectedCity)
document.getElementById('choose-city').addEventListener('change', updatePlotSelectedCity)
Array.from(
  document.getElementById('choose-city').parentElement.querySelectorAll('button')
).map(btn => btn.addEventListener('click', function(ev) {
    const inputCity = document.getElementById('choose-city')
    const idxCurrent = Array.from(inputCity.options).findIndex(el => inputCity.value == el.value)
    let idxNext = idxCurrent + (ev.currentTarget.id === 'choose-city-prev' ? -1 : 1)
    console.log({idxCurrent, idxNext})
    if (idxNext < 0) {
      idxNext = inputCity.options.length - 1
    } else if (idxNext >= inputCity.options.length) {
      idxNext = 0
    }
    inputCity.value = inputCity.options[idxNext].value
    inputCity.dispatchEvent(new Event('change'))
  })
)
</script>
<!-- /html_preserve -->
