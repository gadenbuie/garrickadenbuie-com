---
date: 2013-08-09T16:08:39+00:00
slug: respond-peer-reviews-with-pandoc
aliases:
  - /blog/2013/08/09/respond-peer-reviews-with-pandoc
title: Responding to peer reviewers with Pandoc
categories:
- git
- Markdown
- pandoc
- Productivity
- Workflow
---

I'm in the process of responding to the second round of peer reviews of a paper I've spent considerable time working on over the past year. Of course, this time around I've learned a few new tricks that make the whole process easier to manage...

1. I spent an entire weekend converting the paper from Word to LaTeX. By hand. But it's now worth it.

2. I coerced the other graduate student working on the paper to use [Trello](http://trello.com), so I can see what he's working on now, what he's planning to do next and what he's already done.

3. I've learned to use [git](http://git-scm.com/) in combination with [BitBucket](http://bitbucket.org) so individual changes are tracked and it's easy to flip between old and current versions of the paper with a simple `git checkout`.

4. I've learned how to use the powerful markdown language and document converter, [pandoc](http://johnmacfarlane.net/pandoc/), which I'm using to format our response to the reviewers.

I'm following the format presented by Matt Might in [Responding to peer review](http://matt.might.net/articles/peer-review-rebuttals/). It is an excellent guide to writing a response to peer reviewers, and the method he outlines fits perfectly into a pandoc workflow.

For example, the journal to which we are submitting is run by [Elsevier](http://www.elsevier.com/), who certainly has a platform to coordinate communication between editors, authors, and reviewers. A platform that conveniently strips all formatting from the review text. But, after simply copying and pasting the review text into a text file, I add `$` marks around the inline LaTeX and convert to PDF. Just _reading the reviews_ is easier when the math and format is clear.

Converting to PDF is as simple as:

```bash
pandoc response.txt -o response.pdf
```

Then, following [Matt Might's workflow](http://matt.might.net/articles/peer-review-rebuttals/), I indent each reviewer response with a `>` and prepare our replies underneath each item.

We were fortunate in that one reviewer offered a list of polite, meticulously detailed points. However, when converting our responses to PDF, the only difference between regular text and the LaTeX `quote` environment is increased indentation. When most of a document is normal text with only a few quotes, this is reasonable. But in our case it is very difficult to see, by indentation alone, exactly which text is the reviewer's comment and which text is our rebuttal.

After far too many hours digging through LaTeX and pandoc discussion forums and a long process of trial and error, I finally came up with the right commands to alter the quote environment. Simply include these lines at the beginning of your markdown file, and pandoc will apply the LaTeX code when converting to pdf.


```latex
\let\quoteOld\quote
\let\endquoteOld\endquote
\renewenvironment{quote}{\quoteOld\itshape}{\endquoteOld}
```

You can save the above lines in a file called `preamble.tex` that you can then include in the LaTeX header with the pandoc `--include-in-header` argument.

```bash
pandoc --include-in-header preamble.tex response.txt -o response.pdf
```

Rather than remember to include this code every time you want italicized block quotes, you can download the pandoc [default.latex](https://github.com/jgm/pandoc-templates/blob/master/default.latex) template file, rename it something memorable – like `italicquotes.tex` – and add the above code somewhere near the top. (Somewhere after the first string of `\usepackage` commands is probably best.)

Then, copy the `italicquotes.tex` to the pandoc templates folder, which I found in the following folder:

```bash
cp italicquotes.tex /usr/local/share/pandoc-1.11.1/data/templates/
```

To use this template, simply add `--template=italicquotes.tex` when you call `pandoc`:

```bash
pandoc -N --template=italicquotes.tex response.txt -o response.pdf
```

Or, with fancy fonts:

```bash
pandoc -N --template=italicquotes.tex \
          --variable mainfont=Georgia \
          --variable sansfont=Arial \
          --variable fontsize=12pt \
          response.txt --latex-engine=xelatex -o response.pdf
```
