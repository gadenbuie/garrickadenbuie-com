library(tidyverse)
future::plan(future::multisession())
progressr::handlers(global = TRUE)

source("plot_daylight_hours.R")
sysfonts::font_add_google("Outfit")


# World Cities ------------------------------------------------------------

if (fs::dir_exists("cities")) {
  fs::dir_delete("cities")
} 

cities <- download_cities()
cities_largest <- 
  cities %>% 
  filter(
    city != "City of London", 
    !is.na(country_name),
    country != "RU"
  ) %>%
  mutate(lat_group = ggplot2::cut_number(lat, n = 10)) %>% 
  group_by(lat_group, region) %>%
  slice_max(population, n = 1, with_ties = FALSE) %>%
  group_by(lat_group) %>% 
  slice_max(population, n = 3, with_ties = FALSE) %>% 
  bind_rows(
    cities %>% filter(population > 1e6, country != "RU") %>% slice_max(lat, n = 1),
    cities %>% filter(population > 1e5) %>% slice_min(lat, n = 1)
  ) %>% 
  ungroup()

city_plot_data <- 
  cities_largest %>%
  arrange(desc(lat)) %>%
  mutate(
    country_name = case_when(
      country == "US" ~ "USA",
      country == "GB" ~ "United Kingdom",
      country == "CD" ~ "DRC",
      country == "KR" ~ "Korea",
      country == "RU" ~ "Russia",
      country == "VE" ~ "Venezuela",
      TRUE ~ country_name
    ),
    title = glue::glue("{city}, {country_name}"),
    file = fs::path("cities", snakecase::to_snake_case(title), ext = "png")
  ) %>%
  select(lat, lon, timezone = tz, title, file) %>% 
  write_rds("cities_world.rds")

p <- progressr::progressor(steps = nrow(city_plot_data))

progressr::with_progress({
  furrr::future_pwalk(city_plot_data, function(lat, lon, timezone, title, file) {
    sysfonts::font_add_google("Outfit")
    showtext::showtext_auto()
    p()
    g <- plot_sun_times(lat, lon, timezone, title)
    message(file)
    ggsave(
      file,
      plot = g,
      width = 9,
      height = 8,
      dpi = 150
    )
    xfun::optipng(files = file)
  })
})

# US Cities ---------------------------------------------------------------

cities_us <- 
  download_us_cities() %>% 
  filter(city != "Anchorage") %>%
  mutate(
    title = case_when(
      nzchar(state) ~ paste(city, state_short, sep = ", "),
      TRUE ~ city
    ),
    id = case_when(
      nzchar(state) ~ paste(state, city, sep = " "),
      TRUE ~ city
    ),
    path = sprintf("us-cities/%s", snakecase::to_snake_case(id))
  ) %>% 
  arrange(state, city) %>% 
  write_rds("cities_us.rds")

if (fs::dir_exists("us-cities")) fs::dir_delete("us-cities")
fs::dir_create("us-cities")

cities_us_full <- 
  cities_us %>% 
  expand_grid(keep = c("normal", "dst", "standard"))

p <- progressr::progressor(steps = nrow(cities_us_full))
progressr::with_progress({
  cities_us_full %>% 
  furrr::future_pwalk(function(lat, lon, timezone, title, path, keep, ...) {
    g <- plot_sun_times(lat, lon, timezone, title = title, stay_in = keep)
    if (keep == "dst") {
      g <- g +
        labs(title = "How long are the days if we **never leave Daylight Saving Time?**") +
        theme(plot.title = ggtext::element_markdown(family = "Outfit"))
    } else if (keep == "standard") {
      g <- g +
        labs(title = "How long are the days if we **stick with Standard Time?**") +
        theme(plot.title = ggtext::element_markdown(family = "Outfit"))
    } else {
      g <- g +
          labs(title = "How long are the days with the **status quo?**") +
          theme(plot.title = ggtext::element_markdown(family = "Outfit"))
    }
    
    file <- sprintf("%s_%s.png", path, keep)
    message(file)
    ggsave(
      file,
      plot = g,
      width = 9,
      height = 8,
      dpi = 150
    )
    xfun::optipng(files = file)
  })
})