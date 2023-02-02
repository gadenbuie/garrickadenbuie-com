if (file.exists('~/.Rprofile')) {
  sys.source('~/.Rprofile', envir = environment())
}

options(
  blogdown.hugo.version = "0.89.1",
  blogdown.generator.server = TRUE,
  blogdown.author = "Garrick Aden-Buie",
  blogdown.subdir = strftime(Sys.time(), "blog/%Y"),
  blogdown.ext = ".Rmd",
  blogdown.hugo.server = c('-D', '-F', '--navigateToChanged')
)

# General Blog Helpers ----

lightbox_img <- function(url, alt = "", caption = "", preview = TRUE, img_extra = "") {
  if (preview) {
    description <- ""
    if (nzchar(caption)) {
      description <- glue::glue(' description="{caption}"')
    }
    if (nzchar(img_extra)) {
      img_extra <- paste0(" ", trimws(img_extra))
    }
    glue::glue('![{alt}]({url}){{.lightbox{description}{img_extra}}}')
  } else {
    if (alt == "") alt <- "static image of the plot"
    if (nzchar(caption)) caption <- glue::glue(' data-description="{caption}"')
    glue::glue('<a href="{url}" class="lightbox"{caption}>{alt}</a>')
  }
}
