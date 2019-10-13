---
title: 'Shiny Tip: Choose Where to Run App with an Option'
author: Garrick Aden-Buie
date: '2019-10-13'
slug: shiny-tip-option-where-to-run
categories:
  - Blog
tags:
  - R
  - Shiny
  - Tips
  - Tricks
description: |
  Quick Shiny Tip: How to use the `shiny.launch.browser` option to choose where RStudio runs your app.
keywords: [rstats, shiny, tip, trick, option, "shiny.launch.browser"]
editor_options:
  chunk_output_type: console
---

<!-- Links -->
[shiny]: https://shiny.rstudio.com
[rstudio]: https://rstudio.com
[golem]: https://thinkr-open.github.io/golem/
[so-answer]: https://stackoverflow.com/a/36238021
[shiny-run-app]: https://shiny.rstudio.com/reference/shiny/1.4.0/runApp.html

When you're running a [Shiny] app from a source file, 
like `app.R` in [RStudio], 
you can choose to run the app in the _Viewer Pane_, 
a new _Window_, 
or in an _External_ browser window.

<div class="center"><img 
  src="shiny-rstudio-run-in.png" 
  alt="RStudio 'Run App' drop down menu available for Shiny apps, for example in source files named 'app.R'"
/></div>

This works well for typical Shiny apps in `app.R` or `{global,ui,server}.R`,
but if you're building a Shiny app inside an R package ---
and if you are, then definitely check out ThinkR's [[golem]]{.pkg} package ---
then that little **Run App** button won't be available to choose where to run your Shiny apps.

The Shiny 
[runApp() help documentation][shiny-run-app] 
mentions the global option `shiny.launch.browser` but 
[this helpful StackOverflow answer][so-answer] 
provided a helpful hint as to how to actually pick the Viewer, Window or External location for newly launched Shiny apps.

The following options only work in RStudio,
and definitely in RStudio 1.2 (I'm running `1.2.1511`).
If you want to set these options globally in your `~/.Rprofile`,
then I'd recommend adding a conditional guard to check that RStudio is running first.

```r
if (
  # Make sure that {rstudioapi} is available
  requiresNamespace("rstudioapi", quietly = TRUE) &&
  # Returns TRUE if RStudio is running
  rstudioapi::hasFun("viewer")
) {
  options(shiny.launch.browser = your_choice_here)
}
```

## RStudio `shiny.launch.browser` Options

### Run in Viewer

```
options(shiny.launch.browser = .rs.invokeShinyPaneViewer)
```

### Run in Window

```
options(shiny.launch.browser = .rs.invokeShinyWindowViewer)
```

### Run in External Browser

```
options(shiny.launch.browser = .rs.invokeShinyWindowExternal)
```