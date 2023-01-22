---
title: Twitter's Feelings About Programming Languages
author: Garrick Aden-Buie
date: '2019-10-08'
slug: tweet-poll-programming-languages
categories:
  - Blog
tags:
  - R
  - rtweet
  - Data Analysis
  - Visualization
  - Programming
  - Poll
description: A deep dive into an informal, free-form survey about experiences with programming languages.
images:
  - /blog/2019/2019-10-08-tweet-poll-programming-languages_files/figure-html/votes-love-hate-twitter-1.png
source_link: 'https://github.com/gadenbuie/garrickadenbuie-com/blob/main/content/blog/2019/2019-10-08-tweet-poll-programming-languages.Rmarkdown'
keywords:
  - rstats
  - rtweet
  - Tweet analysis
  - Programming languages
  - R
editor_options:
  chunk_output_type: console
---

<script src="/rmarkdown-libs/htmlwidgets-1.5.4/htmlwidgets.js"></script>
<script src="/rmarkdown-libs/plotly-binding-4.10.0/plotly.js"></script>
<script src="/rmarkdown-libs/typedarray-0.1/typedarray.min.js"></script>
<script src="/rmarkdown-libs/jquery-3.5.1/jquery.min.js"></script>
<link href="/rmarkdown-libs/crosstalk-1.1.1/css/crosstalk.css" rel="stylesheet" />
<script src="/rmarkdown-libs/crosstalk-1.1.1/js/crosstalk.min.js"></script>
<link href="/rmarkdown-libs/plotly-htmlwidgets-css-2.5.1/plotly-htmlwidgets.css" rel="stylesheet" />
<script src="/rmarkdown-libs/plotly-main-2.5.1/plotly-latest.min.js"></script>
<!-- Links -->
<!----------- POST START ----------->

An informal poll about experiences with programming languages has been making the rounds on Twitter this week.
It all started with [this tweet](https://twitter.com/cotufa82/status/1179601883448655874) from [@cotufa82](https://twitter.com/cotufa82/):

<blockquote class="twitter-tweet" data-twitter-extracted-i163061341656489096="true">
<p dir="ltr" lang="en">

1.  First language: Basic / Java<br>2. Had difficulties: Java<br>3. Most used: JavaScript / Python<br>4. Totally hate: Java<br>5. Most loved: Go / Python<br>6. For beginners: Python / Ruby<br><br>What about you?
    </p>
    — Super Di (@cotufa82) <a href="https://twitter.com/cotufa82/status/1179601883448655874?ref_src=twsrc%5Etfw">October 3, 2019</a>
    </blockquote>

The tweet caught on within a few days
and there are now more than
16,840
replies and quote tweets from developers and programmers
sharing their own experiences.

<img src="/blog/2019/2019-10-08-tweet-poll-programming-languages_files/figure-html/tweets-per-day-1.svg" width="864" />

My interest in the poll was piqued by another tweet by
[@edsu](https://twitter.com/edsu/status/1180844062552858624)
sharing a
[Jupyter notebook](https://github.com/edsu/notebooks/blob/c5aad3555adfbf7c63dcd968f7b4a73ce11820b5/Languages.ipynb)
analyzing the tweeted responses.
I thought it would be interesting
to do a similar analysis using R,
initially thinking I could compare the R and Python versions.

What I should have done is to have used *both* R and Python
(because they’re friends and language wars are silly),
but instead I ended up going down the endless rabbit hole
of regular expressions and free-form informal survey results.

## Gather the Tweets

I gathered all tweets containing `"first language"`, `"most used"`, and `"most loved"`
using the excellent [rtweet](https://rtweet.info) package by [Mike Kearney](https://mikewk.com/).

``` r
tweets <- rtweet::search_tweets(
  '"first language" AND "most used" AND "most loved"',
  n = 18000,
  include_rts = FALSE
)
```

You can download [a CSV with the processed tweets](tweets-first-lang.csv).
The `.csv` doesn’t include the full tweet data,
but it does include `status_id` so that you can recover the tweet data
with `rtweet::lookup_statuses()`.

## Whose Tweets Were The Most Popular?

There were
16,840
reponses to the poll and
89%
or
15,025
of them are
replies to or quotes of another tweet.
Here are the top contributors to the popularity of the poll,
in the form of the top 10 recipients of a reply or quote tweet.

<script type="application/json" id="screen-names">[{"status_id":"1179601883448655874","screen_name":"cotufa82"},{"status_id":"1180073494047969280","screen_name":"nixcraft"},{"status_id":"1180147893350612993","screen_name":"ASpittel"},{"status_id":"1180173845749125121","screen_name":"ryanflorence"},{"status_id":"1180074716440223744","screen_name":"Sosowski"},{"status_id":"1180169402127249408","screen_name":"malwareunicorn"},{"status_id":"1180151225435742208","screen_name":"_developit"},{"status_id":"1180176367322722304","screen_name":"rakyll"},{"status_id":"1180081960519114757","screen_name":"asemota"},{"status_id":"1180238736698687488","screen_name":"JackRhysider"}]</script>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
<div id="starter-tweet-container">
<div id="plot">
<div id="htmlwidget-1" style="width:100%;height:500px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"data":[{"x":[0,78],"y":[1,1],"text":"   78 quotes and replies","type":"scatter","mode":"lines","line":{"width":3.77952755905512,"color":"rgba(157,220,165,1)","dash":"solid"},"hoveron":"points","name":"(JackRhysider,1)","legendgroup":"(JackRhysider,1)","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0,79],"y":[2,2],"text":"   79 quotes and replies","type":"scatter","mode":"lines","line":{"width":3.77952755905512,"color":"rgba(127,208,163,1)","dash":"solid"},"hoveron":"points","name":"(asemota,1)","legendgroup":"(asemota,1)","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0,80],"y":[3,3],"text":"   80 quotes and replies","type":"scatter","mode":"lines","line":{"width":3.77952755905512,"color":"rgba(105,195,163,1)","dash":"solid"},"hoveron":"points","name":"(rakyll,1)","legendgroup":"(rakyll,1)","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0,85],"y":[4,4],"text":"   85 quotes and replies","type":"scatter","mode":"lines","line":{"width":3.77952755905512,"color":"rgba(89,180,163,1)","dash":"solid"},"hoveron":"points","name":"(_developit,1)","legendgroup":"(_developit,1)","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0,88],"y":[5,5],"text":"   88 quotes and replies","type":"scatter","mode":"lines","line":{"width":3.77952755905512,"color":"rgba(80,164,162,1)","dash":"solid"},"hoveron":"points","name":"(malwareunicorn,1)","legendgroup":"(malwareunicorn,1)","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0,122],"y":[6,6],"text":"  122 quotes and replies","type":"scatter","mode":"lines","line":{"width":3.77952755905512,"color":"rgba(74,149,159,1)","dash":"solid"},"hoveron":"points","name":"(Sosowski,1)","legendgroup":"(Sosowski,1)","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0,138],"y":[7,7],"text":"  138 quotes and replies","type":"scatter","mode":"lines","line":{"width":3.77952755905512,"color":"rgba(69,134,156,1)","dash":"solid"},"hoveron":"points","name":"(ryanflorence,1)","legendgroup":"(ryanflorence,1)","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0,156],"y":[8,8],"text":"  156 quotes and replies","type":"scatter","mode":"lines","line":{"width":3.77952755905512,"color":"rgba(65,119,152,1)","dash":"solid"},"hoveron":"points","name":"(ASpittel,1)","legendgroup":"(ASpittel,1)","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0,539],"y":[9,9],"text":"  539 quotes and replies","type":"scatter","mode":"lines","line":{"width":3.77952755905512,"color":"rgba(62,104,149,1)","dash":"solid"},"hoveron":"points","name":"(nixcraft,1)","legendgroup":"(nixcraft,1)","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0,2045],"y":[10,10],"text":"2,045 quotes and replies","type":"scatter","mode":"lines","line":{"width":3.77952755905512,"color":"rgba(62,88,144,1)","dash":"solid"},"hoveron":"points","name":"(cotufa82,1)","legendgroup":"(cotufa82,1)","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[78],"y":[1],"text":"   78 quotes and replies","type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(157,220,165,1)","opacity":1,"size":11.3385826771654,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(157,220,165,1)"}},"hoveron":"points","name":"(JackRhysider,1)","legendgroup":"(JackRhysider,1)","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[79],"y":[2],"text":"   79 quotes and replies","type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(127,208,163,1)","opacity":1,"size":11.3385826771654,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(127,208,163,1)"}},"hoveron":"points","name":"(asemota,1)","legendgroup":"(asemota,1)","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[80],"y":[3],"text":"   80 quotes and replies","type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(105,195,163,1)","opacity":1,"size":11.3385826771654,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(105,195,163,1)"}},"hoveron":"points","name":"(rakyll,1)","legendgroup":"(rakyll,1)","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[85],"y":[4],"text":"   85 quotes and replies","type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(89,180,163,1)","opacity":1,"size":11.3385826771654,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(89,180,163,1)"}},"hoveron":"points","name":"(_developit,1)","legendgroup":"(_developit,1)","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[88],"y":[5],"text":"   88 quotes and replies","type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(80,164,162,1)","opacity":1,"size":11.3385826771654,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(80,164,162,1)"}},"hoveron":"points","name":"(malwareunicorn,1)","legendgroup":"(malwareunicorn,1)","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[122],"y":[6],"text":"  122 quotes and replies","type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(74,149,159,1)","opacity":1,"size":11.3385826771654,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(74,149,159,1)"}},"hoveron":"points","name":"(Sosowski,1)","legendgroup":"(Sosowski,1)","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[138],"y":[7],"text":"  138 quotes and replies","type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(69,134,156,1)","opacity":1,"size":11.3385826771654,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(69,134,156,1)"}},"hoveron":"points","name":"(ryanflorence,1)","legendgroup":"(ryanflorence,1)","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[156],"y":[8],"text":"  156 quotes and replies","type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(65,119,152,1)","opacity":1,"size":11.3385826771654,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(65,119,152,1)"}},"hoveron":"points","name":"(ASpittel,1)","legendgroup":"(ASpittel,1)","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[539],"y":[9],"text":"  539 quotes and replies","type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(62,104,149,1)","opacity":1,"size":11.3385826771654,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(62,104,149,1)"}},"hoveron":"points","name":"(nixcraft,1)","legendgroup":"(nixcraft,1)","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[2045],"y":[10],"text":"2,045 quotes and replies","type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(62,88,144,1)","opacity":1,"size":11.3385826771654,"symbol":"circle","line":{"width":1.88976377952756,"color":"rgba(62,88,144,1)"}},"hoveron":"points","name":"(cotufa82,1)","legendgroup":"(cotufa82,1)","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.958904109589,"r":7.30593607305936,"b":40.9132420091324,"l":92.7853881278539},"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-102.25,2147.25],"tickmode":"array","ticktext":["0","500","1000","1500","2000"],"tickvals":[0,500,1000,1500,2000],"categoryorder":"array","categoryarray":["0","500","1000","1500","2000"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.65296803652968,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":{"text":"Quotes and Replies","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.4,10.6],"tickmode":"array","ticktext":["JackRhysider","asemota","rakyll","_developit","malwareunicorn","Sosowski","ryanflorence","ASpittel","nixcraft","cotufa82"],"tickvals":[1,2,3,4,5,6,7,8,9,10],"categoryorder":"array","categoryarray":["JackRhysider","asemota","rakyll","_developit","malwareunicorn","Sosowski","ryanflorence","ASpittel","nixcraft","cotufa82"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.65296803652968,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":false,"gridcolor":null,"gridwidth":0,"zeroline":false,"anchor":"x","title":{"text":"","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":null,"bordercolor":null,"borderwidth":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895},"title":{"text":"","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}}},"hovermode":"closest","barmode":"relative","dragmode":false},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"7da166c8de8c":{"x":{},"y":{},"colour":{},"text":{},"yend":{},"xend":{},"type":"scatter"},"7da1d8aee0c":{"x":{},"y":{},"colour":{},"text":{}}},"cur_data":"7da166c8de8c","visdat":{"7da166c8de8c":["function (y) ","x"],"7da1d8aee0c":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":{"render":[{"code":"\nfunction (el) {\n  const screenNames = JSON.parse(document.getElementById('screen-names').innerHTML)\n  el.on('plotly_click', function(d) {\n    const hoveredIdx = d.points[0].y\n    const tweet = screenNames[screenNames.length - hoveredIdx]\n    const tweetDiv = document.getElementById('tweet')\n    tweetDiv.innerHTML = ''\n    twttr.widgets.createTweet(tweet.status_id, tweetDiv)\n  })\n}\n    ","data":null}]}}</script>
</div>
<div id="tweet">
<div class="tweet-placeholder">
<div>Click on dot in plot to view tweet...</div>
</div>
</div>
</div>

## Our Experience with Programming Languages

Let’s dive into the results.
If you’re interested in taking a peek behind the regular expressions curtain, I’ve included a [code walkthrough](#code-walkthrough) below.

The original tweet asked for six categories: **First language**, **Had difficulties**, **Most used**, **Totally hate**, **Most loved**, **For beginners**.
Replies to this tweet were… creative.
The category names and formatting were hand-typed, so flexible and prone to spelling errors and permutations.

To get the broadest range of answers possible,
I used flexible regular expressions to accept a variety of formatting choices,
and I also widened the categories to encompass the same core themes.
For example,
`first love`, `secret love`, and `mostly loved`
all were added to the **Most loved** category,
which I called, simply, **love**.

I also captured multiple programming languages in each category
(even the [original tweet](https://twitter.com/cotufa82/status/1179601883448655874) had multiple answers for first language (Basic/Java) and a few other categories).

Each of the following plots shows the top 20 responses in each category.

### First Language vs. Recommended First Language

How do the first languages learned by programmers
compare to the languages *they* would recommend to *others*
to learn first?
Many people started with older languages
like Basic, C, Pascal, C++ and Java
but would recommend new programmers start with Python, JavaScript, Ruby and also C or Java.

<div class="fig-wide">
<img src="/blog/2019/2019-10-08-tweet-poll-programming-languages_files/figure-html/votes-first-beginner-wide-1.svg"/>
</div>
<div class="fig-narrow">
<img src="/blog/2019/2019-10-08-tweet-poll-programming-languages_files/figure-html/votes-first-beginner-narrow-1.svg"/>
</div>

### Love It or Hate It

Which programming languages are loved and which languages are not?
The world seems to have a love/hate relationship with JavaScript,
but Python is much more loved than hated.
Likewise Swift, Ruby, and Go are significantly more positive than negative,
C++ is also a bit love/hate,
and PHP certainly isn’t feeling the love.

<div class="fig-wide">
<img src="/blog/2019/2019-10-08-tweet-poll-programming-languages_files/figure-html/votes-love-hate-wide-1.svg"/>
</div>
<div class="fig-narrow">
<img src="/blog/2019/2019-10-08-tweet-poll-programming-languages_files/figure-html/votes-love-hate-narrow-1.svg"/>
</div>

### Most Used or Had Difficulties

Which languages are most used compared with those that have caused difficulties?
JavaScript is eating the world,
and plenty of people are using workhorse languages like Python, Java and C\#/C++.
(And a quite a few are using PHP presumably because they have to.)
Still, JavaScript’s love/hate relationship continues
as many people indicated that it caused them problems.
I’m not surprised to see C++, C, and Java on the *had difficulties* list.
Interestingly, Haskell shows up in the *loved* list but seems to also be tricky to learn.

<div class="fig-wide">
<img src="/blog/2019/2019-10-08-tweet-poll-programming-languages_files/figure-html/votes-used-difficult-wide-1.svg"/>
</div>
<div class="fig-narrow">
<img src="/blog/2019/2019-10-08-tweet-poll-programming-languages_files/figure-html/votes-used-difficult-narrow-1.svg"/>
</div>

### Feelings about `#rstats`

How do developers feel about my favorite language?
R isn’t a typical first language,
but it is among the top 20 recommended to new programmers to learn first.
It’s also the
12th
most used language.

| Category                                                                                               | Rank | Total |
|:-------------------------------------------------------------------------------------------------------|:-----|:------|
| most used                                                                                              | 12   | 1456  |
| love                                                                                                   | 15   | 2067  |
| had difficulties                                                                                       | 19   | 2092  |
| hate                                                                                                   | 16   | 2641  |
| beginner                                                                                               | 17   | 2296  |
| first language                                                                                         | 28   | 1508  |
| curious                                                                                                | 15   | 207   |
| currently                                                                                              | 2    | 63    |
| next                                                                                                   | 3    | 50    |
| honerable mention                                                                                      | 8    | 98    |
| chronology                                                                                             | 25   | 29    |
| also used, eager to learn, frenemy, never studied, on my list, to learn, totally meh, willing to learn |      |       |

## Code Walkthrough

At a high level,
the process for cleaning and standardizing the tweet repsonses
looks like this.
I abstracted some of the larger steps in [the pipeline](#tweets-lang-poll) into separate functions.

1.  Pre-clean the tweet text, including [remove\_unused\_text()](#remove-unused-text)

2.  Separate tweets so that each line or item of the tweet is in its own row using `tidyr::separate_rows()`

    -   Items are indicated by `N.`, `N)`, `N:`, or `N-`, or just appear on a new line without numbering.

3.  Remove whitespace and any numbering from each line

4.  Separate each line into a question `category` and `answer` pair by splitting on `:` using `tidyr::separate()`

5.  Filter out empty answers and convert everything to lower case

6.  Use a set of regular expressions to [process\_answer()](#process-answer) into individual languages

7.  Use more regular expressions to [recode\_answer()](#recode-answer) and [recode\_category()](#recode-category), fixing spelling mistakes and combining overlapping groups

8.  Count the number of replies mentioning each programming language by category

The [whole pipeline](#tweets-lang-poll) is summarized below,
including the function to [plot response counts by category](#plot-tweets-by-category).

### Remove Unused Text

This little function removes usernames (`@user`),
URLs,
parenthetical comments,
and turns `#hashtag` into `hashtag`
because many people specified their choices using language hashtags, like `#rstats` instead of `r`.

``` r
remove_unused_text <- function(text) {
  text %>%
    # strip usernames
    str_remove_all("@\\w+\\s*") %>%
    # strip URLs
    str_remove_all("\\s*http[^ ]+\\s*") %>%
    # remove parentheticals
    str_remove_all("\\s*\\(.+?\\)( |\n|$)") %>%
    # replace "#hashtag" with "hashtag"
    str_replace_all("#(\\w)", "\\1")
}
```

### Process Answer

The goal in processing the answers is to transform each answer to a single string of comma separated languages.
In doing this, common variations of language lists should result in the same final answers.
For example,
`Python and R`, `Python/R`, and `Python or R` should all be handled similarly.
To help with this process I created a list of common languages that frequently appear in the answers.

``` r
common_langs <- c(
  # c, c#, c++, and .net are manually included later
  "css", "html", "python", "javascript", "x86", "java", "ruby", "pascal", "php",
  "matlab", "perl", "fortran", "logo", "actionscript", "lua", "assembly",
  "delphi", "js", "scheme", "scratch", "go", "typescript", "clojure", "elixr",
  "kotlin", "ocaml", "rust", "mathematica", "matlab", "dart", "flutter", "groovy",
  "flash", "bash", "shell", "sql", "haskell", "lisp", "scala", "sas",
  "rstats", "golang"
)
```

Then, with a bit of regex kung fu,
the responses are converted from `Python and R` to `python,r`.

``` r
process_answer <- function(answer, common_langs) {
  answer %>%
    # Aggresively remove unusual characters
    str_replace_all("[^\\w\\d#+., ]", " ") %>%
    # Remove leading character if it's a `,`
    str_replace_all("^,", " ") %>%
    # Remove `.` at end of string
    str_remove_all("[.]$") %>%
    # Replace and, or with space (prep for next step)
    str_replace_all("\\b(and|or|also|amp)\\b", " ") %>%
    # Remove qualifiers
    str_remove_all("\\b(maybe|now)\\b") %>%
    # Multiple languages may be listed separated by spaces, if so add comma
    str_replace_all(
      pattern = paste0("\\b(", paste(common_langs, collapse = "|"), ")\\b\\s*"),
      replacement = "\\1,"
    ) %>%
    gsub("c\\+\\+\\d+", "c++", .) %>%
    # Comma separate languages that are tough to regex
    gsub("c ", "c,", ., fixed = TRUE) %>%
    gsub(".net ", ".net,", ., fixed = TRUE) %>%
    gsub("c# ", "c#,", ., fixed = TRUE) %>%
    gsub("c++ ", "c++,", ., fixed = TRUE) %>%
    # No trailing punctuation
    str_remove("[.,!?/=<>;:]+$")
}
```

### Recode Answer

There are a number of programming languages that have multiple variants
or are commonly referred to by shorthand names —
`rstats` for `R` or `golang` for `go`, for example.
This function recodes the programming language answers
that I noticed while working with the data
(but it’s admitedly not complete).

``` r
recode_answer <- function(answer) {
  # Recode Basic Variants
  answer <- recode(answer, "vb" = "visual basic")
  answer <- if_else(str_detect(answer, "visual.*basic"), "visual basic", answer)
  answer <- if_else(str_detect(answer, "q.*basic"), "qbasic", answer)
  answer <- if_else(str_detect(answer, "gw.*basic"), "gw basic", answer)
  answer <- if_else(str_detect(answer, "(?<!(visual|q|gw)\\s?)basic"), "basic", answer)
  # Recode Pascal variants
  answer <- if_else(str_detect(answer, "pascal"), "pascal", answer)
  # Recode js vs Javascript
  answer <- recode(answer, "js" = "javascript")
  # Recode golang to go
  answer <- recode(answer, "golang" = "go")
  # Recode rstats as r
  recode(answer, "rstats" = "r")
}
```

### Recode Category

As you might imagine with a free-form survey
where users manually enter both the question *and* the answer,
there is a large amount of variation in the spelling and categories used.

I broadly grouped many of the variations into common themes,
primarily working to fit the original prompt.
There are many, many interesting created categories, like `best dead language`, `didn't spark joy`, or `latest crush`.
Here are two additional categories that I created, `curious` and `interesting`.

<div class="fig-wide">
<img src="/blog/2019/2019-10-08-tweet-poll-programming-languages_files/figure-html/votes-curious-interesting-wide-1.svg"/>
</div>
<div class="fig-narrow">
<img src="/blog/2019/2019-10-08-tweet-poll-programming-languages_files/figure-html/votes-curious-interesting-narrow-1.svg"/>
</div>

``` r
recode_category <- function(category) {
  case_when(
    str_detect(category, "first.+lang(uage)?|firstlanguage") ~ "first language",
    str_detect(category, "^first$") ~ "first language",
    str_detect(category, "b(e|i)ginn?e|new dev|newb|starter|noob|brginners|begginners|begginers") ~ "beginner",
    str_detect(category, "want|would|wish|wanna|curious|desire|(like.+learn)|curios|(like to try)") ~ "curious",
    str_detect(category, "m[ou]st?(ly)? ?used?") ~ "most used",
    str_detect(category, "diff?.+c.+lt|diificulties|difficulies|difficuties|difficulities") ~ "had difficulties",
    str_detect(category, "love") ~ "love",
    str_detect(category, "hate|dislike|avoid|(don.?t.+like)") ~ "hate",
    str_detect(category, "promis|interest|exotic|esoter|(most excited)|(weird)") ~ "interesting",
    str_detect(category, "honou?rable mention") ~ "honerable mention",
    str_detect(category, "next|need to learn") ~ "next",
    str_detect(category, "others used|other lang|dabbl") ~ "others used",
    str_detect(category, "current") ~ "currently",
    TRUE ~ category
  )
}
```

### Poll Processing Pipeline

Finally, here is the full pipeline to go from raw tweets to poll results.

``` r
tweets_lang_poll <-
  tweets %>%
  select(status_id, created_at, user_id, screen_name, text) %>%
  # Remove tweets with "English" because that's probably a different thread
  filter(!str_detect(text, "[eE]nglish")) %>%
  mutate(
    # Backup original tweet text
    text_og = text,
    # Remove unused text from tweets
    text = remove_unused_text(text)
  ) %>%
  # Split text into question/answer pairs,
  # splitting on newline or one of: `N.`, `N)`, `N:`, or `N-`
  separate_rows(text, sep = "\n|\\d\\s*[.):-]") %>%
  # Remove whitespace and `N.` numbers from start of text
  mutate(text = str_remove_all(text, "^\\s*(\\d[.):-])?\\s*")) %>%
  # Seperate question/answer into category, answer columns, splitting on colon `:`
  separate(
    col = text,
    into = c("category", "answer"),
    sep = "\\s*:\\s*",
    remove = FALSE
  ) %>%
  # Remove nothing answers or answers without any letters
  filter(
    !is.na(answer),
    str_detect(answer, "[[:alnum:]]")
  ) %>%
  # Re-encode category, answer as UTF-8 (:shrug:) and lowercase
  mutate_at(vars(category, answer), stringi::stri_enc_toutf8) %>%
  mutate_at(vars(category, answer), tolower) %>%
  # Category: Remove leading non-alpha characters and squish whitespace
  mutate(
    category = str_remove(category, "^[^[:alpha:]]+"),
    category = str_squish(category)
  ) %>%
  # Process answer as well as we can programmatically
  mutate(answer = process_answer(answer, common_langs)) %>%
  # Separate into one language per row
  separate_rows(answer, sep = "\\s*[,/]\\s*") %>%
  # Squish the strings
  mutate_at(vars(answer), str_squish) %>%
  mutate(
    answer = recode_answer(answer),
    category2 = recode_category(category)
  ) %>%
  # Filter out empty category, answer fields
  filter(!str_detect(answer, "^\\s*$")) %>%
  filter(
    nchar(answer) > 0,
    nchar(category) > 4
  )
```

And then to aggregate and count programming language mentions per category.

``` r
tweets_lang_counted <-
  tweets_lang_poll %>%
  count(category2, answer, sort = TRUE)
```

### Plot Language Counts by Category

Last, but not least,
this function creates the plots for requested categories.
One key detail is that bars are ordered within each facet
using <span class="pkg">tidytext</span>’s `reorder_within()` function.
Check out Julia Silge’s excellent blog post on this function:
[Reordering and facetting for ggplot2](https://juliasilge.com/blog/reorder-within/).

While the bars are ordered in descending order,
I wanted the bar fill color to be consistent across facets
to facilitate comparison between the two categories.
The color palette is `ocean.deep` from the <span class="pkg">pals</span> package, which I found by looking through
Emil Hvitfeldt’s
[Comprehensive list of color palettes in R](https://github.com/EmilHvitfeldt/r-color-palettes#comprehensive-list-of-color-palettes-in-r).

``` r
plot_tweets_by_category <- function(
  tweets_lang_counted,
  categories,
  ncol = 2,
  min_count = 10
) {
  tweets_lang_counted %>%
    filter(category2 %in% categories) %>%
    mutate_at(vars(category2), factor, levels = categories) %>%
    group_by(category2) %>%
    arrange(desc(n)) %>%
    filter(n >= min_count) %>%
    top_n(20, n) %>%
    ungroup() %>%
    arrange(category2, answer, desc(n)) %>%
    mutate(
      answer_within = tidytext::reorder_within(answer, n, category2),
      answer = fct_reorder(answer, n, first)
    ) %>%
    ggplot() +
    aes(answer_within, n, fill = answer) +
    geom_col() +
    coord_flip() +
    tidytext::scale_x_reordered(expand = c(0, 0)) +
    discrete_scale("fill", "ocean", function(n) rev(pals::ocean.deep(n + 10))[6:(n+5)]) +
    guides(fill = FALSE) +
    labs(x = NULL, y = NULL) +
    facet_wrap(~ category2, scales = "free", ncol = ncol) +
    theme_minimal(base_family = "PT Sans", base_size = 18) +
    theme(
      plot.margin = margin(20, 20, 20, 20),
      panel.grid.major.y = element_blank(),
      panel.grid.minor.x = element_blank(),
      axis.ticks.y = element_blank(),
      axis.text.x = element_text(family = "PT Sans Narrow"),
      axis.text.y.left = element_text(margin = margin()),
      panel.spacing.x = unit(3, "line"),
      panel.spacing.y = unit(2, "line")
    )
}
```

## What About You?

If you made it this far,
share your programming experiences on Twitter!

Thanks for reading and feel free to share
feedback, thoughts, or questions with me on Twitter at
[@grrrck](https://twitter.com/grrrck).

<style type="text/css">
#starter-tweet-container {
    display: grid;
    grid-template-columns: 1fr 300px;
    width: 100%;
    max-width: 100%;
    min-height: 540px;
}
#plot {
  max-width: 90vw;
}
#tweet > * {
  margin: 0 auto;
}
.tweet-placeholder {
    background: #F8F8F8;
  height: calc(525px - 4em);
  width: 100%;
    margin: 2em;
    padding: 2em;
    border-radius: 10px;
    text-align: center;
  display: flex;
  align-items: center;
  justify-content: center;
}
@media screen and (min-width: 601px) {
  .fig-wide {
    display: block;
  }
  .fig-narrow {
    display: none;
  }
}
@media screen and (max-width: 600px) {
  .fig-wide {
    display: none;
  }
  .fig-narrow {
    display: block;
  }
  #starter-tweet-container {
    grid-template-columns: 1fr;
    grid-template-rows: 540px 1fr;
    width: 100%;
    max-width: 100%;
  }
  #tweet {
    min-height: 200px;
  }
  .tweet-placeholder {
    height: 175px;
  }
}
@media screen and (max-width: 65em) and (min-width: 48em) {
  #starter-tweet-container {
    grid-template-columns: 1fr;
    grid-template-rows: 540px 1fr;
    width: 100%;
  }
  .container.expanded #starter-tweet-container {
    max-width: 100vw;
  }
  .container:not(.expanded) #starter-tweet-container {
    max-width: calc(100vw - 288px);
  }
  #tweet {
    min-height: 500px;
  }
}
</style>
