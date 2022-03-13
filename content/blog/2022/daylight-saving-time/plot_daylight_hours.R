plot_sun_times <- function(lat, lon, timezone, title, font_family = "Outfit") {
  sun_times <- 
    suncalc::getSunlightTimes(
      date = seq(
        as.Date("2022-01-01"),
        as.Date("2023-01-01"),
        by = "day"
      ),
      lat = lat,
      lon = lon,
      tz = timezone,
      keep = c("dawn", "nauticalDawn", "dusk", "nauticalDusk", "sunrise", "sunset")
    )
  
  tidy_sun_times <- 
    sun_times %>% 
    select(-lat, -lon) %>%
    pivot_longer(-date, names_to = "event", values_to = "time") %>% 
    mutate(
      tz = strftime(time, "%Z", tz = timezone),
      time = hms::as_hms(time),
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
    mutate(
      across(c(starts, ends), as.numeric),
      starts = if_else(starts > 12 * 60^2, 0 - starts, starts),
      ends = if_else(ends < 12 * 60^2, 24 * 60^2 + ends, ends),
      label = factor(label, c("nauticalDawn", "dawn", "sunrise"))
    )
  
  x_breaks <- seq(
    from = as.Date("2022-01-01"),
    to = as.Date("2023-01-01"),
    by = "2 months"
  )
  y_breaks <- seq(0, 24*60^2, by = 3 * 60^2)
  color_text <- "#F2CDB9"
  
  ggplot(tidy_sun_times) +
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
      x = min(tidy_sun_times$date),
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
      limits = c(max(tidy_sun_times$ends + 60^2), min(tidy_sun_times$starts - 60^2)),
      breaks = y_breaks,
      labels = paste0(seq(0, 24, by = 3), ":00"),
      expand = expansion()
    ) +
    labs(
      x = NULL,
      y = NULL,
      title = "How long are the days near me?",
      subtitle = title,
      caption = "garrickadenbuie.com"
    ) +
    coord_cartesian(clip = "off") +
    theme_minimal(base_family = font_family, base_size = 16) +
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
}

download_cities <- function() {
  cities <- readr:::read_tsv(
    "https://github.com/substack/cities1000/raw/master/cities1000.txt", 
    col_names = c(
      'id',
      'name',
      'asciiname',
      'alternativeNames',
      'lat',
      'lon',
      'featureClass',
      'featureCode',
      'country',
      'altCountry',
      'adminCode',
      'countrySubdivision',
      'municipality',
      'municipalitySubdivision',
      'population',
      'elevation',
      'dem',
      'tz',
      'lastModified'
    )
  ) %>% 
    janitor::clean_names() %>% 
    filter(population > 50000) %>% 
    select(asciiname, lat, lon, country, admin_code, tz, population)
  
  country_codes <- readr::read_csv("https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/raw/master/all/all.csv") %>% 
    janitor::clean_names() %>% 
    select(country_name = name, alpha_2, region, sub_region)
  
  dplyr::left_join(
    cities,
    country_codes,
    by = c(country = "alpha_2")
  )
}