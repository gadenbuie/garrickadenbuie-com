if (file.exists('~/.Rprofile')) {
  sys.source('~/.Rprofile', envir = environment())
}

options(
  blogdown.generator.server = TRUE,
  blogdown.author = "Garrick Aden-Buie",
  blogdown.subdir = strftime(Sys.time(), "blog/%Y"),
  blogdown.ext = ".Rmd",
  blogdown.hugo.server = c('-D', '-F', '--navigateToChanged')
)
