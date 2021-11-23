---
title: ":books: MC Test Analysis"
description: "Apps and reports for multiple-choice test analysis in R with Shiny"
twitterImage: /project/2017-07-06-mc-test-analysis_files/explore-03-irt.png
date: "2017-07-06"
slug: "mc-test-analysis"
tags: ["R", "R Package"]
categories: 
  - Project
type: page
---

**Project Links:** [source][mctestanalysis], [documentation](https://gadenbuie.github.io/mctestanalysis/), [demo](https://apps.garrickadenbuie.com/mctestanalysis/)

**Jump to:** [Try Online](#try-online) | [Installation](#installation) | [Usage](#usage) ([app](#explore) | [report](#report)) | [Data Format](#data-format) | [Built With](#built-with)

Many educators design multiple-choice question examination. How do we know that these tests are valid and reliable? How can we improve upon the test by way of modifying, revising and deleting items based on student responses?

In a paper in the highly regarded Journal of Engineering Education, Jorion, et al (2016) developed "an analytical framework for evaluating the validity of concept inventory claims". We believe that we can use this framework to help educators design their multiple-choice tests as well, especially, if they are designed as the final mastery examination in a course. An open source software to analyze a multiple-choice question examination would be encouraging to educators who have minimal programming experience and promising to contributors who would enhance the program.

This [R] package provides useful interfaces and functions to assist with the analysis of data from a typical multiple-choice test.
The user needs only to provide an answer key that optionally identifies the concept or topic of each question and a table of responses given by each student to the questions in the test.
MCTestAnalysis provides a [Shiny] web app interface and an automatic report-generation tool featuring concepts from Classical Test Theory (CTT), Item Response Theory (IRT) and structural analysis. 
We regard this package to be a work-in-progress and encourage contributions.
At this time CTT results include item difficulty, item discrimination, Cronbach's alpha, and alpha-with-item-deleted.
Item response functions include model estimation and item characteristic curves.
Tetrachoric and scree plots are included with an introductory exploratory factor analysis.

## Try Online

You can try out the Shiny web interface online at <https://apps.garrickadenbuie.com/mctestanalysis/>, which demonstrates the test results explorer interface but cannot produce the PDF or HTML reports.
For the complete features, you can install the package and use the interface locally (without have to upload your data) by following the instructions below.

## Installation

For more detailed installation requirements and usage instructions, see [Get Started](https://gadenbuie.github.io/mctestanalysis/articles/MCTestAnalysis.html).

In general, the package can be installed using [devtools] via

```r
install.packages("devtools")
devtools::install_github("gadenbuie/mctestanalysis")
```

## Usage

Open [RStudio] or [R] on the command line or GUI and run the following commands:

```r
library(MCTestAnalysis)

# Launch test exploration interface
explore()

# Create a test analysis report
report()
```

When running `explore()` a browser window will open with the MC Test Analysis exploration application.
The `report()` function will launch a window within RStudio to guide the user through the creation of a PDF report.

### Explore: Shiny App for Interactive Multiple-Choice Test Analysis {#explore}

The `explore()` function starts a local Shiny app.
From this app, the user uploads their answer key and test data and then can view and explore the results of common test analysis methods.

Click on the image thumbnails below to view examples of the various screens of the MCTestAnalysis `explore()` app.

<div>
<a href="/project/2017-07-06-mc-test-analysis_files/explore-01-import.png" data-featherlight="image">
  <div class="figure thumbnail">
  <img src="/project/2017-07-06-mc-test-analysis_files/explore-01-import.png" alt="Load Data" width="200px">
  <p class="caption">Load Data</p>
  </div>
</a>
<a href="/project/2017-07-06-mc-test-analysis_files/explore-02-ctt.png" data-featherlight="image">
  <div class="figure thumbnail">
  <img src="/project/2017-07-06-mc-test-analysis_files/explore-02-ctt.png" alt="Classic Test Theory" width="200px">
  <p class="caption">Classic Test Theory</p>
  </div>
</a>
<a href="/project/2017-07-06-mc-test-analysis_files/explore-03-irt.png" data-featherlight="image">
  <div class="figure thumbnail">
  <img src="/project/2017-07-06-mc-test-analysis_files/explore-03-irt.png" alt="Item Response Theory" width="200px">
  <p class="caption">Item Response Theory</p>
  </div>
</a>
<a href="/project/2017-07-06-mc-test-analysis_files/explore-04-factor_analysis.png" data-featherlight="image">
  <div class="figure thumbnail">
  <img src="/project/2017-07-06-mc-test-analysis_files/explore-04-factor_analysis.png" alt="Factor Analysis" width="200px">
  <p class="caption">Factor Analysis</p>
  </div>
</a>
<a href="/project/2017-07-06-mc-test-analysis_files/explore-05-distractor.png" data-featherlight="image">
  <div class="figure thumbnail">
  <img src="/project/2017-07-06-mc-test-analysis_files/explore-05-distractor.png" alt="Distractor Analysis" width="200px">
  <p class="caption">Distractor Analysis</p>
  </div>
</a>
<a href="/project/2017-07-06-mc-test-analysis_files/explore-06-report.png" data-featherlight="image">
  <div class="figure thumbnail">
  <img src="/project/2017-07-06-mc-test-analysis_files/explore-06-report.png" alt="Export Report" width="200px"/>
  <p class="caption">Export Report</p>
  </div>
</a>
</div>
<div style="clear:both">

### Report: A Custom Multiple-Choice Test Analysis Report {#report}

The `report()` function opens a window in RStudio that allows the user to import their answer key and test results and quickly generate a custom multiple-choice test analysis as a PDF or HTML file.
This report includes all of the information in the `explore()` app, in addition to helpful background information on the various statistics and visualizations in the report.

[Click here to view an example report](/project/2017-07-06-mc-test-analysis_files/MCTestAnalysis_Example-Report.pdf) (from synthetic data) or click the thumbnails below to view the `report()` app screens.

<div>
<a href="/project/2017-07-06-mc-test-analysis_files/report-01-settings.png" data-featherlight="image">
<div class="figure thumbnail">
<img src="/project/2017-07-06-mc-test-analysis_files/report-01-settings.png" alt="Import Settings" width="200px"/>
<p class="caption">Import Settings</p>
</div>
</a>
<a href="/project/2017-07-06-mc-test-analysis_files/report-02-load.png" data-featherlight="image">
<div class="figure thumbnail">
<img src="/project/2017-07-06-mc-test-analysis_files/report-02-load.png" alt="Load Data" width="200px"/>
<p class="caption">Load Data</p>
</div>
</a>
<a href="/project/2017-07-06-mc-test-analysis_files/report-03-generate.png" data-featherlight="image">
<div class="figure thumbnail">
<img src="/project/2017-07-06-mc-test-analysis_files/report-03-generate.png" alt="Generate Report" width="200px"/>
<p class="caption">Generate Report</p>
</div>
</a>
</div>
<div style="clear:both">

## Data format

The MCTestAnalysis package requires both an **Answer Key** and a table of student responses, in other words the **Test Data**. 
An example of each table is provided, in the preferred format, in the  [`inst/extdata` folder](https://github.com/gadenbuie/mctestanalysis/tree/master/inst/extdata) of the [repo][mctestanalysis], or from links on the "Import" tab of the `explore()` or `report()` interfaces.

A detailed overview of the required data format is available at <http://www.eng.usf.edu/~kaw/MCTestAnalysis/MCTestAnalysis_input.pdf>.
Additional example [test results](http://www.eng.usf.edu/~kaw/MCTestAnalysis/sample_answer_key.csv) and [answer key](http://www.eng.usf.edu/~kaw/MCTestAnalysis/sample_student_answers.csv) CSV files are also available.

### Answer Key Format

The answer key is a `.csv` file with columns **Question** and **Answer**, with optional columns **Title** and **Concept**.
The table below shows an example answer key with 5 questions.

|Question | Answer|Title      |Concept |
|:--------|------:|:----------|:-------|
|Q1       |      3|Question 1 |A       |
|Q2       |      1|Question 2 |B       |
|Q3       |      3|Question 3 |C       |
|Q4       |      4|Question 4 |D       |
|Q5       |      4|Question 5 |A       |

### Test Data Format

The test data is also a `.csv` file, where the first column is optionally the student ID and each column afterwards records the student's answer to the test questions.
The columns after the student ID need to be in the same order as the answer key.
Here are the test responses for the first 5 students to the above example answer key.

|id        | Q1| Q2| Q3| Q4| Q5|
|:---------|--:|--:|--:|--:|--:|
|Student 1 |  3|  2|  3|  4|  1|
|Student 2 |  3|  2|  3|  4|  1|
|Student 3 |  3|  1|  3|  2|  4|
|Student 4 |  4|  2|  4|  4|  4|
|Student 5 |  3|  1|  3|  3|  4|

## Built on These Great Packages {#built-with}

MCTestAnalysis was built by [Garrick Aden-Buie](https://garrickadenbuie.com) and lead by [Dr. Autar Kaw](http://autarkaw.com/).
The package was built to be used with [R] and [RStudio], using [Shiny] for the interactive apps, [R Markdown](https://rmarkdown.rstudio.com/) for the custom reports, and [ggplot2](http://ggplot2.tidyverse.org) for plots.
Many test analysis functions used in this package were made available by other packages and R developers, including the following packages:
<a href="http://personality-project.org/r/psych">psych</a>,
<a href="https://CRAN.R-project.org/package=psychometric">psychometric</a>,
<a href="https://github.com/drizopoulos/ltm">ltm</a>,
<a href="http://shiny.rstudio.com">shiny</a>,
<a href="http://dplyr.tidyverse.org">dplyr</a>,
<a href="http://ggplot2.tidyverse.org">ggplot2</a>,
<a href="https://github.com/hadley/reshape">reshape2</a>,
<a href="https://rmarkdown.rstudio.com">rmarkdown</a>,
<a href="https://rstudio.github.io/DT">DT</a>,
<a href="http://tibble.tidyverse.org/">tibble</a>,
<a href="https://CRAN.R-project.org/package=gridExtra">gridExtra</a>,
<a href="https://CRAN.R-project.org/package=miniUI">miniUI</a>.

[R]: https://cran.r-project.org/
[Shiny]: http://shiny.rstudio.com/
[Rstudio]: https://www.rstudio.com/products/RStudio/
[Rtools]: https://cran.r-project.org/bin/windows/Rtools/
[devtools]: http://github.com/hadley/devtools/
[mctestanalysis]: https://github.com/gadenbuie/mctestanalysis
