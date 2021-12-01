---
title: "Reproducible Data Workflows With Drake"
author: Garrick Aden-Buie
description: |
  A gentle introduction to reproducible data workflows with the {drake} package.
images: [ "https://pkg.garrickadenbuie.com/drake-intro/assets/images/drake-intro-cover.jpg" ]
date: '2019-07-19'
slug: drake-intro-biodataclub

tags:
  - R
  - drake
  - Reproducible Research
  - Workflow
  - Tutorials
  - Education

talk_author: [Garrick Aden-Buie]
categories: [ Education ]
talk_image: "https://pkg.garrickadenbuie.com/drake-intro/assets/images/drake-intro-cover.jpg"
event: "Bio-Data Club at Moffitt Cancer Center"
event_url: https://www.biodataclub.org/
location: "Tampa, FL"
talk_code_url: https://github.com/gadenbuie/drake-intro/
links:
  - icon: chalkboard-teacher
    icon_pack: fas
    name: Slides
    url: https://gadenbuie.github.io/drake-intro/
---

**drake** is an R package that provides a powerful, flexible workflow management tool for reproducible data analysis pipelines. **drake** alleviates the pain of managing large (and even small) data analyses, speeding up iteration and development while providing reproducibility guarantees that are essential for modern research.

<https://ropensci.github.io/drake/>

In this session, we'll learn how to use **drake** to manage a data analysis workflow by writing functions that define the steps of the analysis. We'll then learn how **drake** can keep track of all of these steps, from start to finish, and intelligently update only the outdated steps when your data or code change.

### Meeting prerequisites

We'll work through a few examples together, so please bring a laptop with the **drake** and **visNetwork** packages installed.  (If you don't have a laptop you can share with someone who does at the session.) You would also benefit from installing the **tidyverse** package for the session. See the [full requirements here](https://pkg.garrickadenbuie.com/drake-intro/requirements/).

```r
required_packages <- c(
  # "tidyverse",  #<< For data processing, etc. (you probably have this)
  "here",         #<< For sane path management
  "cowplot",      #<< For composing ggplot2 plots
  "visNetwork",   #<< For visualizing drake plans
  "drake"         #<< Because drake
)

install.packages(required_packages)
```

Note: if you've used **drake** before, please ensure that you have version `7.0.0` or later installed.

### Meeting materials

The slides from this talk are available online at <https://pkg.garrickadenbuie.com/drake-intro/> and the drake source code and RStudio project are in available on GitHub at <https://github.com/gadenbuie/drake-intro>. There is also an [RStudio Cloud project](https://rstudio.cloud/project/405721) containing the drake project with all of the required dependencies pre-installed that you can use to explore and run the code from the talk.
