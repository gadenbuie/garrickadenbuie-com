if (file.exists('~/.Rprofile')) {
  sys.source('~/.Rprofile', envir = environment())
}
options(
  blogdown.hugo.version = "0.89.1",
  blogdown.generator.server = TRUE,
  # blogdown.method = 'markdown',
  blogdown.author = "Garrick Aden-Buie",
  blogdown.subdir = strftime(Sys.time(), "blog/%Y"),
  blogdown.ext = ".Rmd",
  blogdown.hugo.server = c('-D', '-F', '--navigateToChanged')
)
