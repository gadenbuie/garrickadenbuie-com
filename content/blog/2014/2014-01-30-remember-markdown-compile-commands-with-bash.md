---
title: "Remember markdown compile commands with bash"
date: 2014-01-30T18:32:00+00:00
slug: remember-markdown-compile-commands-with-bash
aliases: /blog/2014/01/30/remember-markdown-compile-commands-with-bash
categories: [Blog]
tags: [Scripts, Tricks, pandoc, Markdown]
---

I write everything in [markdown][] and use [pandoc][] nearly daily.
It's fast, easy, powerful and highly customizable.
It handles math like a pro, and the recent addition of YAML headers makes it easier than ever to write and compile well-formatted documents that I can easily send to the web, print, or email to collaborators still stuck in Word.

Because pandoc separates form from content, reformatting citations, for example is as simple as changing the command from `pandoc ... --csl=bad_style.csl` to `pandoc ... --csl=good_style.csl`.
Changing templates and fonts and bibliography files are just as easy.

What's hard is remembering exactly what series of commands I used to compile a document when I come back to it to make changes a week or even a few days later.

Matt Might recently posted [an excellent guide to using Bash](http://matt.might.net/articles/bash-by-example/), the Unix scripting and terminal language.
Bash can be odd, but it's certainly powerful.
In fact, I use it frequently to outsource my memory and only really use the first 1% of what he teaches in his blog post.

#### The basic idea is this: *set it and forget it*.

<!-- more -->
When I'm working on a paper, I simply create a bash script with the commands I use to compile the markdown, and instead of remembering which flags I used the script does the remembering for me.
I also tend to throw an extra `rsync` in there as well.
That way anytime I compile a new version, I push to a backup as well[^1].
If you're using [git][], then the script has the added benefit of keeping track of the pandoc commands used to compile the document at each particular version.

[^1]: Usually only when the working directory is not in my Dropbox folder. And also separately from any git repos.

To create the bash script, create a file with `#!/bin/bash` at the top of the file. On the next line write out the pandoc command and flags that you would run. You can specify the file name in the script, or you can pass the filename as an argument to the bash script by placing a `$1` (or `$2` or so on) where the filename should appear.

Then, change the permissions to make it executable

```bash
$ chmod u+x scriptname
```

and run the file using

```bash
$ ./scriptname
```

A typical script to compile markdown to collaborator-friendly Word format might look like this:

```bash
#!/bin/bash
pandoc $1.md -o $1.docx --bibliography=/path/to/library.bib --csl /path/to/citation_style.csl

# Don't forget to backup!
rsync -avl --stats ./ ~/Dropbox/Backup/paper/ --exclude '.git'
```

To run this, I simply type `./compilePaper2docx paper_name` and it compiles -- and syncs with my backup folder!


## It gets better...

Another neat trick I picked up from [this StackOverflow answer](http://stackoverflow.com/a/12152669) allows me to automate away all the typing out of extensions. With one additional line, the script below will strip the extension from the first argument, and add the second argument as the output extension. When combined with pandoc, this automatically sets the output type.

To compile `04-CHEM101-HW-BlahBlahBlah.markdown` into PDF, simply run your compile script like this `./mycompile.sh 04-CHEM101-HW-BlahBlahBlah.markdown pdf`. To compile again into Word format, just delete `pdf` and replace with `docx`.

I am possibly too excited about this, but if you have any number of arguments in your pandoc script scrolling back through the lines of arguments is one more time suck you can avoid with a tiny bit of bash scripting. Love it.

```bash
#!/bin/bash
# input is ./script <input file> <output extension>
name=`echo $1 | cut -f1 -d'.'`
pandoc $1 -o $name.$2 --bibliography=/path/to/library.bib --csl /path/to/citation_style.csl
```

[markdown]: http://daringfireball.net/projects/markdown/‎
[pandoc]: http://johnmacfarlane.net/pandoc
[git]: http://git-scm.com/‎