---
title: 'Trump Tweet Time: An 8-bit "Executive Time" Game'
author: Garrick Aden-Buie
date: '2019-02-09'
slug: trump-tweet-time
aliases: /blog/2019/02/09/trump-tweet-time
categories:
  - Blog
tags:
  - R
  - rtweet
  - Shiny
  - Apps
  - Game
---

[axios-article]: https://www.axios.com/donald-trump-private-schedules-leak-executive-time-34e67fbb-3af6-48df-aefb-52e02c334255.html
[data-world]: https://data.world/firsthara/presidential-time
[axios-spreadsheet]: https://docs.google.com/spreadsheets/d/1oITCuVsYdhNXtY7GElLelsrbjRRIPJ1ce-_v-8J1X_A/edit#gid=0
[ness-css]: https://nostalgic-css.github.io/NES.css/
[nessy]: https://github.com/ColinFay/nessy
[app]: https://apps.garrickadenbuie.com/trump-tweet-time
[repo]: https://github.com/gadenbuie/trump-tweet-time
[rtweet]: https://rtweet.info

## Trump's Excutive Time

Last week, Donald Trump's White House schedule was leaked and [published online by Axios][axios-article].
One highlight from the released documents is the large amount of unstructured "Executive Time" that appears on his schedule.

The #rstats Twitter community immediately began to wonder what interesting anaylses could be done in comparing Trump's schedule to the tweets he sent out.

{{<tweet 1092518004573851648>}}

Axios helpfully released [a Google Spreadsheet][axios-spreadsheet] to accompany the PDF version of the schedule, and a curated version has also been posted on [Data World][data-world]. Jonathan Sidi also built a [cool Shiny app](https://github.com/yonicd/potus_public_schedule) for viewing Trumps tweets on a time line over his schedule.

I started to pull together an analysis for an upcoming blog post, and here's a little sneak peak.

<blockquote class="twitter-tweet" data-conversation="none"><p lang="en" dir="ltr">Here&#39;s something simple, using tweets from the <a href="https://twitter.com/hashtag/trumptwitterarchive?src=hash&amp;ref_src=twsrc%5Etfw">#trumptwitterarchive</a> so limited to midterms to end of 2018. <a href="https://t.co/CdRxUNwyq2">pic.twitter.com/CdRxUNwyq2</a></p>&mdash; Garrick Aden-Buie (@grrrck) <a href="https://twitter.com/grrrck/status/1092538573730000899?ref_src=twsrc%5Etfw">February 4, 2019</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

## An 8-bit Distraction

But then I got distracted.
Colin Fay recently released a port of [ness-css] for Shiny called [nessy], and it looks awesome.
I just needed a good reason to create an awesome 8-bit retro Shiny app.

The idea came to me during the analysis.
Can you tell what Trump is doing (or is supposed to be doing) by the tweets he sends?
Why not put your intuition to the test?

## Trump Tweet Time

So I built a simple Shiny game called [Trump Tweet Time][app] that you can [play right now][app].
An 8-bit Trump shouts a tweet at you and you have to guess what was on his schedule while he was tweeting.

<div>
<a href="/images/2019/trump-tweet-time-01.png" data-featherlight="image">
<img src="/images/2019/trump-tweet-time-01.png" style="max-height: 300px; margin:auto; display:inline;">
</a>

<a href="/images/2019/trump-tweet-time-02.png" data-featherlight="image">
<img src="/images/2019/trump-tweet-time-02.png" style="max-height: 300px; margin:auto; display:inline;">
</a>
</div>

Thanks to Colin Fay for [nessy] and Mike Kearney for [rtweet]!
Your packages made this fun and easy.

Now go [enjoy some executive time][app]!
