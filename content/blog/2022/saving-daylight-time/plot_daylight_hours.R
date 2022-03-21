make_no_time_change <- function(tidy_sun_times, lon, keep = "dst") {
  keep <- match.arg(keep, c("dst", "standard"))
  times <- tidy_sun_times$time
  
  dst_offset <-
    lubridate::force_tz(times, "UTC") %>% 
    difftime(times, units = "secs") %>% 
    as.numeric()
  
  times <- lubridate::force_tz(times, "UTC")

  time_offsets <- 
    if (keep == "dst") {
      lubridate::seconds(max(dst_offset) - dst_offset)
    } else (
      lubridate::seconds(min(dst_offset) - dst_offset)
    )
  
  tidy_sun_times$time <- times + as.integer(time_offsets)
  tidy_sun_times$tz <- "UTC"
  tidy_sun_times
}

hms_dbl <- function(x) {
  lubridate::hour(x) * 60^2 +
    lubridate::minute(x) * 60 +
    lubridate::second(x)
}

hms_str <- function(x, hours_24 = FALSE, drop = 0) {
  hours <- floor(x / 60^2)
  x <- x - hours * 60^2
  am_pm <- if (hours_24) "" else if (hours >= 12) " pm" else " am"
  
  hours <- if (hours_24 && hours != 24) {
    sprintf("%02d", hours %% 12)
  } else {
    sprintf("%d", hours)
  }
  if (drop > 1) {
    return(sprintf("%s%s", hours, am_pm))
  }
  mins <- floor(x / 60)
  if (drop > 0) {
    return(sprintf("%s:%02d%s", hours, mins, am_pm))
  }
  x <- x - mins * 60
  secs <- floor(x)
  sprintf("%s:%02d:%02d%s", hours, mins, secs, am_pm)
}

plot_sun_times <- function(
  lat, 
  lon, 
  timezone, 
  title, 
  font_family = "Outfit", 
  stay_in = c("no", "dst", "standard")
) {
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
    mutate(tz = strftime(time, "%Z", tz = timezone))
  
  if (stay_in %in% c("dst", "standard")) {
    tidy_sun_times <- make_no_time_change(tidy_sun_times, lon, keep = stay_in)
  }
  
  tidy_sun_times <- 
    tidy_sun_times %>% 
    mutate(
      time = hms_dbl(time),
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
      ends = ends[!is.na(ends)],
      .groups = "drop"
    ) %>% 
    mutate(
      across(c(starts, ends), as.numeric),
      ends = if_else(ends < 60^2, 24 * 60^2, ends),
      label = factor(label, c("nauticalDawn", "dawn", "sunrise"))
    ) %>% 
    complete(nesting(date, tz), nesting(label, events)) %>%
    replace_na(list(starts = 0, ends = 24 * 60^2))
  
  x_breaks <- seq(
    from = as.Date("2022-01-01"),
    to = as.Date("2023-01-01"),
    by = "2 months"
  )
  y_breaks <- seq(0, 24*60^2, by = 3 * 60^2)
  
  color_text <- "#F2CDB9"
  color_caption <- "#726194"
  
  ggplot(tidy_sun_times) +
    aes(date) +
    geom_text(
      data = cross_df(list(date = x_breaks, time = y_breaks, label = "+")) %>% 
        mutate(across(date, as.Date, origin = "1970-01-01")),
      aes(label = label, y = time),
      color = "#C29F5F"
    ) +
    ggfx::with_shadow(
      geom_ribbon(
        data = . %>% filter(label == "nauticalDawn"),
        aes(ymin = starts, ymax = ends, fill = label, alpha = label),
        show.legend = FALSE
      ),
      colour = "#666666",
      x_offset = 0,
      y_offset = 0,
      sigma = 1.66
    ) +
    ggfx::with_shadow(
      geom_ribbon(
        data = . %>% filter(label == "dawn"),
        aes(ymin = starts, ymax = ends, fill = label, alpha = label),
        show.legend = FALSE
      ),
      colour = "#666666",
      x_offset = 0,
      y_offset = 0,
      sigma = 1.66
    ) +
    ggfx::with_shadow(
      geom_ribbon(
        data = . %>% filter(label == "sunrise"),
        aes(ymin = starts, ymax = ends, fill = label, alpha = label),
        show.legend = FALSE
      ),
      colour = "#666666",
      x_offset = 0,
      y_offset = 0,
      sigma = 1.66
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
      vjust = c(2, -1),
      family = font_family
    ) +
    # First DST-related shift
    geom_text(
      data = . %>% 
        filter(label == "nauticalDawn") %>% 
        filter(tz != coalesce(lag(tz), first(tz))) %>% 
        slice_head(n = 1),
      aes(y = ends, label = tz),
      hjust = max(sign(lat), 0),
      vjust = 0,
      nudge_x = sign(lat) * -21,
      nudge_y = -60^2 * 1.5,
      lineheight = 0.8,
      family = font_family,
      color = color_text
    ) +
    geom_curve(
      data = . %>% 
        filter(label == "nauticalDawn") %>%
        filter(tz != coalesce(lag(tz), first(tz))) %>% 
        slice_head(n = 1), 
      aes(
        x = date + (-sign(lat) * 17),
        xend = date,
        y = ends - (-60^2 * 1.2),
        yend = ends + (2 - sign(lat)) * 500
      ),
      arrow = arrow(length = unit(0.08, "inch")), 
      size = 0.5,
      color = color_text,
      curvature = sign(lat) * 0.4
    ) +
    # Second DST-related shift
    geom_text(
      data = . %>% 
        filter(label == "nauticalDawn") %>%
        filter(tz != coalesce(lag(tz), first(tz))) %>% 
        slice_tail(n = 1),
      aes(y = starts, label = tz),
      hjust = max(sign(lat), 0),
      vjust = (1 + sign(lat)) * 0.5,
      nudge_x = sign(lat) * -21,
      nudge_y = 60^2 * 1.5,
      lineheight = 0.8,
      family = font_family,
      color = color_text
    ) +
    geom_curve(
      data = . %>% 
        filter(label == "nauticalDawn") %>%
        filter(tz != coalesce(lag(tz), first(tz))) %>% 
        slice_tail(n = 1),
      aes(
        x = date + (-sign(lat) * 17),
        xend = date,
        y = starts - (if (lat < 0) 2 else 1) * 60^2,
        yend = starts - (2 - sign(lat)) * 500
      ),
      arrow = arrow(length = unit(0.08, "inch")), 
      size = 0.5,
      color = color_text,
      curvature = sign(lat) * -0.4
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
      # limits = c(max(tidy_sun_times$ends + 60^2), min(tidy_sun_times$starts - 60^2)),
      limits = c(max(tidy_sun_times$ends, 24 * 60^2), min(tidy_sun_times$starts, 0)),
      breaks = y_breaks,
      labels = paste0(seq(0, 24, by = 3), ":00"),
      expand = expansion()
    ) +
    labs(
      x = NULL,
      y = NULL,
      title = "How long are the days in",
      subtitle = title,
      caption = c(
        glue::glue(
          "{lat} {lon}",
          lat = paste0(format(abs(lat), digits = 1, nsmall = 1), "\u00ba", if (lat >= 0) "N" else "S"),
          lon = paste0(format(abs(lon), digits = 1, nsmall = 1), "\u00ba", if (lon >= 0) "E" else "W")
        ),
        "garrickadenbuie.com"
      )
    ) +
    coord_cartesian(clip = "off") +
    theme_minimal(base_family = font_family, base_size = 16) +
    theme(
      plot.title = element_text(color = color_text, hjust = 0, size = 18),
      plot.subtitle = element_text(color = color_text, hjust = 0, size = 32, margin = margin(b = 24)),
      plot.title.position = "plot",
      plot.background = element_rect(fill = "#39304a"),
      plot.margin = margin(20, 0, 20, 10),
      panel.grid = element_blank(),
      axis.text = element_text(color = color_text),
      axis.title = element_text(color = color_text),
      plot.caption = element_text(color = color_caption, hjust = c(0, 0.97), vjust = -1),
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
    select(city = asciiname, lat, lon, country, admin_code, tz, population)
  
  country_codes <- readr::read_csv("https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes/raw/master/all/all.csv") %>% 
    janitor::clean_names() %>% 
    select(country_name = name, alpha_2, region, sub_region)
  
  dplyr::left_join(
    cities,
    country_codes,
    by = c(country = "alpha_2")
  )
}


download_us_cities <- function() {
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
    filter(country == "US", population > 1e5) %>% 
    select(city = asciiname, lat, lon, country, state_short = admin_code, timezone = tz, population) %>% 
    mutate(state = set_names(state.name, state.abb)[state_short]) %>%
    replace_na(list(state = ""))
}