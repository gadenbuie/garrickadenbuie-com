---
title: "Lookup Citation Counts with R and rcrossref"
author: Garrick Aden-Buie
date: 2014-10-21T14:30:00+00:00
categories: [Blog]
tags:
  - R
  - Scripts
  - Research
  - Tips
---

#### Summary

> An R script and function that takes a citation key as a unique identifier for a paper and outputs the paper's citation count.
>
> To make it work you need to have your references stored in a BibTeX file with DOIs. The script looks up the citation key in the BibTeX file, and uses [rcrossref][] to look up the citation count on [CrossRef][].

And here's the [link to the script as a GitHub Gist](https://gist.github.com/gadenbuie/9b5609a6154753394f1a).

# Background

I'm working on a literature review at the moment. They take a considerable amount of work. I've looked over the shoulder of a few people working on literature reviews and nearly everyone uses a tabular format to track the papers they've read and organize metadata and the other information they're extracting from the papers they're reading.

As I'm reading papers, I am collecting a small mountain of references to follow up on. When I add a reference to this list, I include some useful information for my future self who will have to read the new paper after forgetting where it came from, such as

- The paper metadata (title, author, journal, year)
- A note about why I thought the paper would be relevant in the moment
- The citation key of the paper where the reference was mentioned
- A "priority score" from 1 to 5, with 5 being highest priority

The key point of friction when moving through the literature is in selecting the next paper to read when you've finished your current paper. The objective is to understand the field and the context in which the literature exists, so imposing some kind of order can greatly speed up the process.

For example, I sort the mountain of papers to read by priority score and then by year. Pick the most recent, highest priority paper to read next.

This method provides decent results and helps to select papers that will likely provide the most amount of context and coverage. By the time you reach older papers, their content has been covered or mentioned in other earlier papers and their place in the literature is apparent.

But a crucial piece of missing information is the number of times each paper or work was cited. My solution was to write an R script that uses [rcrossref][] to **automatically look up the number of times each paper was cited on [CrossRef][]**.

There are two key parts to this puzzle:

1. All the papers I download end up in [Mendeley][].

    Mendeley grabs the paper metadata from the Internet automatically, but I get best results by making sure that Mendeley uses the DOI rather than Google Scholar to find this information. If the DOI isn't automatically extracted from the paper, I add it manually and click the magnifying glass next to the DOI field. Mendeley then grabs the metadata from <http://doi.org> or [CrossRef][] and it is almost always correct as a result.

    _Why is this important?_ If you [Enable BibTeX syncing](http://blog.mendeley.com/tipstricks/howto-use-mendeley-to-create-citations-using-latex-and-bibtex/) in the Mendeley preferences, then **all of the metadata for all of your papers are stored in a single BibTeX file**, indexed by citation key.

2. The **citation key Mendeley uses is automatically generated and unique to each paper**. In my literature review spreadsheet, I add a column containing the citation key of each paper, which on the one hand lets me quickly find the paper again by searching for the citekey in Mendeley and on the other lets me find the article metadata in the master BibTeX file.

# getCiteCounts()

This script I wrote does three basic things:

1. Read the master BibTeX file, extracting citation keys and DOIs.
2. For each citation key in the spreadsheet notes, look up the associated DOI.
3. Query CrossRef for the citation count of the associated DOI using `rcrossref::cr_citation_count()`.

I've [posted the code and two example files as a GitHub gist](https://gist.github.com/gadenbuie/9b5609a6154753394f1a)[^1].

[^1]: You can download the code & files from the gist, or clone the gist from the command line by using: `git clone https://gist.github.com/9b5609a6154753394f1a.git`

# Example

A truncated version of my literature review notes might look like this:

| Citekey       | Year | Title                                | Author                       | Notes                           | Priority |
|:--------------|:-----|:-------------------------------------|:-----------------------------|:--------------------------------|:---------|
| Ripamonti2009 | 2009 | Predictive models in palliative care | Ripamonti, Farina, Garassino | Often mentioned as foundational | 5        |

*Example entry in my literature review notes.*


And somewhere inside my master BibTeX file is an entry that looks like this:

```tex
@article{Ripamonti2009,
    author = {Ripamonti, Carla Ida and Farina, Gabriella and Garassino, Marina Chiara},
    doi = {10.1002/cncr.24351},
    journal = {Cancer},
    number = {S13},
    pages = {3128--3134},
    title = {Predictive models in palliative care},
    url = {http://dx.doi.org/10.1002/cncr.24351},
    volume = {115},
    year = {2009}
}
```

If I use `getCiteCounts` to look up the number of citations I get this:

```r
> MasterBibFile <- '/path/to/library.bib'
> getCiteCounts('Ripamonti2009', MasterBibFile)
[1] 15
```

Adding a new column to my literature notes with the citation counts is as easy as

```r
litnotes <- read.csv('litnotes.csv', stringsAsFactors = FALSE)
MasterBibFile <- '/path/to/library.bib'
litnotes$Citations <- getCiteCounts(litnotes$Citekey, MasterBibFile)
```


[Mendeley]: http://www.mendeley.com/
[CrossRef]: http://crossref.org/
[rcrossref]: https://github.com/ropensci/rcrossref
[ropensci]: http://ropensci.org/
