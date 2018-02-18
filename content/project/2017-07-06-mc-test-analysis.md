---
title: ":books: MC Test Analysis"
description: "Apps and reports for multiple-choice test analysis in R with Shiny"
date: "2017-07-06"
slug: "mc-test-analysis"
tags: ["R", "R-Packages"]
type: page
---

**Project Links:** [source][mctestanalysis], [documentation](https://gadenbuie.github.io/mctestanalysis/), [demo](https://gadenbuie.shinyapps.io/mctestanalysis/)

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

You can try out the Shiny web interface online at <https://gadenbuie.shinyapps.io/mctestanalysis/>, which demonstrates the test results explorer interface but cannot produce the PDF or HTML reports.
For the complete features, you can install the package and use the interface locally (without have to upload your data) by following the instructions below.

## Installation

For more detailed installation requirements and usage instructions, see [Get Started](articles/MCTestAnalysis.html).

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

## Data format

This package requires both an Answer Key and a table of student responses. 
An example of each table is provided, in the preferred format, in the  [`inst/extdata` folder](https://github.com/gadenbuie/mctestanalysis/tree/master/inst/extdata) of the [repo][mctestanalysis], or from links on the "Import" tab of the `explore()` or `report()` interfaces.

A detailed overview of the required data format is available at <http://www.eng.usf.edu/~kaw/MCTestAnalysis/MCTestAnalysis_input.pdf>.
Additional example [test results](http://www.eng.usf.edu/~kaw/MCTestAnalysis/sample_answer_key.csv) and [answer key](http://www.eng.usf.edu/~kaw/MCTestAnalysis/sample_student_answers.csv) CSV files are also available.

[R]: https://cran.r-project.org/
[Shiny]: http://shiny.rstudio.com/
[Rstudio]: https://www.rstudio.com/products/RStudio/
[Rtools]: https://cran.r-project.org/bin/windows/Rtools/
[devtools]: http://github.com/hadley/devtools/
[mctestanalysis]: https://github.com/gadenbuie/mctestanalysis