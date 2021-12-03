---
title: Questions, answers, and reprexes
author: Garrick Aden-Buie
date: '2021-03-16'
slug: questions-answers-and-reprexes
categories:
  - Blog
tags:
  - Teaching
  - Learning
  - CSS
  - Programming
  - reprex
description: A "CSS Battle" YouTube video made me ponder metacognition in programming. I had questions, reprex gave me answers.
# images: [ /path/to/image.png ]
source_link: 'https://github.com/gadenbuie/garrickadenbuie-com/blob/main/content/blog/2021/2021-03-16-questions-answers-and-reprexes.Rmarkdown'
editor_options:
  chunk_output_type: console
---

<div class="lead">

I stumbled into a niche YouTube genre:
Web Development online instructors (a.k.a *content creators*)
challenge each other to “CSS Battles.”

Turns out they are fascinating videos
where experienced programmers talk and fumble
their way through their coding.

As they talked through their thought processes,
I thought about the questions we ask
when our code goes wrong
and the answers we get when we reprex.

</div>

## CSS Battle with The CSS King

<figure>
{{% youtube "-QgJgZCJvo4" %}}
<caption>
<em>I challenged The CSS King to a CSS Battle</em> on
<a href="https://youtu.be/-QgJgZCJvo4" target="_blank" rel="noopener">YouTube</a>
</caption>
</figure>

I’ve thought a lot about this video since I watched it.
[Kyle Cook](https://blog.webdevsimplified.com/) and [Kevin Powell](https://www.kevinpowell.co/) both make great YouTube videos
teaching CSS and front-end web development concepts.

In this video, they simultaneously tackle three [CSS challenges](https://cssbattle.dev)
with a time limit of 10 minutes for each.
Both Kyle and Kevin talk through their process
and the video switches between the two of them
as they build up their solutions.

## Writing code is testing your theory of the solution

This is the part I loved:
beyond confirming that writing CSS involves a lot of
*let’s just try `width: 100%`* and
*I guess it should be 90px… 85px… 75px…*,
it was awesome to see how much of solving a complicated programming problem
is about having a vague idea of the structure of a final solution
and working toward that goal with many iterations with tiny, confirmatory tests.

<img src="https://cssbattle.dev/targets/34@2x.png" alt="CSS Battle Christmas tree challenge: three stacked triangles" width="33%" align="right" style="padding-left: 1em" />

In the first challenge, they made a cute little CSS Christmas tree.
There are some tricks in here that you just need to know —
for example, you can [make triangles with CSS](https://css-tricks.com/snippets/css/css-triangle/)
using a trick with borders —
but neither Kyle nor Kevin start out knowing the exact final answer.
Kevin narrates:

> I have to remember how to do an up arrow… Let’s just try… Is it like this? …
> Ah! I did get it right! Awesome, awesome.
> I don’t use this trick too often and I always forget how it works.

## Two roads diverged in a wood, and I…

Kyle starts off with the border trick,
and actually explains how it works in detail,
but pretty quickly his solution goes a little off the rails.
This is where I found myself fascinated.

At this point, both programmers are on the right track.
The video flips back-and-forth between the two and you can see that Kyle *has the right idea*.
But he starts second guessing his approach.
He questions whether or not he’s using the right trick
and he almost starts over from scratch.

Where it seemed like both programmers were headed for the same solution,
Kyle’s questioning leads him to reverse course and try a radically different approach.
Kevin, on the other hand, keeps on pushing forward.
A small difference in the path chosen leads to two very different outcomes.
In the end Kyle ends up coding in circles,
trying to resolve problems that arose
because of the circuitous path he chose
when he gave up on his original direction.

## Writing code is thinking about code

In my experience, writing actual code is an improbably small part of *programming*.
I love the feeling of flow
when I connect with a problem,
when I’m mostly certain about how I’m going to solve it,
when I can just write code — and not boiler plate, I mean real code.
But day-to-day, I think about, read about, muse about, wonder about, and puzzle over
much more code than I actually write.

<div class="ba shadow pa4 bw1 relative">

<svg xmlns="http://www.w3.org/2000/svg" class="sidenote-pair-programmers absolute top-2 right-1" viewBox="0 0 512 512">
<title>
ionicons-v5-j
</title>
<path d="M336,256c-20.56,0-40.44-9.18-56-25.84-15.13-16.25-24.37-37.92-26-61-1.74-24.62,5.77-47.26,21.14-63.76S312,80,336,80c23.83,0,45.38,9.06,60.7,25.52,15.47,16.62,23,39.22,21.26,63.63h0c-1.67,23.11-10.9,44.77-26,61C376.44,246.82,356.57,256,336,256Zm66-88h0Z"/><path d="M467.83,432H204.18a27.71,27.71,0,0,1-22-10.67,30.22,30.22,0,0,1-5.26-25.79c8.42-33.81,29.28-61.85,60.32-81.08C264.79,297.4,299.86,288,336,288c36.85,0,71,9,98.71,26.05,31.11,19.13,52,47.33,60.38,81.55a30.27,30.27,0,0,1-5.32,25.78A27.68,27.68,0,0,1,467.83,432Z"/><path d="M147,260c-35.19,0-66.13-32.72-69-72.93C76.58,166.47,83,147.42,96,133.45,108.86,119.62,127,112,147,112s38,7.66,50.93,21.57c13.1,14.08,19.5,33.09,18,53.52C213.06,227.29,182.13,260,147,260Z"/><path d="M212.66,291.45c-17.59-8.6-40.42-12.9-65.65-12.9-29.46,0-58.07,7.68-80.57,21.62C40.93,316,23.77,339.05,16.84,366.88a27.39,27.39,0,0,0,4.79,23.36A25.32,25.32,0,0,0,41.72,400h111a8,8,0,0,0,7.87-6.57c.11-.63.25-1.26.41-1.88,8.48-34.06,28.35-62.84,57.71-83.82a8,8,0,0,0-.63-13.39C216.51,293.42,214.71,292.45,212.66,291.45Z"/>
</svg>
<style>.sidenote-pair-programmers { fill: var(--pink-50); }</style>
<p class="f3 avenir b mt1">
Sidenote: Pair Programming
</p>

As a side note,
I find that the flow is easier to find when I’m [pair programming](https://martinfowler.com/articles/on-pair-programming.html).
It seems paradoxical,
but having another set of eyes and all the extra cycles of the other person watching,
always helps me stay on track whenever I would normally get lost in the frustration of a diversion.

Pre-pandemic, I always found it hard to convince others to join in pair-programming.
But video conferencing makes it easier than ever to look over someone shoulder while they’re programming.
It also makes it easier to switch roles while pairing,
especially when you’re the navigator (the one watching/guiding)
and need to step in to the driver role —
*here, let me control your screen for a minute so I can show you…*

</div>

<style type="text/css">
.sidenote {
  position: relative;
  border: 2px solid var(--text-lightest);
  border-radius: 5px;
  padding: 1.5em;
  box-shadow: 10px 11px 0px 0px var(--text-lightest);
}
.sidenote > .heading {
  font-size: 1.25em;
  font-weight: bold;
}
.sidenote > :last-child {
  margin-bottom: 0;
}
.sidenote-pair-programmers {
  width: 50px;
  height: 50px;
  float: right;
  margin-top: -1em;
  margin-left: 1em;
  margin-right: 1em;
}
.sidenote-pair-programmers path {
  fill: var(--accent);
}
.figure-left-third {
  float: left;
  width: 33%;
  min-width: 200px;
  padding: 0;
  margin: 0;
  margin-right: 1.5em;
}
.figure-left-third figcaption {
  font-size: 0.8em;
}
</style>

## Questioning your questions

The art of question asking while programming
is often about understanding where to put your mental break points.
Not when to take a break from staring at your screen
(that’s also an important skill, especially when you start flailing[^1]),
but points at which you pause and evaluate
whether the code in front of you is doing what you think it should be doing.
In your binary search of the problem space —
will my broken code work if I poke this over here —
choosing where to draw the boxes around your code
is a skill that comes with time and experience.

<figure class="figure-left-third">
<img src="/images/2020/pexels-karolina-grabowska-4219520.jpg" alt="Two hands, one holding a pencil and the other holding a right-angled ruler, preparing to draw a line." />
<figcaption>
Photo by <a href="https://www.pexels.com/@karolina-grabowska?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels">Karolina Grabowska</a>
</figcaption>
</figure>

Sometimes, it’s made harder by experience.
Is this bug I’m working on broken because of a local mistake,
or is it broken because I’ve installed the latest version
of three of this package’s dependencies from GitHub?
Is it because I’m using the latest preview version of my IDE?
Or is it because I was working on another feature
for a package called by this package
and I’ve installed my locally dev version of *that* package
and *this* package is unhappy about that?

With experience I’ve gotten better at looking at a problem,
drawing a dotted line around a section of code,
and finding a way to test whether the bug is inside or outside that line.
But I can just as easily get distracted by a false positive
and spend too much time testing things that are totally unrelated to the
actual problem that I was trying to fix.

One of the hardest parts of learning how to program
is learning about how to draw these invisible lines.
When everything is new,
it’s hard to know where to look when something doesn’t work.
It’s easy to think of questions that lead you further from the truth
or that lead to non-local jumps in logic:
rather than differentiating between two possibilities A or B,
a beginner will jump from *A* doesn’t work
so the problem must be possibility *K*.

One of the biggest differentiators of experienced programmers from novices
is their ability for metacognitive programming.
They don’t just think about code
in the sense of remembering a few magical commands,
but they have a self-awareness of *how* they think about code.
With experience, programmers move more quickly from
*what if I try this* to
*what could be going on here and how can I test it?*

Not that we don’t resort or fall into flailing.
I can’t tell you how many times I get in a fight with my code just before lunch,
while having the awareness to say to myself
*this will be easier if I take a break and eat some food*,
only to hear the voice on the other shoulder shout
**keep going, you’re so close, just try this *one last thing*.**

## A reprex is the answer

How do you learn and practice the critical skill of asking your code questions?
With [a reprex](https://reprex.tidyverse.org).

A reprex is a small, reproducible example.
Typically, it’s a small little bit of code with a tiny bug.
It’s reproducible,
meaning that it’s designed to work anywhere for anyone,
or at least to work with the minimal number of dependencies.
It doesn’t have to be buggy code,
it can just be a tiny example.

And it’s a very powerful technique.

On the one hand,
a reproducible example makes it easier to get help
by making it easier for people to help you.
For a great introduction to reprexes from this angle,
you should definitely watch [Sharla Gelfand](https://www.sharlagelfand.com/)’s talk
*[make a reprex… please](https://youtu.be/G5Nm-GpmrLw?t=60)*.

On the other hand,
when you create a reprex
you’re practicing the art and science of asking questions of your code.
At every iteration you ask yourself:
is this part here essential?
Is this package really required?
Do I need this much data to make my example reproducible,
or can I get to the same place with a smaller data set?
Helpfully, you get immediate feedback:
if you take out too much,
your example doesn’t do *the thing* anymore.
This skill of editing and question asking is critical —
and it’s why the process of creating a reprex
so often leads to a discovery of a solution.

You don’t always have to start with a large problem.
It can be just as valuable to create a toy problem to play with
as you’re learning a new concept or a programming method.
It’s easier to tinker and explore when it’s small,
just like it’s easier to be confident you understand
what the code or method you’re learning are *actually doing*
when that’s the focus of your code.

So, the next time you’re flailing, stop and make a reprex.
The next time you’re learning a new concept, stop and make a reprex.
And the next time you’re teaching beginners how to program,
feel free to teach them how to stop and make a reprex[^2].

[^1]: *flailing* is a technical term. If you’re trying many things but you don’t have the feeling of getting anywhere, then you’re flailing. You’ll know you aren’t flailing any more when you have a feeling of getting somewhere even when your ideas aren’t panning out — because they’re at least telling you what *won’t work.*

[^2]: Seriously, teach [reprex](https://reprex.tidyverse.org) early. You don’t have to get into the weeds about environments or file paths or other technical details. Learning to program *is* learning how to understand code; they’ll either learn how to approach problematic code in a systematic way with a reprex, or they’ll learn how to debug their own code in the wild with fewer guard rails and tools.
