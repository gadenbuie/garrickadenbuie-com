---
date: {{ .Date }}
description: "post description"
twitterImage: "/path/to/image.png"
rmd_source: ""
keywords: "rstats"
editor_options: 
  chunk_output_type: console
---

<!-- Links -->

```{r setup, include=FALSE}
knitr::opts_chunk$set(
  echo = FALSE, warning = FALSE, message = FALSE,
  fig.width = 9, fig.height = 10
)
options(htmltools.dir.version = TRUE)

# If using lightbox for plots, set `fig.show = FALSE`
# Usage: lightbox_img(knitr::fig_chunk("chunk-name", "png"))
lightbox_img <- function(url, alt = "", caption = "", preview = TRUE) {
  if (preview) {
    glue::glue(
      '<a href="{url}" data-featherlight="image">
      <div class="figure">
      <img src="{url}" alt="{alt}">
      <p class="caption">{caption}</p>
      </div>
      </a>
      '
    )
  } else {
    if (alt == "") alt <- "static image of the plot"
    glue::glue('<a href="{url}" data-featherlight="image">{alt}</a>')
  }
}
```