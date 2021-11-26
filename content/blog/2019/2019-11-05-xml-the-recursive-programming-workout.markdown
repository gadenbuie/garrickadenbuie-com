---
title: "XML: The Recursive Programming Workout"
slug: recursive-xml-workout
date: "2019-11-05"
description: "It's like programming Crossfit but with less sweating."
rmd_source: "ihttps://github.com/gadenbuie/garrickadenbuie-com/blob/main/content/blog/2019/2019-11-05-xml-the-recursive-programming-workout.Rmd"
categories:
  - Blog
tags:
  - R
  - Tips
  - XML
  - xml2
  - purrr
  - recursive programming
keywords:
  - rstats
  - R
  - XML
  - xml2
  - purrr
  - recursive programming
editor_options:
  chunk_output_type: console
---

<script src="/rmarkdown-libs/htmlwidgets-1.5.4/htmlwidgets.js"></script>
<script src="/rmarkdown-libs/pymjs-1.3.2/pym.v1.js"></script>
<script src="/rmarkdown-libs/widgetframe-binding-0.3.1/widgetframe.js"></script>
<!-- Links -->

I had no choice today but to work with raw XML data
and let me just say: it’s been a workout.

<center>
{{% tweet "1191792162909949952" %}}
</center>

## An example XML file

The XML file I’m working with primarily stores the data I need in node-level attributes,
similar to the data below that I modified from an example on
[oracle-base](https://oracle-base.com/articles/misc/xmltable-convert-xml-data-into-rows-and-columns-using-sql#attribute-based-xml).

``` r
xml_text <- '
<company>
  <employees company="MacroSoft" division="Sales">
    <employee empno="7369" ename="SMITH" job="CLERK" hiredate="17-DEC-1980"/>
    <employee empno="7499" ename="ALLEN" job="SALESMAN" hiredate="20-FEB-1981"/>
    <employee empno="7521" ename="WARD" job="SALESMAN" hiredate="22-FEB-1981"/>
    <employee empno="7566" ename="JONES" job="MANAGER" hiredate="02-APR-1981"/>
    <employee empno="7654" ename="MARTIN" job="SALESMAN" hiredate="28-SEP-1981"/>
  </employees>
  <employees company="MacroSoft" division="Research">
    <employee empno="7698" ename="BLAKE" job="MANAGER" hiredate="01-MAY-1981"/>
    <employee empno="7782" ename="CLARK" job="MANAGER" hiredate="09-JUN-1981"/>
    <employee empno="7788" ename="SCOTT" job="ANALYST" hiredate="19-APR-1987"/>
    <employee empno="7839" ename="KING" job="PRESIDENT" hiredate="17-NOV-1981"/>
    <employee empno="7844" ename="TURNER" job="SALESMAN" hiredate="08-SEP-1981"/>
    <employee empno="7876" ename="ADAMS" job="CLERK" hiredate="23-MAY-1987"/>
    <employee empno="7900" ename="JAMES" job="CLERK" hiredate="03-DEC-1981"/>
    <employee empno="7902" ename="FORD" job="ANALYST" hiredate="03-DEC-1981"/>
    <employee empno="7934" ename="MILLER" job="CLERK" hiredate="23-JAN-1982"/>
  </employees>
</company>
'
```

## From XML to a `list()`

With the <span class="pkg">[xml2](https://xml2.r-lib.org)</span> package and two tiny lines of R code
we have the XML file as a list in R.

``` r
raw_xml <- xml2::read_xml(xml_text)
list_xml <- xml2::as_list(raw_xml)

str(list_xml, max.level = 2)
```

    ## List of 1
    ##  $ company:List of 2
    ##   ..$ employees:List of 5
    ##   .. ..- attr(*, "company")= chr "MacroSoft"
    ##   .. ..- attr(*, "division")= chr "Sales"
    ##   ..$ employees:List of 9
    ##   .. ..- attr(*, "company")= chr "MacroSoft"
    ##   .. ..- attr(*, "division")= chr "Research"

But as you can see from the preview above,
when converted to a list,
<span class="pkg">xml2</span> stores attributes at each node,
like `company="MacroSoft"`,
as R `attributes()` associated with the corresponding list item.

``` r
str(list_xml[[1]][[1]][1])
```

    ## List of 1
    ##  $ employee: list()
    ##   ..- attr(*, "empno")= chr "7369"
    ##   ..- attr(*, "ename")= chr "SMITH"
    ##   ..- attr(*, "job")= chr "CLERK"
    ##   ..- attr(*, "hiredate")= chr "17-DEC-1980"

## Promote attributes to list items

I want to extract these attributes and promote them to list-level named entries.
To do this I’ll use a recursive function,
meaning a function that calls itself.
When approaching writing a recursive function,
it’s useful to think of the *base case* —
when we have or can get the answer that we’re looking for —
and the recursion case —
or when we need to move further down the tree by calling
the function again on a smaller unit.

### Base case

The base case of the recursive function
is when we have an empty list that has attributes.
In that case, we just return the attributes.
A good example of the base case from our example XML
is the `list_xml[[1]][[1]][[1]]` we see above.

``` r
attributes(list_xml[[1]][[1]][[1]])
```

    ## $empno
    ## [1] "7369"
    ## 
    ## $ename
    ## [1] "SMITH"
    ## 
    ## $job
    ## [1] "CLERK"
    ## 
    ## $hiredate
    ## [1] "17-DEC-1980"

### Recursive case

If,
on the other hand,
we find that we have a list that contains both items *and* attributes
we do three things.
First,
we keep a copy of the attributes of the list at the current level that we’ll use later.
Second,
we look inside each of the items
in the list we currently have to see if we can promote their attributes.
This triggers the recursion,
so this function will keep calling itself on smaller
and smaller units until eventually it reaches a list with no items and only attributes.
At that point, it returns the attributes as a list.

The third and final step is to take the attribute list at the original level and
concatenate the list returned from the lower level.

When thinking about programming the recusive case,
I usually try to think about one step above the base case.
That is, what would I do if I’m one level above the base case.
For this, we can use `list_xml[[1]][[1]]`,
and, in essence,
we want to perform this action:

``` r
this_attr <- attributes(list_xml[[1]][[1]])
lower_level <- purrr::map(list_xml[[1]][[1]], attributes)
str(lower_level)
```

    ## List of 5
    ##  $ employee:List of 4
    ##   ..$ empno   : chr "7369"
    ##   ..$ ename   : chr "SMITH"
    ##   ..$ job     : chr "CLERK"
    ##   ..$ hiredate: chr "17-DEC-1980"
    ##  $ employee:List of 4
    ##   ..$ empno   : chr "7499"
    ##   ..$ ename   : chr "ALLEN"
    ##   ..$ job     : chr "SALESMAN"
    ##   ..$ hiredate: chr "20-FEB-1981"
    ##  $ employee:List of 4
    ##   ..$ empno   : chr "7521"
    ##   ..$ ename   : chr "WARD"
    ##   ..$ job     : chr "SALESMAN"
    ##   ..$ hiredate: chr "22-FEB-1981"
    ##  $ employee:List of 4
    ##   ..$ empno   : chr "7566"
    ##   ..$ ename   : chr "JONES"
    ##   ..$ job     : chr "MANAGER"
    ##   ..$ hiredate: chr "02-APR-1981"
    ##  $ employee:List of 4
    ##   ..$ empno   : chr "7654"
    ##   ..$ ename   : chr "MARTIN"
    ##   ..$ job     : chr "SALESMAN"
    ##   ..$ hiredate: chr "28-SEP-1981"

``` r
str(c(this_attr, lower_level), max.level = 1)
```

    ## List of 8
    ##  $ names   : chr [1:5] "employee" "employee" "employee" "employee" ...
    ##  $ company : chr "MacroSoft"
    ##  $ division: chr "Sales"
    ##  $ employee:List of 4
    ##  $ employee:List of 4
    ##  $ employee:List of 4
    ##  $ employee:List of 4
    ##  $ employee:List of 4

## A recursive attribute-promotor function

The final step is to put this all together inside a function
that handles the base case or recurses to iterate over list items further down the tree.

But first…
did you notice this line above?

    ## List of 1
    ##  $ names: chr [1:5] "employee" "employee" "employee" "employee" ...

We have also included the names of the sub-list items in our new list!
This is because R uses named attributes
to keep track of things like `"names"`, `"class"`, `"dimnames"` etc.
If the XML node has an attribute called `names="foo"`,
<span class="pkg">xml2</span> will store that attribute-value pair as `.names`.
I don’t mind having `.names` entries in my lists
(I can take care of that downstream),
but I don’t want to keep attributes named`names` or `class` etc.,
because those are reserved for special R functionality.

Here’s a small function that removes reserved R attributes
from the attributes list.

``` r
remove_reserved <- function(this_attr) {
  reserved_attr <- c("class", "comment", "dim", "dimnames", "names", "row.names", "tsp")
  if (!any(reserved_attr %in% names(this_attr))) {
    return(this_attr)
  }
  for (reserved in reserved_attr) {
    if (!is.null(this_attr[[reserved]])) this_attr[[reserved]] <- NULL
  }
  this_attr
}
```

Finally, we can combine everything in a recursive function
I’ll call `promote_attr()`.

``` r
promote_attr <- function(ll) {
  this_attr <- attributes(ll)
  this_attr <- remove_reserved(this_attr)
  if (length(ll)) {
    # recursive case
    c(this_attr, purrr::map(ll, promote_attr))
  } else {
    # base case (no sub-items)
    this_attr
  }
}
```

Quick aside:
this function makes very strong assumptions
that every item in the list we’re recursing over
is also a list, all the way down.
In this example processing a list derived from an XML document,
it’s a reasonable assumption,
but one that we should check.
For other lists of mixed types,
a whole lot more type checking will be required.

## The end result (for now)

In the end,
by mapping `promote_attr()` over `list_xml`,
we get a nice, tidy-ish list.
This setup might not work for your XML data,
but recursive programming can be a huge help when working with lists and tree structures.

``` r
tidy_xml <- purrr::map(list_xml, promote_attr)
listviewer::jsonedit(tidy_xml)
```

<div id="htmlwidget-1" style="width:100%;height:425px;" class="widgetframe html-widget"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"url":"/blog/2019/2019-11-05-xml-the-recursive-programming-workout_files/figure-html//widgets/widget_tidy-xml-listviewer.html","options":{"xdomain":"*","allowfullscreen":false,"lazyload":false}},"evals":[],"jsHooks":[]}</script>

## Further Reading

If you’d like to read more about <span class="pkg">purrr</span>
or about rectangling tangled tree-like lists,
I highly recommend Jenny Bryan’s excellent
[repurrrsive tutorial and package](https://github.com/jennybc/repurrrsive).
With many great practice data sets, challenges, and tips,
it’s an excellent and highly recommended read!
