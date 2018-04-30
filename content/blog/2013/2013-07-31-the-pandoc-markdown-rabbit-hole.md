---
date: 2013-07-31T17:45:36+00:00
slug: the-pandoc-markdown-rabbit-hole
title: The Pandoc Markdown rabbit hole
categories:
- Blog
tags:
- Apps
- Markdown
- Productivity
- Workflow
- Writing
---

I've recently taken a hard dive into the deeply fragmented world of plaintext formatted markup languages. I currently have about 90 tabs open, each a winding, twisting trail leading through the world of [Markdown](http://daringfireball.net/projects/markdown/), [Multimarkdown](fletcherpenney.net/multimarkdown/‎), [Pandoc](johnmacfarlane.net/pandoc/‎), [LaTeX](http://latex-project.org), [MathML](http://w3.org/Math), [MathJax](http://mathjax.org), and the other 500 slightly tweaked variants thereof.

This post is more of a way for me to plot the easiest path to get to where I am now --- a reference for the next time I have to do this. Maybe you'll find it useful. The world of markup languages, apps, helpers, commandline tools and viewers is littered with github pages, scripts left in github gists and fixes mentioned deep in the comments of support threads.

So, in hopes that this helps somebody else out, here are the apps and languages I have settled into. Today at least. We'll see how long it all lasts.

<!-- more -->


## Why Markdown? Why not just use Word? Or LaTeX?


**Because Word makes documents that look like shit.** Because I put a lot of blood, tears and sweat into what I write and I've seen too many hours lost to Word documents corrupted by one equation too many. Because [Cambria Math](http://en.wikipedia.org/wiki/Cambria_(typeface)) makes equations that just _look bad_. Math is beautiful; I want a serious looking math font. Because [you cannot change the default math font in Word](http://answers.microsoft.com/en-us/mac/forum/macoffice2011-macword/installing-math-fonts/301abc3b-d132-45c7-8409-99201dce1572) (at least on Macs). Because writing should be easier.

On the flip side, when I write in LaTeX, I spend **way** too much time trying to figure out what commands will format text the way I want. Sure, the math is pretty and as long as I stick to the basic document classes things tend to look good. But the structure of Markdown is just so much easier that it gets out of the way of what I want to say. When you need the power of LaTeX, then it's incredible. But mostly when I write in LaTeX I can't help but constantly think of _what could be_.


## What I'm looking for


So now that I know what I don't want, here's the short list of what I do want. Note that these intersect with the latest discussions about [scholarly markdown](http://blog.martinfenner.org/2013/06/17/what-is-scholarly-markdown/).

* Plays well with math
* Can handle citations (or not mess them up too bad)
* Tables are a plus
* Footnotes etc are cool, but not necessary
* Ports nicely to LaTeX, HTML, PDF and docx

That last one is huge. I once spent ~24 hours converting a paper written in Word to LaTeX because the equations were crashing Word and corrupting the file. Only to find out two weeks later that the funding agency **only accepted .docx formats**. Not funny.


## What I'm using now

Let's follow the writing flow.

1. Create the empty .mmd file somewhere where you want the file to be.

2. Text is written in plain text editor, preferably something that can highlight Markdown syntax. I'm using [TextWrangler](http://www.barebones.com/products/textwrangler/), but this choice is fluid.

3. Text is written in [Pandoc extended markdown](http://johnmacfarlane.net/pandoc/README.html). Pandoc markdown lets you write LaTeX, and the benefits of being able to easily dump into .pdf, .docx, .tex, and .justaboutanything far outweigh the [missing MultiMarkdown features](https://github.com/jgm/pandoc/wiki/Pandoc-vs-Multimarkdown#features-in-mmd-but-not-pandoc).

4. As I write, I use the [Marked.app](http://markedapp.com) to preview the document every time I hit `⌘+s`. But Marked doesn't render Pandoc extended markdown. Luckily there's a workaround that I'll talk about below.

5. Final versions can be turned into the right format using the pandoc command line. I haven't learned the ins-and-outs of this yet, but the [Pandoc demo page](http://johnmacfarlane.net/pandoc/demos.html) has cut-and-paste commands to do basically anything you can think of, at least in a basic version.


This is as far as I've needed to go to date. There's a lot more to learn, but this should be enough to get anybody started.


### What's left to learn

1. Citations
    * I have a master .bib file for my citations so I can use any citekey from my library and know that they'll show up as long as I point pandoc to my bibtex file. That can be done using the following flag:`--bibliography=/Users/.../Documents/PapersLibraryFull.bib`
    * Download [citation styles from zotero.org](http://zotero.org/styles) and save them somewhere safe. I've created a folder in my home directory `~/.pandoc` for storing these things, and I put my .csl files in `~/.pandoc/csl`.To specify the citation style, use the `--csl` flag:`--csl /Users/.../.pandoc/csl/ieee-with-url.csl`
    * It'd be nice if the citation were inserted as a link to the full reference in the references section. This may be possible and I just haven't figured it out yet.

2. Formatting
    * I know it's possible to make very nice looking documents with pandoc templates. I just don't know how to do this yet.

3. Evernote
    * I also need to figure out the best way to write text in this way and import into Evernote.

## Pandoc + Marked.app

Big thanks go to [kjhealy](https://github.com/kjhealy) for posting [this shell script (and templates)](https://github.com/kjhealy/pandoc-templates) to use Pandoc to render HTML in [Marked.app](http://markedapp.com).

While I haven't figured out how to use the [pandoc templates](https://github.com/kjhealy/pandoc-templates/tree/master/templates) he has developed, the shell script is phenomenal and works very well within Marked. I did make some changes to point pandoc to my Papers library bibtex file and to specify the citation style in advance.
	
1. [Download and unzip the pandoc-templates package](https://github.com/kjhealy/pandoc-templates/archive/master.zip).

2. Open the preferences panel in Marked, and under the **Styles** tab add the .css files included in kjhealy's package.

3. Then, copy `panmarked.sh` somewhere central, like your home folder and open it in your favorite text editor.

4. Change the bibliography flag to point at the right .bib file.

5. Add the `--csl` flag I mentioned above with the correct citation style.

6. Save the edited file.

7. In the **Behavior** tab, enable _Custom Markdown Processor_ and enter the full path to your edited `panmarked.sh` file.

8. Click save.

9. Enjoy beautifully rendered Pandoc markdown.


You can then edit `panmarked.sh` anytime to change the flags or arguments. You could also in theory copy the arguments into the Args box in the Marked app preference pane, but that box is small. Plus, it would have taken my way too long to figure that out from scratch, so big thanks again to kjhealy.
