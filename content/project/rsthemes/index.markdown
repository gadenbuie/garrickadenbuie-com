---
title: "🔮 rsthemes"
description: "Full RStudio IDE and Syntax Themes"
author: Garrick Aden-Buie
date: '2020-10-01'
images: [ /project/rsthemes/social-card.png ]
categories: ["Project"]
tags:
  - RStudio Theme
  - R Package
  - R
  - RStudio
links:
- icon: github # icon name without the 'fa-'
  icon_pack: fab
  name: Source
  url: https://github.com/gadenbuie/rsthemes
- icon: download # icon name without the 'fa-'
  icon_pack: fas
  name: Installation
  url: /project/rsthemes/#installation
- icon: info-circle # icon name without the 'fa-'
  icon_pack: fas
  name: Usage
  url: /project/rsthemes/#usage
---

[gh]: https://github.com/gadenbuie/rsthemes

<!-- https://buttons.github.io/ -->
<a class="github-button" href="https://github.com/gadenbuie" data-show-count="true" aria-label="Follow @gadenbuie on GitHub">Follow &commat;gadenbuie</a>&nbsp;
<a class="github-button" href="https://github.com/gadenbuie/rsthemes" data-icon="octicon-star" data-show-count="true" aria-label="Star gadenbuie/rsthemes on GitHub">Star</a>&nbsp;
<a class="github-button" href="https://github.com/gadenbuie/rsthemes/fork" data-icon="octicon-repo-forked" data-show-count="true" aria-label="Fork gadenbuie/rsthemes on GitHub">Fork</a>

<p align=center>
  <img src="https://raw.githubusercontent.com/gadenbuie/rsthemes/assets/rsthemes.gif">
  <h1 align="center">{rsthemes}</h1>
</p>



<style type="text/css">
#rsthemes-list ul {
  padding-left: 0;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  align-items: end;
  grid-gap: 0.66em;
  max-width: 100%;
}

@media screen and (max-width: 400px) {
  #rsthemes-list ul {
    grid-template-columns: repeat(2, 1fr);
    font-size: 12px;
  }
}

#rsthemes-list li {
  list-style: none;
  position: relative;
}

#rsthemes-list .rstheme-name {
  font-size: 1.1em;
  margin-top: 0;
  padding-right: 50px;
  position: relative;
}

#rsthemes-list .style {
  position: absolute;
  bottom: 0;
  right: 0;
  color: var(--text-mild);
}

#rsthemes-buttons {
  margin-left: auto;
  margin-right: auto;
  width: max-content;
}

#rsthemes-buttons button {
  color: var(--textColorCustom);
  border-color: var(--textColorCustom);
  background-color: unset;
  display: inline-block;
  font-size: 1em;
  padding: 10px;
  padding-left: 35px;
  padding-right: 15px;
  margin-bottom: 1.5em;
  text-decoration: none;
  border-radius: 0;
  border-width: 1px;
  break-inside: avoid;
  white-space: nowrap;
  position: relative;
  text-align: left;
  opacity: 0.8;
  transition: opacity 0.2s ease-in-out;
}

#rsthemes-buttons button + button {
  margin-left: 10px;
}

#rsthemes-buttons button:hover,
#rsthemes-buttons button:active {
  opacity: 1;
}

#rsthemes-buttons .rsthemes-button-active,
#rsthemes-buttons .rsthemes-button-active:hover {
  color: var(--blue-30);
  border-color: var(--blue-30);
}

@media (prefers-color-scheme: dark) {
  #rsthemes-buttons .rsthemes-button-active,
  #rsthemes-buttons .rsthemes-button-active:hover {
    color: var(--blue-60);
    border-color: var(--blue-60);
  }
}

#rsthemes-buttons button.rsthemes-button-active::before {
  content: '\2713';
  position: absolute;
  left: 12px;
}
</style>

<script src="//cdnjs.cloudflare.com/ajax/libs/list.js/1.5.0/list.min.js"></script>

<div id="rsthemes-buttons" style="display:none;">
<button class="rsthemes-button-active" id="rsthemes-light" value="rsthemes-is-light">Light</button>
<button class="rsthemes-button-active" id="rsthemes-dark" value="rsthemes-is-dark">Dark</button>
<button id="rsthemes-base16" value="rsthemes-is-base16">Base 16</button>
</div>

<div id="rsthemes-list"><ul class="list"></ul></div>

<script type="text/javascript">
const rsthemesOpts = {
  valueNames: [
    'name',
    'style',
    { name: 'image', attr: 'src' },
    { name: 'imageLink', attr: 'href' }
  ],
  // <a href="{url}" data-featherlight="image">
  item: `<li>
    <div class="rstheme-name"><span class="name"></span><div class="style"></div></div>

    <div class="rstheme-image"><a class="imageLink" data-featherlight="image" href="#"><img class="image" src="#" /></a></div>
    </li>`
}

let rsthemesList = undefined
const btns = document.getElementById('rsthemes-buttons')

function filterRsthemesList() {
  if (typeof rsthemesList === 'undefined') return;
  let btn = btns.querySelectorAll('button')
  const state = {
    light: btn[0].classList.contains('rsthemes-button-active'),
    dark: btn[1].classList.contains('rsthemes-button-active'),
    base16: btn[2].classList.contains('rsthemes-button-active')
  }
  rsthemesList.filter(function(item) {
    const value = item.values()
    if (value.isBase16 && !state.base16) {
      return false
    }
    if (!state.light && !state.dark) {
      return true
    }
    if (value.isDark && state.dark) {
      return true
    }
    if (!value.isDark && state.light) {
      return true
    }
    return false
  })
}

const rsthemes = fetch("https://raw.githubusercontent.com/gadenbuie/rsthemes/assets/rsthemes.json")
  .then(response => response.json())
  .then(json => {
    json = json.map(t => {
      t.imageLink = t.image
      t.style = t.isDark ? 'Dark' : 'Light'
      t.name = t.name.replace(' {rsthemes}', '')
      return t
    }).
    sort(t => t.isBase16 ? 1 : -1)

    rsthemesList = new List('rsthemes-list', rsthemesOpts, json)
    btns.style.display = 'block'
    filterRsthemesList()
  })

btns.querySelectorAll('button').forEach(function(btn) {
  btn.addEventListener('click', function() {
    btn.classList.toggle('rsthemes-button-active')
    filterRsthemesList()
  })
})
</script>


## Installation


You can install rsthemes from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("gadenbuie/rsthemes")
```

Then, install the included, hand-crafted themes with:

``` r
rsthemes::install_rsthemes()
```

or you can install the themes plus an additional set of [base16-based themes](https://github.com/chriskempson/base16) with

``` r
rsthemes::install_rsthemes(include_base16 = TRUE)
```

## Usage


The rsthemes package includes a couple helper functions for exploring the themes.

``` r
# list installed themes
rsthemes::list_rsthemes()

# Try all themes
rsthemes::try_rsthemes()

# Try just the light, dark, or base16 themes, e.g.
rsthemes::try_rsthemes("light")
```

Use `rstudioapi::applyTheme()` to activate a theme from the R console, or use *Tools* > *Global Options* > *Appearance* to interactively select a theme. 

``` r
# Use a theme
rstudioapi::applyTheme("One Dark {rsthemes}")
```

## Easy Theme Switching


**rsthemes** includes RStudio addins and functions to... <a name="automatic--light-and--dark-mode"></a>

- &#x1F305; **Toggle Dark Mode**<br>Switch between two preferred dark and light themes

- &#x1F303; **Auto Dark Mode**<br>Automatically choose a dark or light theme by time of day

- &#x2764;&#xFE0F; **Favorite Themes**<br>Switch between a few of your favorite themes

#### Choose Your Preferred Themes

First, set a default light and dark theme. For your current R sessions, you can use the **Set Default Light Theme to Current** addin (or the corresponding dark theme addin), or you can call the `set_theme_light()` or `set_theme_dark()` functions:

``` r
# Set current theme to default light or dark theme
rsthemes::set_theme_light()
rsthemes::set_theme_dark()

# Set a specific theme to default light or dark theme
rsthemes::set_theme_light("One Light {rsthemes}")
rsthemes::set_theme_dark("One Dark {rsthemes}")
```

To create a list of your **favorite** themes, you can use `set_theme_favorite()`.

```r
# Add current theme to your list of favorites
rsthemes::set_theme_favorite()

# Add a list of themes to your favorites
rsthemes::set_theme_favorite(
  c("GitHub {rsthemes}", "One Light {rsthemes}", "One Dark {rsthemes}")
)
```

These functions only save your preferences for the _current_ R session. To set these defaults for all R sessions, add your preferences to your `~/.Rprofile`. (You can use `usethis::edit_r_profile()` to quickly open your `~/.Rprofile` for editing.)

```r
# ~/.Rprofile
if (interactive()) {
  rsthemes::set_theme_light("GitHub {rsthemes}")
  rsthemes::set_theme_dark("Fairyfloss {rsthemes}")
  rsthemes::set_theme_favorite(
    c("GitHub {rsthemes}", 
      "One Light {rsthemes}", 
      "One Dark {rsthemes}")
  )
}
```

You can also set the following global options directly.

```r
# ~/.Rprofile
options(
  rsthemes.theme_light = "Nord Snow Storm {rsthemes}",
  rsthemes.theme_dark = "Nord Polar Night Aurora {rsthemes}",
  rsthemes.theme_favorite = paste("One", c("Light", "Dark"), "{rsthemes}")
)
```

### Toggle Your Favorite Themes

Use the **Next Favorite Theme** addin to walk through your list of favorite themes. Use the _Modify Keyboard Shortcuts..._ dialog in the _Tools_ menu of RStudio to create a keyboard shortcut to make it easy to quickly switch themes — I use <kbd>Ctrl</kbd>+ <kbd>Alt</kbd> + <kbd>N</kbd>. You can also manually call `use_theme_favorite()` to use the next theme in the your favorites list.

Each time you run the addin, RStudio switches to the next theme in your favorites list. This is great if you have a few themes that you use in various contexts. For example, I have my personal favorite themes plus a few themes that work well during class or presentation sessions.


### Automatic or Manual Light/Dark Mode

Use the **Toggle Dark Mode** addin to switch between your default light and dark themes. You can even set a keyboard shortcut in RStudio — I used <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>D</kbd> — to toggle dark mode.

You can also automatically choose the dark or light theme by time of day, using the included **Auto Choose Dark or Light Theme** addin, which requires that you've set your preferred light/dark themes (see above).

If you would like to automatically choose the dark or light theme by time of day during each new session, you can call `rsthemes::use_theme_auto()` in your `~/.Rprofile`. For best results, use the following template in your `~/.Rprofile` to declare your preferred dark and light themes and to choose the correct style when your R session reloads.

```r
if (interactive() && requireNamespace("rsthemes", quietly = TRUE)) {
  # Set preferred themes if not handled elsewhere..
  rsthemes::set_theme_light("One Light {rsthemes}")  # light theme
  rsthemes::set_theme_dark("One Dark {rsthemes}") # dark theme

  # Whenever the R session restarts inside RStudio...
  setHook("rstudio.sessionInit", function(isNewSession) {
    # Automatically choose the correct theme based on time of day
    rsthemes::use_theme_auto(dark_start = "18:00", dark_end = "6:00")
  }, action = "append")
}
```

## Uninstall


If you want to uninstall all or some of the themes, you can use

``` r
rsthemes::remove_rsthemes()

# or just the base16 themes, e.g.
rsthemes::remove_rsthemes("base16")
```

## Thanks and Theme Credits

### Palettes


- [base16] (Various Authors)
- [Fairyfloss] ([Amy Wibowo (sailorhg)](https://github.com/sailorhg))
- [Flat White][flat-white] ([Dmitry Biletskyy](https://github.com/biletskyy))
- [Nord] ([Sven Greb](https://www.svengreb.de/))
- [Oceanic Plus][oceanic-plus] ([Marco Scannadinari](https://github.com/marcoms))
- [Atom One Dark][one-dark]
- [Atom One Light][one-light]
- [Solarized] (Ethan Schoonover)
- [Horizon Dark][horizon] (Jonathan Olaleye)
- [a11y-syntax-highlighting][a11y-syntax] ([Eric Bailey](https://ericwbailey.design/))
- [Night Owl][night-owl] ([Sarah Drasner](https://sarah.dev/))
  - with huge thanks to original [Night Owlish][night-owlish] 
    implementation in RStudio by [Mara Averick](https://maraaverick.rbind.io/)
    

[base16]: https://github.com/chriskempson/base16
[fairyfloss]: https://github.com/sailorhg/fairyfloss
[flat-white]: https://github.com/biletskyy/flatwhite-syntax
[nord]: https://github.com/arcticicestudio/nord
[oceanic-plus]: https://github.com/marcoms/oceanic-plus
[one-light]: https://github.com/atom/atom/tree/master/packages/one-light-syntax
[one-dark]: https://github.com/atom/atom/tree/master/packages/one-dark-syntax
[solarized]: https://ethanschoonover.com/solarized
[horizon]: https://horizontheme.netlify.app/
[a11y-syntax]: https://github.com/ericwbailey/a11y-syntax-highlighting
[night-owl]: https://github.com/sdras/night-owl-vscode-theme
[night-owlish]: https://github.com/batpigandme/night-owlish

