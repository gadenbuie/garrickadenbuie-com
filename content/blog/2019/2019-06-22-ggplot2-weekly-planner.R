## ---- ggweek_planner

highlight_days <- dplyr::tribble(
        ~ day,       ~ label,   ~ color,    ~ fill,
  "2019-07-04",    "July 4th", "#b4436c", "#b4436c",
  "2019-08-16", "First Draft", "#002B36", "#002B36",
  "2019-09-02",   "Labor Day", "#b4436c", "#b4436c",
  "2019-09-13", "Project Due", "#002B36", "#002B36",
) %>% 
  dplyr::mutate_at(dplyr::vars(day), lubridate::ymd)

ggweek_planner <- function(
  start_day = lubridate::today(),
  end_day = start_day + lubridate::weeks(8),
  highlight_days = NULL,
  show_month_boundaries = TRUE,
  highlight_text_size = 2,
  month_text_size = 4,
  month_color = "#f78154"
) {
  old_opts <- options("lubridate.week.start" = 1)
  on.exit(options(old_opts))
  
  force(end_day)
  start_day <- floor_date(start_day, "week")
  seq_days  <- seq(start_day, end_day, by = "day")
  
  dates <-
    dplyr::tibble(
      day       = seq_days,
      wday_name = lubridate::wday(day, label = TRUE, abbr = TRUE),
      weekend   = lubridate::wday(day) > 5,
      isoweek   = lubridate::isoweek(day),
      month     = lubridate::month(day, label = TRUE, abbr = FALSE),
      isoyear   = lubridate::isoyear(day),
      week_year = forcats::fct_rev(sprintf("%s - %s", isoyear, isoweek))
    )
  
  day_one <- dates %>% 
    dplyr::filter(lubridate::day(day) == 1)
  
  week_start_labels <- dates %>%
    dplyr::filter(wday_name == "Mon") %>% 
    dplyr::arrange(day) %>%
    dplyr::mutate(
      month = lubridate::month(day, label = TRUE), 
      label = dplyr::case_when(
        month == dplyr::lag(month) ~ paste(lubridate::day(day)),
        TRUE ~ sprintf("%s %4i", month, lubridate::day(day))
      )
    ) %>% 
    dplyr::select(label, week_year) %>% 
    purrr::reduce(purrr::set_names)
  
  gcal <-
    dates %>% 
    dplyr::mutate(
      # Softly fill in the weekend days
      weekend = dplyr::case_when(weekend ~ "#f8f8f8", TRUE ~ "#FFFFFF")
    ) %>% 
    ggplot2::ggplot() +
    ggplot2::aes(wday_name, week_year) +
    ggplot2::geom_tile(ggplot2::aes(fill = weekend), color = "#aaaaaa") +
    ggplot2::geom_tile(
      data = day_one,
      fill = month_color,
      alpha = 0.25
    ) +
    ggplot2::geom_text(
      data = day_one, 
      ggplot2::aes(label = month),
      family = "PT Sans Narrow",
      color = month_color,
      size = month_text_size,
      hjust = 0,
      nudge_x = -0.45,
      vjust = 1,
      nudge_y = 0.45
    ) +
    ggplot2::geom_tile(
      data = dates %>% dplyr::inner_join(highlight_days, by = "day"),
      ggplot2::aes(fill = fill, color = color),
      alpha = 0.25
    ) +
    ggplot2::geom_text(
      data = dates %>% dplyr::inner_join(highlight_days, by = "day"),
      ggplot2::aes(label = label, color = color),
      family = "PT Sans Narrow",
      size = highlight_text_size,
      hjust = 0,
      nudge_x = -0.45,
      vjust = 0,
      nudge_y = -0.40
    ) +
    ggplot2::scale_x_discrete(position = "top") +
    ggplot2::scale_y_discrete(labels = week_start_labels) +
    ggplot2::scale_fill_identity() +
    ggplot2::scale_color_identity() +
    ggplot2::guides(fill = FALSE) +
    ggplot2::theme_minimal(base_family = "PT Sans") +
    ggplot2::theme(
      axis.text = ggplot2::element_text("PT Sans Narrow"),
      axis.title = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      axis.text.x.top = ggplot2::element_text(face = "bold"),
      axis.title.x.top = ggplot2::element_blank(),
    )
  
  if (show_month_boundaries) {
    month_boundaries <- day_one %>%
      dplyr::select(day, month, wday_name, week_year) %>%
      dplyr::mutate_at(dplyr::vars(wday_name, week_year), as.integer) %>%
      dplyr::mutate(
        left = purrr::map2(wday_name, week_year, ~ {
          # n/a if month changes on first day
          if (.x == 1) return(dplyr::tibble(.missing = NA)) 
          dplyr::tibble(
            x = 0.5,      xend = .x - 0.5, 
            y = .y - 0.5, yend = y
          )
        }),
        up = purrr::map2(wday_name, week_year, ~ {
          # n/a if month changes on first day
          if (.x == 1) return(dplyr::tibble(.missing = NA)) 
          dplyr::tibble(
            x = .x - 0.5, xend = x, 
            y = .y - 0.5, yend = .y + 0.5
          )
        }),
        right = purrr::map2(wday_name, week_year, ~ {
          dplyr::tibble(
            x = .x - 0.5, xend = 7.5, 
            y = .y + 0.5, yend = y
          )
        })
      )
    
    for (boundary in c("left", "up", "right")) {
      gcal <- gcal + 
        ggplot2::geom_segment(
          data = month_boundaries %>% tidyr::unnest(!!rlang::sym(boundary)),
          ggplot2::aes(x = x, y = y, xend = xend, yend = yend),
          color = "#999999",
          linetype = 2
        )
    }
  }
  
  gcal
}