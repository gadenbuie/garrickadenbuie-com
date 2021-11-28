---
title: ":chipmunk: Sqrrl"
slug: "sqrrl"
description: "Easily build bespoke SQL queries programmatically in R"
date: 2017-07-01T00:00:00+00:00
categories:
  - Project
tags: ["R", "R Package", "SQL", "MySQL", "Shiny"]
page: project
show_post_thumbnail: false
---




**UPDATE 10/17/2017**: **Don't use this!** I made it for myself so it works for what I needed it for.
But you probably shouldn't use this package.
There are better ways of building SQL queries that are safer and better (and probably even easier).
For now, let me just point you in the direction of [db.rstudio.com](http://db.rstudio.com/), [dplyr/dbplyr](http://db.rstudio.com/dplyr#generating-queries), and the recently added [`glue_sql()` function](http://glue.tidyverse.org/reference/glue_sql.html) in the [glue package](http://glue.tidyverse.org).

**Project Links:** [source][sqrrl-src], [documentation][sqrrl-docs]

`sqrrl` is a small collection of utility functions that help build text-based SQL queries in an R-style native-feeling and functional manner.

Unlike other packages that build SQL queries using an object-oriented style, `sqrrl` provides small functions that produce SQL snippets and can be linked together to compose SQL queries.
The result is that the code to produce the SQL statement reads much like the SQL statement iteself.
On the other hand, `sqrrl` doesn't know anything about your database and can't help you out with completions, etc.

Where this package is most useful is with [Shiny web apps][shiny] that interact with a MySQL backend.
The utilities are all built so that queries can be built using column names and values stored inside ordinary R data structures.

The following is a quick demonstration of how the package works using the `nyclights13` dataset.
For more information on `sqrrl`, check out the [package documentation][sqrrl-docs].

## Setup `flights` database

To demonstrate the features in `sqrrl`, let's set up an in-memory SQLite database using the `nycflights13` dataset featured in `dplyr` and `dbplyr`.

First, load (or install) the pacakges and functions that we need.


```r
# ---- Workspace Setup ----
library('nycflights13') # install.packages('nycflights13')
library('DBI')          # install.packages('DBI')
library('dplyr')        # install.packages('dplyr')
library('dbplyr')       # install.packages('dbplyr')

# Load the sqrrl package
# devtools::isntall_github('gadenbuie/sqrrl')
library('sqrrl')

# Alias to create nice tables
as_table <- function(...) knitr::kable(..., format = 'html')
```

Then load the `flights` data frame from  `nycflights13` into the in-memory SQLite database (this code comes direclty from the [dbplyr documentation](http://dbplyr.tidyverse.org/articles/dbplyr.html#connecting-to-the-database)).


```r
# ---- Example Setup ----
# Create an in-memory SQLite database
con <- dbConnect(RSQLite::SQLite(), path = ":memory:")

# Use dplyr/dbplyr to copy flights table to the temp db
copy_to(con, nycflights13::flights, "flights",
  temporary = FALSE,
  indexes = list(
    c("year", "month", "day"),
    "carrier",
    "tailnum",
    "dest"
  )
)

# Show first 5 rows
dbGetQuery(con, 'SELECT * FROM flights LIMIT 5') %>%
  as_table
```

<table>
 <thead>
  <tr>
   <th style="text-align:right;"> year </th>
   <th style="text-align:right;"> month </th>
   <th style="text-align:right;"> day </th>
   <th style="text-align:right;"> dep_time </th>
   <th style="text-align:right;"> sched_dep_time </th>
   <th style="text-align:right;"> dep_delay </th>
   <th style="text-align:right;"> arr_time </th>
   <th style="text-align:right;"> sched_arr_time </th>
   <th style="text-align:right;"> arr_delay </th>
   <th style="text-align:left;"> carrier </th>
   <th style="text-align:right;"> flight </th>
   <th style="text-align:left;"> tailnum </th>
   <th style="text-align:left;"> origin </th>
   <th style="text-align:left;"> dest </th>
   <th style="text-align:right;"> air_time </th>
   <th style="text-align:right;"> distance </th>
   <th style="text-align:right;"> hour </th>
   <th style="text-align:right;"> minute </th>
   <th style="text-align:right;"> time_hour </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 517 </td>
   <td style="text-align:right;"> 515 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 830 </td>
   <td style="text-align:right;"> 819 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> UA </td>
   <td style="text-align:right;"> 1545 </td>
   <td style="text-align:left;"> N14228 </td>
   <td style="text-align:left;"> EWR </td>
   <td style="text-align:left;"> IAH </td>
   <td style="text-align:right;"> 227 </td>
   <td style="text-align:right;"> 1400 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 15 </td>
   <td style="text-align:right;"> 1357034400 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 533 </td>
   <td style="text-align:right;"> 529 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 850 </td>
   <td style="text-align:right;"> 830 </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:left;"> UA </td>
   <td style="text-align:right;"> 1714 </td>
   <td style="text-align:left;"> N24211 </td>
   <td style="text-align:left;"> LGA </td>
   <td style="text-align:left;"> IAH </td>
   <td style="text-align:right;"> 227 </td>
   <td style="text-align:right;"> 1416 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 29 </td>
   <td style="text-align:right;"> 1357034400 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 542 </td>
   <td style="text-align:right;"> 540 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 923 </td>
   <td style="text-align:right;"> 850 </td>
   <td style="text-align:right;"> 33 </td>
   <td style="text-align:left;"> AA </td>
   <td style="text-align:right;"> 1141 </td>
   <td style="text-align:left;"> N619AA </td>
   <td style="text-align:left;"> JFK </td>
   <td style="text-align:left;"> MIA </td>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 1089 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 40 </td>
   <td style="text-align:right;"> 1357034400 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 544 </td>
   <td style="text-align:right;"> 545 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> 1004 </td>
   <td style="text-align:right;"> 1022 </td>
   <td style="text-align:right;"> -18 </td>
   <td style="text-align:left;"> B6 </td>
   <td style="text-align:right;"> 725 </td>
   <td style="text-align:left;"> N804JB </td>
   <td style="text-align:left;"> JFK </td>
   <td style="text-align:left;"> BQN </td>
   <td style="text-align:right;"> 183 </td>
   <td style="text-align:right;"> 1576 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:right;"> 1357034400 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 554 </td>
   <td style="text-align:right;"> 600 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> 812 </td>
   <td style="text-align:right;"> 837 </td>
   <td style="text-align:right;"> -25 </td>
   <td style="text-align:left;"> DL </td>
   <td style="text-align:right;"> 461 </td>
   <td style="text-align:left;"> N668DN </td>
   <td style="text-align:left;"> LGA </td>
   <td style="text-align:left;"> ATL </td>
   <td style="text-align:right;"> 116 </td>
   <td style="text-align:right;"> 762 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 1357038000 </td>
  </tr>
</tbody>
</table>

## Querying `flights`

Often, when I'm working with a database, I'll create an alias for `dbGetQuery` with the database or table name.
Inside the alias function I usually add any data type modifications that might need to be applied, and I suppress the warning messages that `DBI` outputs about data type conversions.


```r
flights <- function(query, ...) {
  suppressWarnings(dbGetQuery(con, query, ...))
}
```

Now we can repeat the above `SELECT` statement using `sqrrl`, this time limiting the columns selected.


```r
flight_cols <- c('year', 'month', 'day',
                 'carrier', 'flight', 'tailnum')
SELECT(flight_cols) %+%
  FROM('flights') %+%
  LIMIT(5) %>%
  flights %>%
  as_table
```

<table>
 <thead>
  <tr>
   <th style="text-align:right;"> year </th>
   <th style="text-align:right;"> month </th>
   <th style="text-align:right;"> day </th>
   <th style="text-align:left;"> carrier </th>
   <th style="text-align:right;"> flight </th>
   <th style="text-align:left;"> tailnum </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> UA </td>
   <td style="text-align:right;"> 1545 </td>
   <td style="text-align:left;"> N14228 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> UA </td>
   <td style="text-align:right;"> 1714 </td>
   <td style="text-align:left;"> N24211 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> AA </td>
   <td style="text-align:right;"> 1141 </td>
   <td style="text-align:left;"> N619AA </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> B6 </td>
   <td style="text-align:right;"> 725 </td>
   <td style="text-align:left;"> N804JB </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> DL </td>
   <td style="text-align:right;"> 461 </td>
   <td style="text-align:left;"> N668DN </td>
  </tr>
</tbody>
</table>

Note that `sqrrl` provides the `%+%` infix operator, which is essentially just an alias for `paste(x, y)`.


```r
'a' %+% 'b'
```

```
## [1] "a b"
```

```r
# or PHP style without a padded space: paste0
'a' %.% 'b'
```

```
## [1] "ab"
```

We can also do more complicated queries, like finding the average arrival delay, grouped by tail number:


```r
SELECT('tailnum', delay = 'avg(arr_delay)', n = 'count(*)') %+%
  FROM('flights') %+%
  GROUP_BY('tailnum') %+%
  ORDER_BY(DESC('delay')) %+%
  LIMIT(10) %>%
  flights %>%
  as_table
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> tailnum </th>
   <th style="text-align:right;"> delay </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> N844MH </td>
   <td style="text-align:right;"> 320.0000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N911DA </td>
   <td style="text-align:right;"> 294.0000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N922EV </td>
   <td style="text-align:right;"> 276.0000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N587NW </td>
   <td style="text-align:right;"> 264.0000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N851NW </td>
   <td style="text-align:right;"> 219.0000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N928DN </td>
   <td style="text-align:right;"> 201.0000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N7715E </td>
   <td style="text-align:right;"> 188.0000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N654UA </td>
   <td style="text-align:right;"> 185.0000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N665MQ </td>
   <td style="text-align:right;"> 174.6667 </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N427SW </td>
   <td style="text-align:right;"> 157.0000 </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table>

`sqrrl` also provides a wrapper around the python utility `sqlformat` that can be used to pretty-print SQL formats.


```r
SELECT('tailnum', delay = 'avg(arr_delay)', n = 'count(*)') %+%
  FROM('flights') %+%
  GROUP_BY('tailnum') %+%
  ORDER_BY(DESC('delay')) %+%
  LIMIT(10) %>%
  sqlformat %>% cat
```

Error in system("sqlformat -h", intern = TRUE) : error in running command

```
## Warning: Please install sqlformat via
## https://github.com/andialbrecht/sqlparse
```

```sql
SELECT tailnum, avg(arr_delay) as delay, count(*) as n FROM flights  GROUP BY tailnum ORDER BY delay DESC LIMIT 10
```

Let's use the above as an inner query and filter on `n > 100`:


```r
query_all_arr_delay <- SELECT(
  'tailnum', delay = 'avg(arr_delay)', n = 'count(*)'
) %+%
  FROM('flights') %+%
  GROUP_BY('tailnum') %+%
  ORDER_BY(DESC('delay'))

SELECT() %+%
  FROM(delay = parens(query_all_arr_delay)) %+%
  WHERE(gt(n = 100)) %+%
  LIMIT(10) %>%
  flights %>%
  as_table
```

<table>
 <thead>
  <tr>
   <th style="text-align:left;"> tailnum </th>
   <th style="text-align:right;"> delay </th>
   <th style="text-align:right;"> n </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> N11119 </td>
   <td style="text-align:right;"> 30.30657 </td>
   <td style="text-align:right;"> 148 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N16919 </td>
   <td style="text-align:right;"> 29.88745 </td>
   <td style="text-align:right;"> 251 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N14998 </td>
   <td style="text-align:right;"> 27.92202 </td>
   <td style="text-align:right;"> 230 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N15910 </td>
   <td style="text-align:right;"> 27.61132 </td>
   <td style="text-align:right;"> 280 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N13123 </td>
   <td style="text-align:right;"> 25.97345 </td>
   <td style="text-align:right;"> 121 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N11192 </td>
   <td style="text-align:right;"> 25.85235 </td>
   <td style="text-align:right;"> 154 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N14950 </td>
   <td style="text-align:right;"> 25.28780 </td>
   <td style="text-align:right;"> 219 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N21130 </td>
   <td style="text-align:right;"> 24.96610 </td>
   <td style="text-align:right;"> 126 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N24128 </td>
   <td style="text-align:right;"> 24.91803 </td>
   <td style="text-align:right;"> 129 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> N22971 </td>
   <td style="text-align:right;"> 24.74766 </td>
   <td style="text-align:right;"> 230 </td>
  </tr>
</tbody>
</table>

## Queries are just strings

Notice that unlike other packages, `sqrrl` can't build the nested queries for you.
You still need to understand the structure of the database and the structure of the query.

But when compared with the final output of the query, the `sqrrl` version looks a lot like SQL transliterated into R functions.


```r
SELECT() %+%
  FROM(delay = parens(
    SELECT('tailnum', delay = 'avg(arr_delay)', n = 'count(*)') %+%
      FROM('flights') %+%
      GROUP_BY('tailnum') %+%
      ORDER_BY(DESC('delay'))
  )) %+%
  WHERE(gt(n = 100)) %+%
  LIMIT(10) %>%
  sqlformat() %>%
  cat()
```

```sql
SELECT *
  FROM (
        SELECT tailnum,
               avg(arr_delay) AS delay,
               count(*) AS n
          FROM flights
         GROUP BY tailnum
         ORDER BY delay DESC
       ) delay
 WHERE n>100
 LIMIT 10
```

For me, at least, where the goal is to write SQL queries as bare strings, `sqrrl` lets me write in R and think in SQL without having to add a huge number of `paste` and `paste0` functions.

Everything in `sqrrl` takes input data from regular R data types and outputs an SQL snippet.

For an example of nearly everything each of the functions can do, see the [Getting Started][sqrrl-start] section in the documentation.

## A more complicated SELECT query

As a final example, here is a fully-loaded select query.


```r
SELECT('`year`', 'carrier', 'flight', 'dest',
       n = 'count(*)',
       avg_dist = 'avg(distance)',
       avg_air_time = 'avg(air_time)') %+%
  FROM(f = 'flights') %+%
  WHERE(
    BETWEEN('month', 6, 12),
    'carrier' %IN% c("UA", "AA", "US", "WN"),
    geq('dep_time' = 800),
    leq('air_time' = 120),
    'origin' %LIKE% 'JFK'
  ) %+%
  GROUP_BY('`year`', 'carrier', 'flight', 'dest') %+%
  ORDER_BY(DESC('n')) %+%
  LIMIT(10) %>%
  { sqlformat(.) %>% cat; . } %>%
  flights %>%
  as_table
```

Error in system("sqlformat -h", intern = TRUE) : error in running command

```sql
SELECT `year`, carrier, flight, dest, count(*) as n, avg(distance) as avg_dist, avg(air_time) as avg_air_time FROM flights f WHERE `month` BETWEEN 6 AND 12 AND carrier IN ("UA", "AA", "US", "WN") AND dep_time>=800 AND air_time<=120 AND origin LIKE("JFK") GROUP BY `year`, carrier, flight, dest ORDER BY n DESC LIMIT 10
```
<table>
 <thead>
  <tr>
   <th style="text-align:right;"> year </th>
   <th style="text-align:left;"> carrier </th>
   <th style="text-align:right;"> flight </th>
   <th style="text-align:left;"> dest </th>
   <th style="text-align:right;"> n </th>
   <th style="text-align:right;"> avg_dist </th>
   <th style="text-align:right;"> avg_air_time </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> US </td>
   <td style="text-align:right;"> 1831 </td>
   <td style="text-align:left;"> CLT </td>
   <td style="text-align:right;"> 178 </td>
   <td style="text-align:right;"> 541 </td>
   <td style="text-align:right;"> 86.95506 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> US </td>
   <td style="text-align:right;"> 425 </td>
   <td style="text-align:left;"> CLT </td>
   <td style="text-align:right;"> 126 </td>
   <td style="text-align:right;"> 541 </td>
   <td style="text-align:right;"> 84.92857 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> AA </td>
   <td style="text-align:right;"> 178 </td>
   <td style="text-align:left;"> BOS </td>
   <td style="text-align:right;"> 119 </td>
   <td style="text-align:right;"> 187 </td>
   <td style="text-align:right;"> 37.94118 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> AA </td>
   <td style="text-align:right;"> 256 </td>
   <td style="text-align:left;"> BOS </td>
   <td style="text-align:right;"> 117 </td>
   <td style="text-align:right;"> 187 </td>
   <td style="text-align:right;"> 39.13675 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> AA </td>
   <td style="text-align:right;"> 2314 </td>
   <td style="text-align:left;"> BOS </td>
   <td style="text-align:right;"> 115 </td>
   <td style="text-align:right;"> 187 </td>
   <td style="text-align:right;"> 37.85217 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> US </td>
   <td style="text-align:right;"> 1802 </td>
   <td style="text-align:left;"> CLT </td>
   <td style="text-align:right;"> 112 </td>
   <td style="text-align:right;"> 541 </td>
   <td style="text-align:right;"> 87.23214 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> AA </td>
   <td style="text-align:right;"> 84 </td>
   <td style="text-align:left;"> BOS </td>
   <td style="text-align:right;"> 101 </td>
   <td style="text-align:right;"> 187 </td>
   <td style="text-align:right;"> 37.95049 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> AA </td>
   <td style="text-align:right;"> 1850 </td>
   <td style="text-align:left;"> BOS </td>
   <td style="text-align:right;"> 94 </td>
   <td style="text-align:right;"> 187 </td>
   <td style="text-align:right;"> 38.46809 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> AA </td>
   <td style="text-align:right;"> 1838 </td>
   <td style="text-align:left;"> BOS </td>
   <td style="text-align:right;"> 93 </td>
   <td style="text-align:right;"> 187 </td>
   <td style="text-align:right;"> 37.83871 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:left;"> AA </td>
   <td style="text-align:right;"> 1762 </td>
   <td style="text-align:left;"> BOS </td>
   <td style="text-align:right;"> 86 </td>
   <td style="text-align:right;"> 187 </td>
   <td style="text-align:right;"> 38.47674 </td>
  </tr>
</tbody>
</table>

This query and table select the most popular flights from JFK between June and December of 2013 from the carriers `UA`, `AA`, `US`, and `WN` that depart JFK after 8:00 AM and have an air time of less than 2 hours.

## Learn more

There's more that the package can do, like `JOIN`s, `INSERT`s, and `UPDATE`s that I haven't gone into here.

There are also a number of wrappers, [comparison operators](https://gadenbuie.github.io/sqrrl/reference/comparison.html) and [concatenators](https://gadenbuie.github.io/sqrrl/reference/general.html) that can be used for wrapping strings in quotes --- e.g. `quotes()` --- comparing columns to values --- e.g. `geq()`, `eq()`, `lt()`, `neq()` --- and stringing together statements --- e.g. `AND()`, `OR()`, `%LIKE%`, `%IN%`, `BETWEEN()`.

There's an example of nearly every single function and each of it's possible configurations in the [package documentation][sqrrl-docs].

Hopefully this package is useful to someone other than myself (like you!).
If you run into any problems, [let me know](http://twitter.com/grrrck) or [submit an issue on GitHub](https://github.com/gadenbuie/sqrrl/issues).



[sqrrl-src]: https://github.com/gadenbuie/sqrrl/
[sqrrl-docs]: https://gadenbuie.github.io/sqrrl/
[sqrrl-start]: https://gadenbuie.github.io/sqrrl/articles/sqrrl.html
[shiny]: https://shiny.rstudio.com
