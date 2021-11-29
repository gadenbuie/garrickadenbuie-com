---
title: Pull Request Flow with usethis
author: Garrick Aden-Buie
date: '2021-10-07'
slug: pull-request-flow-usethis
categories:
  - Blog
tags:
  - R
  - usethis
  - Pull Requests
  - Workflow
description: Choose your own adventure and get in the 'usethis' pull request flow with this flow chart.
images:
  - /blog/pull-request-flow-usethis/usethis-pr-flow-social.jpg
rmd_source: 'https://github.com/gadenbuie/garrickadenbuie-com/tree/main/content/blog/2021/pull-request-flow-usethis/index.Rmd'
keywords: rstats
head_custom: |
  <link href="usethis-adventure.css" rel="stylesheet">
  <script src="https://unpkg.com/smoothscroll-polyfill@0.4.4/dist/smoothscroll.min.js" integrity="sha384-EYn4rWu1DHvYD0sSSSbMEtXQmMl58CFJd897806+RT1jJVYbhuZlZMN6yG9nCyFa" crossorigin="anonymous"></script>
editor_options:
  chunk_output_type: console
---

<div class="figure">

<a href="usethis-pr-flow-medium.jpg" data-featherlight="image">
<img src="usethis-pr-flow-medium.jpg" alt="A flow chart for the pull request functions in the usethis R package.">
</a>
<p class="caption">
A `usethis` pull request helper function flow diagram. [Download the image](#download) or read a [text version of the flow chart](flowchart/). ([CC BY](http://creativecommons.org/licenses/by/4.0/))
</p>

</div>

## Introduction

The <span class="pkg">[usethis](https://usethis.r-lib.org)</span> package is full of incredibly helpful functions
that make life as an R developer easier.
A lot of the package’s functions target R package maintainers,
but there’s a small cluster of functions that are life changing
for anyone who uses `git` or collaborates with others via GitHub[^1].

These pull request helpers all start with the `pr_` prefix,
but I initially found them a little confusing to use
since they’re each designed to be called in a specific context —
for example, when you have local work that isn’t associated with a PR
or when a PR exists but you don’t have the work locally on your computer.

Once I wrapped my head around the functions, though,
using them has utterly transformed my day-to-day workflow.
I can move in and out of collaborative work seamlessly.
The flow chart above is my personal mental model of this cluster of functions
and I hope it helps you make sense of them, too.

There are other great resources available in the <span class="pkg">usethis</span> documentation.
Beyond the [function documentation](https://usethis.r-lib.org/reference/pull-requests.html),
there’s also the great [*Pull request helpers* article](https://usethis.r-lib.org/articles/articles/pr-functions.html).
That article walks through a pull request
from the perspective of a contributor
and a package maintainer.

In this blog post, however,
you get to play both roles and choose your own adventure!

## Choose your own pull request adventure

Welcome to this choose-your-own-adventure blog post.
<span id="instructions">You don’t need to read this one from top to bottom.
Instead, jumping around is encouraged!</span>

Look for the <i class="fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> icon.
It tells you that it’s time for you make a choice.
But don’t worry, there’s no wrong choice:
if you take a wrong turn
you can always use your browser’s <i class="fas fa-arrow-alt-circle-left" aria-hidden="true" title="Back"></i><span class="sr-only">back</span> button
to retrace your steps.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Ready to get started?

<ul id="intro-options">
<li>
<p>
Yes, [I’m ready to go](#get-started)!
</p>
</li>
</ul>

</div>

##

<div id="story" aria-live="polite" aria-relevant="additions">

</div>

## Prep work

### Let’s get started

You open your project in RStudio (or the editor of your choice).
You make a note to yourself to come up with a better name for your package —
for now you’re calling it <span class="pkg">acme</span>
because it’s mostly a collection of random functions you’ve written.

Anyway, you’re thankful that you closed all of your open files the last time you were working,
but now the empty console beckons.
You’re ready to do some work.

Where do you begin? With <span class="pkg">[usethis](https://usethis.r-lib.org)</span> of course.

``` r
library(usethis)
```

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> That was easy! [Lets do some work now.](#start)

</div>

### What’s next?

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Now you face a tough decision: what do you actually do next?

-   [Start new work](#pr-init)

-   [Pick up something you were working on](#pr-resume)

-   [Review or collaborate with someone else’s work](#pr-fetch-review)

-   [Clean up after a PR that’s been merged](#pr-finish-start)

</div>

### Start new work

Time to start something new.
You scan your project board, issues list, JIRA tickets, slack messages, emails, and post-it notes
and finally settle on something to work on.
Your task: add an example to the documentation for a function you’ve been working on.

You want to start your work in a new branch,
so you call `pr_init()`,
giving it the name of your new branch.

``` r
pr_init("add-example")
```

    ✓ Setting active project to '/Users/garrick/work/acme'
    ℹ Pulling changes from 'upstream/main'
    ✓ Creating and switching to local branch 'add-example'
    ● Use `pr_push()` to create PR.

The console output reminds you that <span class="pkg">usethis</span> updated your local repo
and created and switched to a new branch for you.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> You’re ready to [do some work](#do-work).

</div>

### Pick up something you were working on

You’re ready to get back to that thing you were working on.
Which was what again?
You should probably have another sip of your coffee.
You were doing some work in a branch in your local of the project…

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Do you remember the name of the branch?

-   [I don’t remember, remind me](#pr-resume-no-branch)

-   [I remember, it’s the `add-example` branch](#pr-resume-branch)

</div>

### Get to a local branch

git branches, you’ve made a few.
But which one you do you want to work in?

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Do you remember the name of the branch?

-   [I don’t remember, remind me](#pr-resume-no-branch)

-   [I remember, it’s the `add-example` branch](#pr-resume-branch)

</div>

### Choose a branch and resume working

Don’t worry, <span class="pkg">usethis</span> has your back.
Just run `pr_resume()` without any arguments
to get a list of local branches available to you.
`pr_resume()` helpfully sorts the branches by recency of work
and tells you if any of the branches are related to pull requests.

``` r
pr_resume()
```

    ℹ No branch specified ... looking up local branches and associated PRs
    Which branch do you want to checkout? (0 to exit)

    1:         add-example --> #11 ('@gadenbuie'): Add an example
    2: feature-exploration

    Selection: 1
    ✓ Switching to branch 'add-example'
    ✓ Pulling from 'origin/add-example'
    • Use `pr_push()` to create or update PR.

We picked option `1` to keep working in our `add-example` branch.
Notice that, since `add-example` is related to PR `#11`,
`pr_resume()` also did you the extra favor of
making sure that your local copy is up-to-date.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Rock and roll, you’re ready to [get back to work](#do-work-yours).

</div>

### Get back to the branch

Look at you, smarty pants.
You remember your git branch names!
I’m proud of you.

Good news,
`pr_resume()` can switch to the `"add-example"` branch for you
and it also makes sure that your local copy is up-to-date!

``` r
pr_resume("add-example")
```

    ✓ Switching to branch 'add-example'
    ✓ Pulling from 'origin/add-example'
    • Use `pr_push()` to create or update PR.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Sweat deal! Okay, you’re ready to [keep on working](#do-work-yours).

</div>

### Review or collaborate with someone else’s work

Version control software like git
and collaborative coding platforms like GitHub
are plenty of fun when you’re working on your own.
But they really start to shine when you use them to collaborate with others.

The same is true for the <span class="pkg">usethis</span> PR helper functions.
Setting up your local repo to pull down the changes from a collaborator –
changes that probably live in a branch in *their copy* of the repo –
can be a frustrating experience full of online searching
to remember the specific incantations required
to get your collaborators onto your computer and open in front of you.

But have no fear,
`pr_fetch()` does all of this for you,
in just one command in your R console.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Do you know the pull request number?

-   [I don’t remember, remind me](#pr-fetch-no-branch)

-   [I remember, it’s PR `#14`](#pr-fetch-branch)

</div>

### Open a remote branch, locally

The pull request is open on GitHub
and you can see the changes there,
but you just can’t interact with the code in the same way through the browser.
You have to bring that code into your local IDE
where you can hold it in your hand
and poke it with debuggers.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Do you know the pull request number?

-   [I don’t remember, remind me.](#pr-fetch-no-branch)

-   [I remember, it’s PR `#14`.](#pr-fetch-branch)

</div>

### Choose a PR and bring the changes onto your computer

Your friend,
who affectionately calls themselves `@wileycoyote` on GitHub,
helpfully contributed a new function
to your bag of tricks package, <span class="pkg">acme</span>.
They sent you a message on Slack letting you know they submitted a PR,
but they didn’t mention the PR number.

No big deal —
you can call `pr_fetch()` from your local repository
without any arguments
and `pr_fetch()` will look up any open pull requests
and give you the option to pick the one you want.

``` r
pr_fetch()
```

    ℹ No PR specified ... looking up open PRs
    Which PR are you interested in? (0 to exit)

    1: 'gadenbuie/acme/#11' (@gadenbuie): 'Add an example'
    2: 'gadenbuie/acme/#14' (@wileycoyote): 'Model tuning features'

    Selection: 2
    ✓ Checking out PR 'gadenbuie/acme/#14' (@wileycoyote): 'Model tuning features'
    ✓ Adding remote 'wileycoyote' as 'git@github.com:wileycoyote/acme.git'
    ✓ Creating and switching to local branch 'wileycoyote-toone-model'
    ✓ Setting 'wileycoyote/toone-model' as remote tracking branch

You find your friend’s PR in the list and choose selection `2`.
Next time you can perform the same steps by providing the PR number —
`pr_fetch(14)` —
or you can use the menu again.
Who has time or brain space to memorize pull request numbers?

Now that you have the code from the PR available to you locally,
you’re free to poke around to try out the code and review it.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Okay, you’ve had a chance to look at the code, what do you want to do next?

-   [I want to make some changes to add to the PR.](#do-work-theirs)

-   I reviewed the code and left comments for the PR author in the pull request.

    -   [I’m done with this branch](#pr-forget-theirs).

    -   [I’m done for now, but I’ll probably come back to this branch later](#pr-pause).

</div>

### Open a PR locally

You’ve been working with your friend,
`@wileycoyote`,
on a new set of model tuning functions.
They’ve helpfully started working on a PR,
but since you’ve been reviewing the code carefully
with them over the past few days,
you actually remember the pull request number.
Lucky number **14**.

``` r
pr_fetch(14)
```

    ✓ Checking out PR 'gadenbuie/acme/#14' (@wileycoyote): 'Model tuning features'
    ✓ Switching to branch 'wileycoyote-toone-model'

You already have a copy of the PR branch in your local project,
so `pr_fetch()` simply switched you into
the `wileycoyote-toone-model` branch
that it created when you first fetched the PR.

Because you might have been doing some work here before,
`pr_fetch()` does not try to update your local branch.
But you haven’t done any work yet other than looking at the code,
so you follow up with `pr_pull()` to pull the latest changes into your project.

``` r
pr_pull()
```

    ✓ Pulling from 'wileycoyote/toone-model'

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Now that you have the latest PR code, what do you want to do next?

-   [I want to make some changes to add to the PR.](#do-work-theirs)

-   I reviewed the code and left comments for the PR author in the pull request.

    -   [I’m done with this branch](#pr-forget-theirs).

    -   [I’m done for now, but I’ll probably come back to this branch later](#pr-pause).

</div>

### Open your PR on GitHub

You can jump straight to the GitHub pull request page
for the branch you’re in with `pr_view()`!

``` r
pr_view()
```

    ℹ Current branch ('add-example') is connected to PR #11
    ✓ Opening URL 'https://github.com/gadenbuie/acme/pull/11'

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> When you’re done with the PR on GitHub,
come back here to decide where you’re headed next.

-   That’s it for now, I’m [ready to start the next thing](#pr-pause).

-   Hang on, [I found something I need to fix](#fix-something).

-   Good news, the pull request was merged and [I’m done with this work](#pr-finish-yours).

-   Changes were made in the PR [and now I need to update my local copy](#pr-pull).

-   There were updates in the main branch [and now I want to bring them into my PR branch](#pr-merge-main-yours).

-   Actually, the pull request was closed and [I can forget about this work](#pr-forget-yours).

</div>

### Open their PR on GitHub

You can jump straight to the GitHub pull request page
for the branch you’re in with `pr_view()`!

``` r
pr_view()
```

    ℹ Current branch ('wileycoyote-toone-models') is connected to PR #14
    ✓ Opening URL 'https://github.com/gadenbuie/acme/pull/14'

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Welcome back to your project,
I hope everything went well over on GitHub.
Where to next?

-   I’m done here for now, let’s [start the next thing](#pr-pause).

-   Shoot, [I saw something I need to fix](#fix-something-theirs).

-   Nothing more with this branch, I can [forget all about this PR](#pr-forget-theirs).

-   Changes were made in the PR [and now I need to update my local copy](#pr-pull-theirs).

-   There were updates in the main branch [and now I want to bring them into my PR branch](#pr-merge-main-theirs).

-   The PR was merged so [I’m all done with this work](#pr-finish-theirs).

</div>

## Update your local copy

### Update your local copy with a reviewer’s changes

Maybe a reviewer [suggested changes](https://docs.github.com/en/github/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/incorporating-feedback-in-your-pull-request#applying-a-suggested-change)
and you merged them from the PR page on GitHub.
Maybe a GitHub actions workflow
[automatically re-styled your code](https://github.com/r-lib/actions/blob/master/examples/pr-commands.yaml#L45-L75).
Or maybe you did a little side-project updating on your work computer.

However the changes happened,
the code in the PR branch has changed,
and now you want to `pr_pull()` those changes into your local copy.

``` r
pr_pull()
```

    ✓ Pulling from 'origin/add-example'

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> That was easy! What’s next?

-   I’m going to [write some code in this branch](#do-work-yours).

-   I’m going to put this down and [work on something else](#pr-pause).

-   I just merged this pull request and [I’m all done with this work](#pr-finish-yours).

</div>

### Update your local copy with someone else’s changes

Changes were made and hopefully the code has been improved,
but you’d like to run through the changes yourself
to make sure it works as expected.

Use `pr_pull()` to get the latest changes from the PR branch into your local copy.

``` r
pr_pull()
```

    ✓ Pulling from 'wileycoyote/toone-model'

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> That was easy! What’s next?

-   I’m going to [write some code in this branch](#do-work-theirs).

-   I’m going to put this down and [work on something else](#pr-pause).

-   That’s all I wanted to do, I can [forget about this PR now](#pr-forget-theirs).

-   I just merged this pull request and [I’m all done with this work](#pr-finish-theirs).

</div>

### Bring your work up to date with the main branch

While you were working on adding a new example to the documentation,
your friend `@wileycoyote` went and submitted a PR that changes
the function you’re working on.

You found out when you looked at your pull request on GitHub
and it said

> <i class="fa fa-exclamation-triangle"><span class="sr-only">Caution:</span></i> This branch has conflicts that must be resolved.

Usually two people can work in the same project on two different areas
without running into each other,
but when both you and someone else want to change the same lines of code,
you run into this issue.

Helpfully,
`pr_merge_main()` can get the latest changes from the main branch of your project
into your current pull request!

``` r
pr_merge_main()
```

    ✓ Pulling changes from 'origin/main' (default branch of source repo)
    There are 1 conflicted files:
    * R/atom_arranger.R

    Are you ready to sort this out?
    If so, we will open the conflicted files for you to edit.

    1: Yes, I'm ready to resolve the merge conflicts.
    2: No, I want to abort this merge.

    Selection: 1
    Please fix each conflict, save, stage, and commit.
    To back out of this merge, run `gert::git_merge_abort()` (in R) or `git merge --abort` (in the shell).

If you need to fix any merge conflicts,
`pr_merge_main()` will alert you
that there are conflicts that need to be addressed.
It also opens the files for you if you want it to,
or you can choose to abort the merge
and find another way to resolve the conflicts.

You want to resolve the conflicts,
so you picked selection `1` to open the conflicted file
where you start looking for blocks in the source code that look like this:

    <<<<<<< add-example
    Code in the first section appears in
    our *current* version in the `add-example` branch
    =======
    Code in the second section appears in
    the *incoming* version, i.e. the `main` branch
    >>>>>>> main

To resolve the conflict, you

1.  Edit from `<<<<<<<` to `>>>>>>>`
    choosing one or the other or a blend of the two versions

2.  Save the file and stage it with `gert::git_add()`

3.  Repeat for other files with merge conflicts

4.  Commit the updated files with `gert::git_commit()`
    or `git commit` in the command line

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Great, your branch is up to date with the main branch!

-   I’m going to [write some code in this branch](#do-work-yours).

-   I want to [update the pull request on GitHub with these changes](#pr-push-yours).

</div>

### Bring their work up to date with the main branch

While you and `@wileycoyote` have been working together on this new feature,
you’ve been doing some work in other areas of the package.
Since that other work has been added to the `main` branch,
you might want to make sure that everything is up to date
in `@wileycoyote`’s `toone-model` branch.

To do this, run `pr_merge_main()`.
It makes sure your default branch is up to date
and then merges any changes into the current branch.

``` r
pr_merge_main()
```

    ✓ Pulling changes from 'origin/main' (default branch of source repo)
    Merged origin/main into wileycoyote-toone-model

If there aren’t any merge conflicts,
you’ll get a nice, quick confirmation that the merge went well.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Great, `@wileycote`’s branch is up to date with the main branch!

-   I’m going to [write some code in this branch](#do-work-theirs).

-   I want to [update the pull request on GitHub with these changes](#pr-push-theirs).

</div>

### Get to the right place

Let’s make sure we’re in the right branch in your local project.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span>
Which branch do you want to work with right now?

-   The one I’m in right now, so
    [I’m ready to get to work](#do-work)!

-   [A local branch, but not the one I’m in now](#pr-resume-local)

-   [A pull request branch I was looking at on GitHub](#pr-fetch)

</div>

## Work

### Do some work

You take a sip of your coffee (or the beverage of your choice),
turn up your favorite
[music to write code to](https://open.spotify.com/playlist/1fk6kpO8nb1KAUc1XAkAJ6)
playlist on Spotify,
and line up 25 minutes in your [Pomodoro app](https://pomofocus.io/).

You’re ready to get something done!
Go write some code.
⏲️
🧑‍💻
🎧

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span>
Sweet!
Now that you feel good about your work,
you’re ready to [take a snapshot of your updates](#git-commit).

</div>

### Keep doing some work

> Taking breaks and resting is important!
>
> Last night I got caught up in a nested
> [\#RStats](https://twitter.com/hashtag/rstats)
> list problem and couldn’t solve it.
>
> Wrote the code this morning first shot.
>
> Take breaks! You need them!
>
> — Nicholas Tierney (@nj\_tierney) [April 16,2019](https://twitter.com/nj_tierney/status/1117964839127674881)

Sometimes the best thing you can do to solve a problem is give it some time.
Go for a walk, read something engaging, talk to a friend, take a shower.

And now you’re back with fresh eyes, more energy, and a full cup of coffee.
This time, things go better!
You fall easily into a flow and start writing some code.
As you go,
you periodically pause to stage files with `gert::git_add()`
or to commit batches of changes with `gert::git_commit()`.

After a bit you surprise yourself when you realize
that the thing you couldn’t figure out when you were tired yesterday
you’ve knocked out in an hour.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span>
Happy with your progress, you’re ready [update the PR with your latest changes](#pr-push-yours).

</div>

### Collaborate with someone else

This is exciting!
Your friend —
which feels like a totally natural way to describe `@wileycoyote`,
a person you know primarily from Twitter —
had a pretty cool idea
and you’re feeling the buzz of inspiration.
Even though they started the pull request,
you’re about to riff on the ideas they started laying down.

You pick out your [favorite RStudio theme](https://www.garrickadenbuie.com/project/rsthemes/)
and turn up your favorite dance-slash-coding-slash-singing-out-loud music.

As you work,
you pause occasionally to stage files with `gert::git_add()`
and to commit them with `gert::git_commit()`.
Since you’re working with someone else,
you remember to
[write good commit messages](https://xkcd.com/1296/),
but since you’re having fun you also use
[gitmoji to give each commit a good emoji.](https://gitmoji.dev/)

It’s a lot later than you expect when you start wrapping up.
That’s okay, `@wileycoyote` is going to be stoked to see what you’ve been working on!

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span>
Go head and [update the PR with your latest changes](#pr-push-theirs).

</div>

### Take a snapshot of your work

*If you like it then you shoulda made a `git commit`.*

There are two parts to taking a snapshot of your code.
And really,
it’s less like taking a picture and more like sending yourself an email
with a copy of your files.

First, you’ll pick the files that you want to add to the snapshot (or commit).
You can do this in the R console using `git_add()` from the <span class="pkg">[gert](https://docs.ropensci.org/gert/)</span> package.
Give the function a vector with the paths to the files you changed.

``` r
gert::git_add(c("R/atom_arranger.R", "man/atom_arranger.Rd"))
```

In git-speak,
`git_add()` adds the changes in the listed files to a staging area.
Running this command is like dragging a file into the email you’re writing.
We haven’t officially sent that email yet,
but we have a copy ready to go.
By the way,
you can still make more changes to the file
knowing that there’s a temporary copy in that email draft
in case anything goes wrong.

Then, once all the files you want to commit have been added,
you *commit* the changes.
In our email metaphor,
committing is a lot like pressing send on the email.

And just like an email,
the commit includes a message
where you can describe the updates you made to the files in the email (commit).

For this step you can use
`git_commit()`
(also from the <span class="pkg">[gert](https://docs.ropensci.org/gert/)</span> package)
which takes the commit message as a parameter.
Think of this message like the subject of an email to your future self.

``` r
gert::git_commit("Add an example to ?atom_arranger()")
```

*P.S. You can do this adding-and-committing dance in the [Git pane in RStudio](https://happygitwithr.com/rstudio-git-github.html), too.*

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Are you ready to share your work?

-   Yes! I’m ready to [push my changes out into the world](#pr-push-new).

-   Not yet, I want to [keep on working on this](#do-work).

-   Actually, I don’t think I’m on the right track here.
    I’d [rather back out of this branch and forget all about it](#pr-forget-yours).

</div>

### Fix something

Oh no, you need to fix something!
I hope it’s just a typo and not a big scary error!
But first…

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span>
This thing that needs to be fixed —
[what branch is it in](#do-choose-branch)?

</div>

### Fix something

Oh no, you need to fix something!
I hope it’s just a typo and not a big scary error!
But first…

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span>
This thing that needs to be fixed — what branch is it in?

-   The one I’m in right now, so
    [I’m ready to get to work](#do-work-theirs)!

-   [A local branch, but not the one I’m in now.](#pr-resume-local)

-   [A pull request branch I was looking at on GitHub.](#pr-fetch)

</div>

### Fix something

Oh no, you need to fix something!
I hope it’s just a typo and not a big scary error!
But first…

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span>
This thing that needs to be fixed — what branch is it in?

-   The one I’m in right now, so
    [I’m ready to get to work](#do-work-yours)!

-   [A local branch, but not the one I’m in now](#pr-resume-local)

-   [A pull request branch I was looking at on GitHub](#pr-fetch)

</div>

## Share your work

Fantastic!
Your work is awesome and everyone is going to be happy to try it out.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Let’s get your work off of your computer and out into the world.

-   This [new work you’re sharing for the first time](#pr-push-new).

-   I’m [updating a pull request that I created](#pr-push-yours).

-   I’m [updating a pull request from someone else](#pr-push-theirs).

</div>

### Create a new pull request

Fantastic!
Your work is awesome and everyone is going to be happy to try it out.

Let’s get your work off of your computer and out into the world.
To create a new pull request, you call `pr_push()`.

``` r
pr_push()
```

    ✔ Pushing local 'add-example' branch to 'origin:add-example'
    ✔ Setting upstream tracking branch for 'add-example' to 'origin/add-example'
    ✔ Create PR at link given below
    ✔ Opening URL 'https://github.com/gadenbuie/acme/compare/add-example'

`pr_push()` sends the local changes in your new branch to GitHub,
and opens a browser window where you can review your changes once more.
If everything looks good,
go ahead click the *Create Pull Request* button.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Good job! How are you feeling now?

-   I’m on a roll, let’s [start the next thing](#pr-pause).

-   I’d want to [open the PR on GitHub again](#pr-view-yours).

-   Oh shoot, [I saw something I need to fix](#fix-something).

-   Great, that pull request was just merged and [I’m done with this work](#pr-finish-yours).

-   Changes were made in the PR [and now I need to update my local copy](#pr-pull).

-   There were updates in the main branch [and now I want to bring them into my PR branch](#pr-merge-main-yours).

-   Actually, the pull request was closed and [I can forget about this work](#pr-forget-yours).

</div>

### Update your existing pull request

You just made [and committed](#git-commit)
some changes to an existing PR you created,
and now you’d like to update that PR on GitHub.
`pr_push()` also does this for you!
Helpfully, before it pushes it checks to make sure your local branch is up-to-date.

``` r
pr_push()
```

    ✔ Checking that local branch 'add-example' has the changes in 'origin/add-example'
    ✔ Pushing local 'add-example' branch to 'origin:add-example'
    ✔ View PR at 'https://github.com/gadenbuie/acme/pull/10' or call `pr_view()`

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Phenomenal! What do you want to do next?

-   I want to [take a look at the PR on GitHub](#pr-view-yours).

-   Rock on! I’m moving on to [start the next thing](#pr-pause).

-   Wait a second, [I saw something I need to fix](#fix-something-yours).

-   Changes were made in the PR [and now I need to update my local copy](#pr-pull).

-   There were updates in the main branch [and now I want to bring them into my PR branch](#pr-merge-main-yours).

-   The PR has been merged and [I’m all done with this work](#pr-finish-yours).

-   Never mind, my [PR was closed and I’d like to forget about this work](#pr-forget-yours).

</div>

### Update someone else’s pull request

At this point,
you have changes in your local copy of your PR branch
that you need to push out to the source branch for the PR,
which happens to be in `@wileycoyote`’s fork of your repo.

`pr_push()` is very smart and knows how to send the changes to the correct repository,
pushing to the `toone-model` in the `wileycoyote/acme`.

``` r
pr_push()
```

    ✔ Checking that local branch 'wileycoyote-toone-model' has the changes in 'wileycoyote/toone-model'
    ✔ Pushing local 'wileycoyote-toone-model' branch to 'wilecoyote:toone-model'
    ✔ View PR at 'https://github.com/gadenbuie/acme/pull/14' or call `pr_view()`

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Phenomenal! What do you want to do next?

-   I want to [take a look at the PR on GitHub](#pr-view-theirs).

-   Beep, beep! I’m moving on to [start the next thing](#pr-pause).

-   Hang on, [I saw something I need to fix](#fix-something-theirs).

-   That’s all I wanted to do, I can [forget about this PR now](#pr-forget-theirs).

-   Changes were made in the PR [and now I need to update my local copy](#pr-pull-theirs).

-   There were updates in the main branch [and now I want to bring them into my PR branch](#pr-merge-main-theirs).

-   I just merged this pull request and [I’m all done with this work](#pr-finish-theirs).

</div>

## Wrap Up

### Pause your work

You’re done but you have a feeling you’ll be back here again soon.
What you need is a little *pause*.

Call `pr_pause()` to switch from the current branch back to the default branch,
and to make sure you’ve got the latest changes in the default branch.
Don’t worry,
the work will be waiting patiently for you in a local branch
when you’re ready to come back to it.

``` r
pr_pause()
```

    ✓ Switching back to default branch ('main')
    ✓ Pulling changes from 'origin/main'

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> [Go back to Start](#start) to decide to decide what’s next in your adventure.

</div>

### Finish up your work

Hooray!
A PR was merged and the new code is now in the default branch.
That’s one less branch you need to keep around on your computer.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Was this PR yours?

-   **Yes**, and…

    -   [I’m still in the PR branch in my local project](#pr-finish-yours)

    -   [I’m in the main branch now, but I have the PR branch here somewhere](#pr-finish-number)

-   **No**, and…

    -   [I’m still in the PR branch in my local project](#pr-finish-theirs)

    -   [I’m in the main branch now, but I have the PR branch here somewhere](#pr-finish-number)

</div>

### Finish your work

Congrats! Your pull request was merged!
That’s awesome.
Now it’s time to wrap things up by calling `pr_finish()`.

``` r
pr_finish()
```

    ✓ Checking that remote branch 'origin/add-example' has the changes in 'add-example'
    ✓ Switching back to default branch ('main')
    ℹ Pulling changes from 'origin/main'
    ✓ Deleting local 'add-example' branch

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> [Go back to Start](#start) to decide what’s next in your adventure.

</div>

### Finish your work

Well done,
your collaboration with `@wileycoyote` is complete and their PR is merged!
That’s awesome.
Now it’s time to wrap things up by calling `pr_finish()`.

``` r
pr_finish()
```

    ✔ Checking that remote branch 'wileycoyote/toone-model' has the changes in 'local/wileycoyote-toone-model'
    ✔ Switching back to 'main' branch
    ✔ Pulling changes from GitHub source repo 'origin/main'
    ✔ Deleting local 'wileycoyote-toone-model' branch
    ✔ Removing remote 'wileycoyote'

Notice that `pr_finish()` does quite a lot!
It makes sure that you don’t accidentally leave behind
some changes in your local branch that might have forgotten to push.
Then it switches back to `main` and makes sure that’s up to date, too.
Finally we forget all about `@wileycote`’s branch and forked repo.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span>
That’s all folks!
[Head back to the beginning](#start) to choose your next adventure.

</div>

### Clean up now that the PR has been merged

You don’t have to be in your local copy of the PR branch
if you know the PR number.
Give the number to `pr_finish()`
and it will do the rest for you:
it moves back to the default branch,
updates your local copy,
and deletes the old PR branch.

``` r
pr_finish(11)
```

    ✓ Checking that remote branch 'origin/add-example' has the changes in 'add-example'
    ✓ Switching back to default branch ('main')
    ℹ Pulling changes from 'origin/main'
    ✓ Deleting local 'add-example' branch

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> [Go back to Start](#start) to decide what’s next in your adventure.

</div>

### Forget about your work

Well that was fun.
But now you’re done with this branch
and you call `pr_forget()` to delete it from your local copy.

``` r
pr_forget()
```

    Local branch 'add-example' has no associated remote branch.
    If we delete 'add-example', any work that exists only on this branch work may be hard for you to recover.
    Proceed anyway?

    1: No way
    2: Not now
    3: Yes

    Selection: 3
    ✓ Switching back to default branch ('main')
    ✓ Pulling changes from 'origin/main'
    ✓ Deleting local 'add-example' branch

Notice that `pr_forget()` warns you about any work you might lose
and gives you a chance to rethink it.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> [Go back to Start](#start) to decide what’s next in your adventure.

</div>

### Forget about their work

Your work here is done and you’d like to move on with your life.
`pr_forget()` lets you put this branch behind you.
And while it’s in there,
it also cleans up your repo,
deleting the local copy of the PR branch
and removing the PR author’s repo fork
from the list of remote repositories your git project could sync with.

``` r
pr_forget()
```

    ✓ Switching back to default branch ('main')
    ✓ Pulling changes from 'origin/main'
    ✓ Deleting local 'wileycoyote-toone-models' branch
    ✓ Removing remote 'wileycoyote'

That was smooth!
Notice that `pr_forget()` moved you into the default branch of your repo,
`main`,
and it even made sure that branch is up to date.

`pr_forget()` is safe and cautious.
If your local `wileycoyote-toone-models` branch
had had any changes in it that you might have lost,
`pr_forget()` would have warned you.
You also know that you can get back to the PR branch any time
using `pr_fetch()`.

<div class="decision">

<i class="way-point fas fa-map-signs" aria-hidden="true" title="Decision Time"></i><span class="sr-only">Decision time:</span> Worry and care-free, you [head back to the beginning](#start) to decide what’s next in your adventure.

</div>

##

<div id="step-list" style="display:none">

</div>

<div id="story-reset">

<a href="#start"><i aria-hidden="true" class="fas fa-undo-alt"></i> Start over</a>

</div>

## Download the usethis `pr_*()` flow chart

-   [Small JPG Image (190 KB)](usethis-pr-flow.jpg)
-   [Medium JPG Image (511 KB)](usethis-pr-flow-medium.jpg)
-   [Large JPG Image (1.36 MB)](usethis-pr-flow-large.jpg)
-   [SVG (40 KB)](usethis-pr-flow.svg)
-   [SVG, Editable (40 KB)](usethis-pr-flow-editable.svg)
-   [Source File `.drawio` (4 KB)](usethis-pr-flow.drawio)

<div class="cc-box">

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/">
  <img alt="Creative Commons License" style="border-width:0;margin-right:1em;" src="https://i.creativecommons.org/l/by/4.0/88x31.png" align="left" />
</a>
<em xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/StillImage" property="dct:title" rel="dct:type">
  Pull Request Flow with usethis
</em>
by
<a xmlns:cc="http://creativecommons.org/ns#" href="https://www.garrickadenbuie.com/blog/pull-request-flow-usethis" property="cc:attributionName" rel="cc:attributionURL">
Garrick Aden-Buie
</a> is licensed under a
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.

</div>

<script src="usethis-adventure.js"></script>

[^1]: I primarily use GitHub, but I think these functions will generally work for other code-hosting platforms as well, like GitLab or others.
