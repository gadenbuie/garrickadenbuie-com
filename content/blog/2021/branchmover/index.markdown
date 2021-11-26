---
title: 'branchMover: A Shiny app for moving the default branch of your GitHub repos'
author: Garrick Aden-Buie
date: '2021-11-02'
slug: branchmover
categories:
  - Blog
tags:
  - R
  - usethis
  - GitHub
  - git
  - Apps
  - Shiny
  - RStudio
description: >
  Introducing branchMover, a Shiny app slash RStudio addin for coordinated
  default branch changes across your GitHub repositories.
twitterImage: "https://raw.githubusercontent.com/gadenbuie/branchMover/main/man/figures/app.png"
rmd_source: "https://github.com/gadenbuie/garrickadenbuie-com/tree/main/content/blog/2021/branchmover/index.Rmd"
keywords: "rstats"
editor_options:
  chunk_output_type: console
---
<script src="{{< blogdown/postref >}}index_files/clipboard-2.0.6/clipboard.min.js"></script>
<link href="{{< blogdown/postref >}}index_files/xaringanExtra-clipboard-0.2.6/xaringanExtra-clipboard.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/xaringanExtra-clipboard-0.2.6/xaringanExtra-clipboard.js"></script>
<script>window.xaringanExtraClipboard(null, {"button":"Copy Code","success":"Copied!","error":"Press Ctrl+C to Copy"})</script>

<!-- Links -->
[branchmover]: https://github.com/gadenbuie/branchMover
[shiny]: https://shiny.rstudio.com
[rstudio]: https://rstudio.com
[github]: https://github.com
[tidyverse]: https://tidyverse.org





<div class="figure">
<img
  src="https://raw.githubusercontent.com/gadenbuie/branchMover/main/man/figures/app.png"
  alt="The 'Branch Mover' shiny app on the main 'Repos' screen, showing an interactive table of repositories associated with a GitHub user. The table shows the default branch, language of the repo, number of forks and stars, and a button that can be clicked to initiate moving the repo's default branch."
>
<p class="caption">Branch Mover</p>
</div>

::: lead

Introducing [branchMover], a [Shiny] app slash [RStudio] addin for coordinated default branch changes across your [GitHub] repositories.

The app show you the default branch name for all of your repos and coordinates changing the default branch, including creating an issue to communicate the change.

:::

## Moving to `main` street

Over the past year,
there's been a concerted effort among people who create and manage git repositories
to move away from the default branch name of `master`
to something more intentional: typically `main`.

[RStudio] and the [tidyverse] team recently undertook the giant challenge
of changing the default branch of RStudio's approximately 350 public repositories
(most of which are all open source!).
[Jenny Bryan](https://jennybryan.org/) wrote about
[the branch-changing experience](https://www.tidyverse.org/blog/2021/10/renaming-default-branch/)
on the tidyverse blog.

Watching Jennys's superb stewardship of the change inspired a new app `branchMover`.
Or is it named **Branch Mover**?
Admittedly, I didn't spend much time thinking about the name because the app won't be in your life for very long.

The goal of [branchMover] is to help you coordinate a default branch change across the repos you maintain.
The app shows you all of the repos associated with your GitHub account and their current default branch.
Because you might want to start with your less popular repos, you can sort by number of forks and stars on each repo.

There's also a button to change the default branch.
When you click the button, the app clones your repo and uses
the [usethis](https://usethis.r-lib.org) package
and the recently added
[usethis::git_default_branch_rename()](https://usethis.r-lib.org/reference/git-default-branch.html)
function to update the default branch of your repo.

I followed Jenny's lead and the app will create an issue announcing the change.
If all goes well,
the issue is closed a few seconds later
with instructions for your users on how to update any local copies of your repo.
If it doesn't go well,
the issue stay open as a reminder to you to finish the process.

Unfortunately, branchMover *doesn’t* update the default branch in *your*
local copies of your repos. Thankfully, this is relatively pain-free
with the
[usethis::git_default_branch_rediscover()](https://usethis.r-lib.org/reference/git-default-branch.html)
function, added in <span class="pkg">usethis</span> version 2.1.2.

The next time you find yourself in your local copy of your repo,
run `git_default_branch_rediscover()` to reconfigure your branch situation.

```r
git_default_branch_rediscover()
#> ℹ Default branch of the source repo 'jennybc/happy-git-with-r': 'main'
#> ✓ Default branch of local repo has moved: 'master' --> 'main'
```

## Installation

You can install [branchMover] from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("gadenbuie/branchMover")
```

The app uses the <span class="pkg">[usethis](https://usethis.r-lib.org)</span> and
<span class="pkg">[gh](https://gh.r-lib.org)</span> packages. You need to configure gh with a
[Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
to be able to authenticate with the GitHub API.
Read more about setting up a PAT in one of these places:

* [Managing Git(Hub) Credentials](https://usethis.r-lib.org/articles/articles/git-credentials.html) *usethis article*
* [Personal access token for HTTPS](https://happygitwithr.com/https-pat.html) *guidance from [Happy Git and GitHub for the useR](https://happygitwithr.com)*
* [Managing Personal Access Tokens](https://gh.r-lib.org/articles/managing-personal-access-tokens.html) *gh article*

Then, in RStudio, run the app with:

```r
branchMover::app()
```

If you'd like to explore or reconfigure the default branch of repositories that you manage in other organizations,
provide `app()` with the user or organization name.
Branch Mover will tell you how many repos you have access to in the organization
and it won't let you update branch names for repos where you don't have admin permissions.

```r
branchMover::app("rstudio-education")
#> ℹ @rstudio-education has 57 total repositories (including forks)
#> • 57 public repos
#> • 0 private repos
#> ℹ 57 non-fork repositories have the following default branches:
#> x master: 51 repos
#> ✓ main: 6 repos
#> ℹ You have admin rights on 1 repo
```

## Why change branches?

If you want to learn more about how git's default branch works
and why many are opting to choose a more intentional default,
I highly recommend Jenny's detailed article
[Renaming the default branch](https://www.tidyverse.org/blog/2021/10/renaming-default-branch/),
which I'll quote directly:

> Technically, Git has no official concept of the default branch. But in practice, most Git repos have an _effective default branch_. If there’s only one branch, this is it! It is the branch that most bug fixes and features get merged in to. It is the branch you see when you first visit a repo on a site such as GitHub. On a Git remote, it is the branch that `HEAD` points to. The default branch may not be precisely defined in Git itself, but most of us know it when we see it.
>
> Historically, `master` has been the most common name for the default branch, but `main` is an increasingly popular choice. There is coordinated change across the Git ecosystem that is making it easier for users to make this switch, for example:
>
> - [Regarding Git and Branch Naming](https://sfconservancy.org/news/2020/jun/23/gitbranchname/), statement from the Git project and the Software Freedom Conservancy regarding the new `init.defaultBranch` configuration option
> - [Renaming the default branch from`master`](https://github.com/github/renaming#readme), GitHub’s roadmap for supporting the shift away from `master`
> - [The new Git default branch name](https://about.gitlab.com/blog/2021/03/10/new-git-default-branch-name/), same, but for GitLab
>
> <cite>Jenny Bryan, [Renaming the default branch](https://www.tidyverse.org/blog/2021/10/renaming-default-branch/)</cite>


***

**Branch Mover** was built by [Garrick Aden-Buie](https://www.garrickadenbuie.com).
Come say hi to me on Twitter at [&commat;grrrck](https://twitter.com/grrrck).
