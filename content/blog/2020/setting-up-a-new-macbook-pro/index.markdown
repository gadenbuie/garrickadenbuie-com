---
title: Setting up a new MacBook Pro
author: Garrick Aden-Buie
date: '2020-12-01'
categories:
  - Blog
tags:
  - R
  - Tips
  - Programming
  - Tricks
  - Twitter
description: A big post with all the Mac apps and command line utilities I use everyday.
# twitterImage: /path/to/image.png
rmd_source: 'https://github.com/gadenbuie/garrickadenbuie-com/blob/main/content/blog/2020/setting-up-a-new-macbook-pro/index.Rmd'
keywords: rstats
editor_options:
  chunk_output_type: console
---
<script src="{{< blogdown/postref >}}index_files/clipboard-2.0.6/clipboard.min.js"></script>
<link href="{{< blogdown/postref >}}index_files/xaringanExtra-clipboard-0.2.6/xaringanExtra-clipboard.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/xaringanExtra-clipboard-0.2.6/xaringanExtra-clipboard.js"></script>
<script>window.xaringanExtraClipboard(null, {"button":"Copy Code","success":"Copied!","error":"Press Ctrl+C to Copy"})</script>

<!-- Links -->
[pak]: https://pak.r-lib.org
[tidyverse]: https://tidyverse.org










<style type="text/css">
.tweet-timestamp {
  display: block;
  font-size: 0.9em;
}
.tweet-timestamp a .tweet-timestamp__text {
  color: var(--text-light);
}
.tweet-timestamp a:hover .tweet-timestamp__text {
  color: var(--text-mild);
}
.tweet-timestamp .tweet-link > i {
	display: inline-block;
	padding-right: 1.5em;
}
</style>

::: lead

I had to set up my new work computer today and rather than just slog away at it, I thought I would live tweet the process.
Honestly, there's still a lot of config left to do, but the [tweet thread](https://twitter.com/grrrck/status/1333804309272621060) does a good job organizing the apps and software I use daily.
[My install notes](https://gist.github.com/gadenbuie/a14cab3d075901d8b25cbaf9e1f1fa7d) are another good summary.

I used [rtweet](https://docs.ropensci.org/rtweet) and [tweetrmd](https://github.com/gadenbuie/tweetrmd) to unroll the twitter thread.

- [Upgrade to Big Sur](#upgrade-to-big-sur)
- [Critical First Steps](#critical-first-steps)
- [Install R and Friends](#install-r-and-friends)
- [Utility Mac Apps](#utility-mac-apps)
- [Command Line Utilities](#command-line-utilities)
- [Fish Shell](#fish-shell)

:::


::: thread



## Upgrade to Big Sur

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333804309272621060" title="2020-12-01 16:05:02" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">11:05am</span></a></span>I've got a new work laptop! I'm going to try to track my setup
process and the software and tools I install in this thread

![](img/EoKe400UcAY9wTb.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333804487148855300" title="2020-12-01 16:05:45" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">11:05am</span></a></span>Step #1, wait...

![](img/EoKgEd0VQAImTS-.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333805092152123394" title="2020-12-01 16:08:09" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">11:08am</span></a></span>Oh wow, I really jumped the gun on this thread

![](img/EoKgpSgXMAARLQc.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333807464907681794" title="2020-12-01 16:17:35" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">11:17am</span></a></span>in the mean time, I guess I'll tidy the dock

![](img/EoKixqNXYAEtjZC.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333810013362675712" title="2020-12-01 16:27:42" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">11:27am</span></a></span>Here's something I do on every machine I use: turn Caps Lock into
Escape. It's only annoying when I write SQL but it saves so much
finger and hand movement. Essential for vim mode.

![](img/EoKlAg2XUAIQutF.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333813719827177473" title="2020-12-01 16:42:26" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">11:42am</span></a></span>Looking for other things I can tweak while I wait. Hot corners?

↗️ Mission Control  
↘️ Desktop  
↙️ Application Windows  
↖️ Put Display to Sleep (and add require password immediately)  

![](img/EoKob5mWMAA8fCm.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333815050163904512" title="2020-12-01 16:47:43" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">11:47am</span></a></span>Okay, Big Sur Install Time has arrived. After these messages, we'll
be right back.

🍎 1 minute remaining...  
🍎 About 17 minutes remaining...  
🍎 About 26 minutes remaining...  
🍎 About 9 minutes remaining...  
\*reboots\*  
🍎 (no time estimate)  

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333819394137464837" title="2020-12-01 17:04:59" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">12:04pm</span></a></span>After a reboot, all is quiet. The screen is black. I move the mouse. A
login screen! That was fast!

I login. I've entered a time loop. Tuesday starts again.

![](img/EoKtpVWWMAMuBbS.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333819947252846593" title="2020-12-01 17:07:11" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">12:07pm</span></a></span>I guess we're downloading Big Sur again. I feel like I did this
before... 

![](img/EoKuCr0XMAQHALm.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333828745573126148" title="2020-12-01 17:42:08" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">12:42pm</span></a></span>Download complete ... now this looks legit. Wish me luck!

![](img/EoK2KWYXYAAaRa_.jpg)



## Critical First Steps

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333856706858717185" title="2020-12-01 19:33:15" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">02:33pm</span></a></span>And we're back! I am... not sure how I feel about the new look of
Big Sur 

![](img/EoLPlLHXEAAMWS0.jpg)

![](img/EoLPlKhXUAAVThW.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333858714269388803" title="2020-12-01 19:41:14" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">02:41pm</span></a></span>Just in case you or I get lost, I took some notes while I was waiting
for Big Sur to install. Here's my general install
plan  
<https://gist.github.com/gadenbuie/a14cab3d075901d8b25cbaf9e1f1fa7d>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333859122517860352" title="2020-12-01 19:42:51" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">02:42pm</span></a></span>First things first I need a good terminal and iTerm2 is my
favorite  
<https://iterm2.com/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333860197551443971" title="2020-12-01 19:47:07" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">02:47pm</span></a></span>Now that I have iTerm2, I need Apple's Command Line Tools. Open up
iTerm2 and run

```
xcode-select --install
```

Hopefully this won't take long...

![](img/EoLSpefXMAEYhA_.jpg)

![](img/EoLSwHoXIAIjuwU.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333860632798633986" title="2020-12-01 19:48:51" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">02:48pm</span></a></span>That was pleasantly fast. Next up: homebrew.

Homebrew makes it easy to install software, even apps. I'm just going
to copy the install code from <https://brew.sh/> and run it

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333862564749594628" title="2020-12-01 19:56:32" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">02:56pm</span></a></span>Homebrew's ready, so let's put it to use. I use
[\@alfredapp](https://twitter.com/alfredapp) to
switch between apps, files, etc. so I'll use brew to install it:

```
brew cask install Alfred
```

`brew install <x>` usually installs command line utility `<x>`. Apps
with interfaces need "cask".  
<https://www.alfredapp.com/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333862918778200068" title="2020-12-01 19:57:56" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">02:57pm</span></a></span>If you use Alfred,
[\@hadleywickham](https://twitter.com/hadleywickham)
has an awesome tip to let Alfred find
[\@rstudio](https://twitter.com/rstudio) .Rproj
project files.  


> I\'ve documented my workflow for opening
> [\@RStudio](https://twitter.com/rstudio) projects
> (using on
> [\@alfredapp](https://twitter.com/alfredapp)) in
> this short video: <https://t.co/XvmRyGSsol>
> [#rstats](https://twitter.com/hashtag/rstats)
>
> --- Hadley Wickham (\@hadleywickham) [February 27,
> 2018](https://twitter.com/hadleywickham/status/968624630276804608)


<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333863368885739523" title="2020-12-01 19:59:43" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">02:59pm</span></a></span>And if you purchase Alfred's powerpack features,
[\@pjs_228](https://twitter.com/pjs_228) has a
collection of helpful R workflows  


> Are you an
> [\@alfredapp](https://twitter.com/alfredapp) and
> [#rstats](https://twitter.com/hashtag/rstats)
> user?\
> \
> I've created an alfred workflow for R which might be
> helpful.<https://t.co/GrsIbCqaBT>\
> \
> Feedback welcome.
>
> --- Patrick Schratz (\@pjs_228) [November 19,
> 2020](https://twitter.com/pjs_228/status/1329322637122826240)


<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333865026743128066" title="2020-12-01 20:06:19" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">03:06pm</span></a></span>After jumping through a few permission hoops to give Alfred access to
everything, we're in business.

I remap Alt + Space to Spotlight (Mac's quick finder) and make Alfred
Cmd + space. 

![](img/EoLXEfsXIAEjpbH.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333866135322849280" title="2020-12-01 20:10:43" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">03:10pm</span></a></span>Next up, my browser. I use and love Firefox on all devices and my
daily driver is the Firefox Developer Edition  
<https://www.mozilla.org/en-US/firefox/developer/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333866354336800776" title="2020-12-01 20:11:35" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">03:11pm</span></a></span>I've been informed by homebrew that

```
brew cask install <app>
```

has been deprecated in favor of

```
brew install --cask <app>
```

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333866753844195329" title="2020-12-01 20:13:10" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">03:13pm</span></a></span>After a short digression, I got Firefox to install with brew

```
brew tap homebrew/cask-version

brew install --cask firefox-developer-edition
```

![](img/EoLYvWAXMAcMrQc.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333868339869999110" title="2020-12-01 20:19:28" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">03:19pm</span></a></span>My favorite part of installing
[\@firefox](https://twitter.com/firefox): login to
Firefox Sync and all of my bookmarks, extensions, preferences, etc.
all magically appear in my new browser

![](img/EoLaApqW8AIMz3_.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333868993732620288" title="2020-12-01 20:22:04" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">03:22pm</span></a></span>Another short digression, I use these extensions every day:

- LastPass <https://lastpass.com>
- Refined Github <https://github.com/sindresorhus/refined-github>
- Dark Reader <https://darkreader.org/>
- Copy as Markdown <https://addons.mozilla.org/en-US/firefox/addon/copy-as-markdown/>



## Install R and Friends

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333870071656148995" title="2020-12-01 20:26:21" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">03:26pm</span></a></span>Okay, with the critical bits done, it's time to install
[#rstats](https://twitter.com/hashtag/rstats)!

I'm going to install both 3.6.3 and 4.0.3 (and maybe eventually
devel). Yes, you have multiple versions of R on your machine at once
(more on that in a
second)  
<https://cran.r-project.org/src/base/R-4>  
<https://cran.r-project.org/src/base/R-3>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333871027881992199" title="2020-12-01 20:30:09" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">03:30pm</span></a></span>Yikes! Those are not the links I want. How many other people click the
wrong links on the front page of <https://www.r-project.org> ?

![](img/EoLcn1hXMAMdx0A.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333871929330200580" title="2020-12-01 20:33:44" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">03:33pm</span></a></span>It takes a surprising number of clicks to get to where I can download
the macOS R binaries. I mostly just click things but I'm sure this
process is very confusing for many people. The page is loaded in an
iframe, which makes deep-linking hard: <https://cloud.r-project.org/bin/macosx/>

![](img/EoLdZTOXMAAPzAK.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333873278956482561" title="2020-12-01 20:39:06" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">03:39pm</span></a></span>I picked the signed 3.6.3 binary but I still had to go through macOS
security steps. When it doesn't open, open System Preferences >
Security and Privacy > General and then, while second-guessing
yourself, click "Open Anyway"

![](img/EoLed_sW8AIWt4n.png)

![](img/EoLee5EW8AIu--F.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333876366161416195" title="2020-12-01 20:51:22" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">03:51pm</span></a></span>Which R installs faster? It's a race (to see if I can remember my new
password) 

![](img/EoLhXQ7XcAIU4QP.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333876782689382402" title="2020-12-01 20:53:01" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">03:53pm</span></a></span>Now that I have more than one version of R installed, Bob Rudis'
RSwitch utility is essential. Easily switch between versions of R from
the menu bar!  
<https://rud.is/rswitch/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333877147950321664" title="2020-12-01 20:54:28" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">03:54pm</span></a></span>It also makes it easy to grab the latest preview version of
[\@rstudio](https://twitter.com/rstudio) which you
can also find online <https://dailies.rstudio.com/>

![](img/EoLiI5SXEAQOYw2.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333878261315735560" title="2020-12-01 20:58:54" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">03:58pm</span></a></span>My little laptop is growing up so fast

![](img/EoLjGsLW8AEYq9a.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333880440969711619" title="2020-12-01 21:07:34" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:07pm</span></a></span>Okay, I need R packages now. To get them fast, I'll install [[pak]]{.pkg},
which requires a little setup, and then I'll kick off an install of
[[tidyverse]]{.pkg}

```r
install.packages("pak", repos = "https://r-lib.github.io/p/pak/dev/")

pak::pak_setup()

pak::pkg_install("tidyverse")
```

16 seconds later 🎉

![](img/EoLlBo5W8AI6IVI.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333882737212715010" title="2020-12-01 21:16:41" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:16pm</span></a></span>Wow [[pak]]{.pkg} is fast. These packages installed in literal seconds.

Mostly just basics I know I'll want, other things to customize
[\@rstudio](https://twitter.com/rstudio)

I ran this code for both R 3.6.3 and 4.0.3

![](img/EoLmAoUXEAcefrl.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333883010136084487" title="2020-12-01 21:17:46" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:17pm</span></a></span>Like it's actually kind of fun to watch [[pak]]{.pkg} install your packages.

![](img/xKWZ1NjHU6Xqypad.jpg)



## Utility Mac Apps

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333883561364123648" title="2020-12-01 21:19:58" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:19pm</span></a></span>That's it for R, here come a bunch of utility apps for Macs. These
all make life a little easier, more productive. Fitter, happier.

These all worked on Catalina so I guess I'll find out soon if they
work for Big Sur...

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333884254011404288" title="2020-12-01 21:22:43" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:22pm</span></a></span>Flycut is a clipboard manager that adds history to your clipboard.
Copy several things from here, paste them there. Reuse old clips. I
can't even without this.  
<https://github.com/TermiT/Flycut#readme>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333884676352708608" title="2020-12-01 21:24:23" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:24pm</span></a></span>Kap records your screen, converts movies to gifs and has powered half
of this thread so far.

```
brew install --cask kap  
```
<https://getkap.co/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333885191056658438" title="2020-12-01 21:26:26" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:26pm</span></a></span>Rectangle is another absolutely essential mac app. Easily resize
windows to fill parts of the screen with many keyboard shortcuts.
Rectangle replaces Spectacle and adds snap zones.

```
brew install --cask rectangle  
```
<https://rectangleapp.com/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333885687205142531" title="2020-12-01 21:28:24" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:28pm</span></a></span>AltTab adds window previews to the window switcher. Thanks
[\@PeeltothePithy](https://twitter.com/PeeltothePithy)
for the tip!

```
brew install --cask alt-tab  
```
<https://alt-tab-macos.netlify.app/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333886100306350081" title="2020-12-01 21:30:03" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:30pm</span></a></span>KeyCastr show key presses on-screen, perfect for demonstrating cool
RStudio keyboard shortcuts

```
brew install --cask keycastr  
```
<http://github.com/keycastr/keycastr>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333886537000497153" title="2020-12-01 21:31:47" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:31pm</span></a></span>Pock puts the dock in the touchbar. I appreciate this whenever my
laptop isn't docked.  
<https://pock.dev/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333886856845516806" title="2020-12-01 21:33:03" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:33pm</span></a></span>Amphetamine keeps your laptop awake for a certain amount of time.
Useful for long running
[#rstats](https://twitter.com/hashtag/rstats)
scripts, turn on amphetamine, turn off the monitor, walk away knowing
your script is still going.  
<https://apps.apple.com/us/app/amphetamine/id937984704>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333887150388076547" title="2020-12-01 21:34:13" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:34pm</span></a></span>If you've ever wanted to open certain links in \*certain\* browsers,
Finicky can help.

```
brew install --cask finicky  
```
<https://github.com/johnste/finicky>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333887537148997634" title="2020-12-01 21:35:45" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:35pm</span></a></span>I've had enough of the default Big Sur desktop background. Luckily
there's Irvue -- an hourly wallpaper refresh using pictures from
[\@unsplash](https://twitter.com/unsplash)
<https://irvue.tumblr.com/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333887933603045383" title="2020-12-01 21:37:20" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:37pm</span></a></span>If you use, work with, or collect colors, Culr looks awesome. I
haven't used it much but I have a feeling I'll use it
frequently.  
<https://culrs.app/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333888411632103424" title="2020-12-01 21:39:14" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:39pm</span></a></span>And now that I just installed a dozen menu-bar apps, I don't want to
have to look at them all the time.

Hello dozer, a little app that hides the clutter!

```
brew install --cask dozer  
```
<https://github.com/Mortennn/Dozer>

![](img/EoLsWskXMAIz71x.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333889149192052738" title="2020-12-01 21:42:10" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:42pm</span></a></span>That's it for menu bar apps, let's move on to big apps!

![](img/EoLtG-FXEAIxWzc.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333889821165678596" title="2020-12-01 21:44:50" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:44pm</span></a></span>First up, essential work apps, slack and spotify.

Did you know you can install both with brew at the same time?

```
brew install --cask spotify slack
```

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333890263459237904" title="2020-12-01 21:46:35" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:46pm</span></a></span>I don't always use editors that aren't RStudio to edit code...

but when I do I use Visual Studio Code.

```
brew install --cask visual-studio-code  
```
<https://code.visualstudio.com/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333890648626372609" title="2020-12-01 21:48:07" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:48pm</span></a></span>There are a lot of cool things going on with R and vscode. If you want
a little intro to some good vscode extensions for web dev and more, I
put together a list for
[#js4shiny](https://twitter.com/hashtag/js4shiny)  
<https://js4shiny.com/resources/setup/extras/#visual-studio-code>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333890948900810753" title="2020-12-01 21:49:19" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:49pm</span></a></span>I recently started using
[\@NotionHQ](https://twitter.com/NotionHQ) for
collecting all of my random thoughts, outline writing, keep track of
links and more.  
<https://www.notion.so/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333891234939678720" title="2020-12-01 21:50:27" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:50pm</span></a></span>It pairs nicely with Agenda, which is an app for date-linked notes and
perfect for meeting notes.  
<https://www.agenda.com/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333891669872308228" title="2020-12-01 21:52:11" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:52pm</span></a></span>Another awesome app is Figma. Great for bits of design, testing app
layouts, drawing diagrams and a whole lot more. The desktop app is
slick.  
<https://www.figma.com/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333892067769069571" title="2020-12-01 21:53:46" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:53pm</span></a></span>My favorite app for working with big and complicated git repos is
Fork. The visual history and diff features have saved me many
times.  
<https://fork.dev/home>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333892622843252743" title="2020-12-01 21:55:58" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:55pm</span></a></span>I wasn't sure where to put Docker in the lineup, but it'll be a good
segue into command line apps.

And I always have to click around a bunch to find the download:
<https://hub.docker.com/editions/community/docker-ce-desktop-mac/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333893087815458819" title="2020-12-01 21:57:49" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">04:57pm</span></a></span>What's cooler than docker? Rocker! 👩‍🎤

The rocker project provides a ton of r-based docker images, ranging
from bare bones to ready for publication or geospatial analysis. Thank
you [\@cboettig](https://twitter.com/cboettig),
[\@eddelbuettel](https://twitter.com/eddelbuettel)
and [\@noamross](https://twitter.com/noamross) for
your awesome work!  
<https://www.rocker-project.org/>



## Command Line Utilities

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333894147716116481" title="2020-12-01 22:02:02" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:02pm</span></a></span>And now we're moving into a new category: command line apps.

I know what you're thinking, but these aren't your mother's command
line apps. Command line apps have gotten really pleasant to use
lately. They even have color! 🌈

![](img/EoLxpJbXUAMG-Jd.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333894731542253569" title="2020-12-01 22:04:21" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:04pm</span></a></span>My recent new favorite is
[\@github](https://twitter.com/github)'s command
line tool. It makes it surprisingly easy to create issues, review PRs,
and generally interact with my work on GitHub.

```
brew install gh  
```
<https://cli.github.com/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333895391033647105" title="2020-12-01 22:06:58" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:06pm</span></a></span>Speaking of git, bit is a fun CLI that smooths out some of git's
rougher edges.

```
brew install bit-git  
```
<https://github.com/chriswalz/bit>

![](img/EoLyv1ZXMAIUHbP.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333896384722972672" title="2020-12-01 22:10:55" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:10pm</span></a></span>Two more rhyming CLIs:

- bat makes it easy to see inside files
- nat makes it easy to see inside directories

```
brew install bat nat  
```
<https://github.com/sharkdp/bat>  
<https://github.com/willdoescode/nat>

![](img/EoLzEnDXYAEVSve.png)

![](img/EoLzImMW8AEexZD.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333896777293029379" title="2020-12-01 22:12:28" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:12pm</span></a></span>Oops nat needs a little more to install:

```
brew tap willdoescode/homebrew-natls

brew install natls
```

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333897393130057730" title="2020-12-01 22:14:55" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:14pm</span></a></span>I love the idea of this one. Forget how `tar` works? tldr

```
brew install tldr  
```
<https://tldr.sh/>

![](img/EoL0XYtWMAMc2th.png)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333898304980201472" title="2020-12-01 22:18:33" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:18pm</span></a></span>I can't believe how much of the stuff in this thread I've been able
to install with brew. Did you know you can use it to install fonts?

```
brew tap homebrew/cask-fonts
```

Then install fonts with

```
brew install --cask font-incosolata
```

or find fonts

```
brew search font-
```

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333898753015689219" title="2020-12-01 22:20:20" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:20pm</span></a></span>brew can even install node and then you can use npm to install even
more things!

```
brew install node  
```
<https://nodejs.dev/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333899123783835648" title="2020-12-01 22:21:48" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:21pm</span></a></span>Do you ever write JavaScript and want it to look great without doing
any extra work? StandardJS makes this happen.

```
npm install --global standard  
```
<https://standardjs.com/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333899796827004932" title="2020-12-01 22:24:28" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:24pm</span></a></span>Another fun node package and CLI that I like a lot is gitmoji

```
npm install --global gitmoji-cli
```

Semantic emoji for git commit messages! 🤪  
<https://gitmoji.carloscuesta.me/>



## Fish Shell

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333900493677080577" title="2020-12-01 22:27:15" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:27pm</span></a></span>If you hung with me this far, I hope you don't mind if I go extra
geeky and talk about shells. Terminal shells. Like, a totally new
command prompt, but one that helps finish your thoughts like
fish  
<https://fishshell.com/>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333900993080287241" title="2020-12-01 22:29:14" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:29pm</span></a></span>You can install fish from brew, and then it's a good idea to install
fisher, too. It's a plugin manager for your shell.

```
brew install fish
```

fisher install instructions: <https://github.com/jorgebucaran/fisher>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333901428591570947" title="2020-12-01 22:30:57" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:30pm</span></a></span>Then you can install plugins, like this sweet prompt theme called
tide

```
fish # to start the fish shell

fisher install IlanCosman/tide  
```
<https://github.com/IlanCosman/tide#readme>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333901922458365953" title="2020-12-01 22:32:55" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:32pm</span></a></span>tide has a sweet configuration menu that it walks you through, but of
course I forgot that to make cool prompts like this work you need to
install a Nerd Font  
<https://github.com/ryanoasis/nerd-fonts>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333903259254353923" title="2020-12-01 22:38:14" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:38pm</span></a></span>I'll just pick one to make it work

```
brew install --cask font-hasklug-nerd-font
```

and then configure iTerm to use "Hasklug Nerd"...

Boom, fancy prompt with icons!

![](img/EoL53KyXIAc6_e1.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333903809337323520" title="2020-12-01 22:40:25" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:40pm</span></a></span>One more fish thing... there's a utility called "z"

fisher install jethrokuan/z

z uses a list of frequent and recent directories to make it easy to
move around your computer. After using it a bit you can type `z doc`
and jump to `~/Documents`  
<https://github.com/jethrokuan/z>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333904861168103427" title="2020-12-01 22:44:36" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:44pm</span></a></span>Final fish point. The docs are awesome and there are some great
extensions out
there.  
<https://fishshell.com/docs/current/index.html>  
<https://github.com/jorgebucaran/awesome.fish>

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333905318217179145" title="2020-12-01 22:46:25" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:46pm</span></a></span>Okay, at this point, my machine should be ready to use! And if not,
it's time for dinner anyway.

Thanks for reading! Let me know if I missed your favorite app anywhere
😉

So long and thanks for all the fish!

![](img/EoL70IgW8AME7Fo.jpg)

<span class="tweet-timestamp"><a class="tweet-link" href="https://twitter.com/grrrck/status/1333907891049402371" title="2020-12-01 22:56:38" target="_blank" rel="noopener noreferrer"><i class="fab fa-twitter fa-fw"></i><span class="tweet-timestamp__text">05:56pm</span></a></span>omg I still have so many things to log into and configure

![](img/EoL-JozXcAIWuj6.jpg)

:::
