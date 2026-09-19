---
name: add-talk-to-blog
description: Add a talk or workshop from supplied materials, discovering metadata from the linked repository and creating a feature image from the first slide when available.
---

# Add a talk to the site

Create a new talk page in this repository. Prefer discovering facts from the user's materials over asking them to repeat information. A repository URL is the best input: inspect its README, rendered slides, source files, release metadata, and repository links before asking for anything.

## Workflow

### 1. Inspect the local site first

Before editing:

1. Read `_quarto.yml`, `talk/_index.md`, `talk/_metadata.yml`, and `talk/index.qmd`.
2. Read two or three recent pages in `talk/` to match the current YAML and body conventions.
3. Check the worktree and do not overwrite unrelated user changes.
4. Look for an existing page or slug for the same talk.

The current site convention is:

```text
talk/<slug>/index.qmd
talk/<slug>/<feature-image>
```

Use a short, lowercase, hyphenated slug. Keep the new page in `talk/`, not `blog/`, unless the user explicitly asks for a blog post instead.

### 2. Discover the talk from the supplied materials

If the user gives a URL, fetch or clone only what is needed and inspect it. Work from highest-value sources in this order:

1. Repository README and landing page
2. The rendered slide deck, including its title and closing/about slides
3. Repository metadata, `DESCRIPTION`, `package.json`, `_quarto.yml`, or other project config
4. Slide source and commit history
5. Event or conference page linked from the repository

Extract, when available:

- talk title
- presenter(s)
- abstract or short description
- date
- event name and event URL
- location or virtual status
- slide URL and PDF URL
- source/code repository URL
- recording URL
- useful topical tags

Do not invent metadata. Preserve the user's spelling, capitalization, and event branding when discoverable.

### 3. Ask only for missing information

Ask one concise batch of questions, ordered by value, and omit anything already found:

1. **Required page identity:** What is the title, date, event, and location if these cannot be established?
2. **Required content:** What abstract or short description should appear on the page?
3. **Primary links:** Which links should be published (slides, PDF, code, video, project/demo)?
4. **Classification:** Are there preferred categories or tags?
5. **Presentation details:** Which presenter name(s) should appear, and is there a preferred slug?
6. **Feature image:** If no usable slide deck can be rendered, should a supplied image be used, or should the page be created without one?

Do not block on optional details. If the user does not provide a missing optional value, omit that field or use the site's existing default behavior. Never guess a date, location, abstract, URL, or image source.

### 4. Create the feature image

The feature image should be a screenshot of the first meaningful/title slide, not a screenshot of a repository README or the event page.

Use this fallback order:

1. Render the first slide from a local HTML slide deck.
2. Render the first page of a local or downloadable PDF.
3. Open the public slide URL in a browser-capable tool and capture the first slide.
4. Ask the user for an image or explicitly omit `image`.

Prefer the original slide aspect ratio and a readable resolution. Save the image beside `index.qmd` using the repository's existing convention (`feature.png`, `feature.jpeg`, or a descriptive slide-specific filename). If a screenshot tool is unavailable, use an available PDF/image renderer or browser automation; do not claim a screenshot was created unless the file exists and can be inspected.

If the first slide is only a logo, loading screen, or blank slide, use the first meaningful title slide instead and mention that choice in the final response. Do not alter the slide artwork except for cropping browser chrome or transparent margins.

### 5. Write the page

Create `talk/<slug>/index.qmd` with YAML matching the local site. Include only fields supported by the discovered information. A typical page looks like:

```yaml
---
title: "Talk title"
author:
  - Garrick Aden-Buie
description: |
  One or two sentences suitable for the talks listing.
date: "YYYY-MM-DD"
slug: talk-slug
image: feature.png

tags:
  - R
  - Quarto

talk_author: [Garrick Aden-Buie]
categories: [Conference]
event: "Event name"
event_url: https://example.com/event
location: "City, ST"
links:
  - icon: file-slides-fill
    name: Slides
    url: https://example.com/slides
  - icon: github
    name: Code
    url: https://github.com/example/repo
---
```

Use the site's existing icon names and link ordering when possible. Common link icons include `file-slides-fill`, `filetype-pdf`, `github`, and `play-btn-fill`.

If the slides are an embeddable Xaringan deck and the site convention supports it, add the existing embed pattern after the front matter, adjusting the link index carefully:

```r
```{r echo=FALSE}
options(htmltools.dir.version = TRUE)
xaringanExtra::embed_xaringan(rmarkdown::metadata$links[[1]]$url)
```
```

Use the correct link entry for the slide URL. Do not add an embed when the deck is not compatible or when doing so would require unsupported dependencies. Add an `## Abstract` section when an abstract is available and the local examples use one.

### 6. Validate

Check the result before reporting completion:

1. Confirm the new page and feature image are inside the intended talk directory.
2. Inspect YAML syntax and verify every published URL.
3. Render the page with the smallest applicable command, such as `quarto render talk/<slug>/index.qmd`, when Quarto and required dependencies are available.
4. Review the rendered page or output for a missing image, broken embed, malformed links, or an incorrect listing date.
5. Show the user the created path and summarize any metadata that was intentionally omitted.

Do not modify generated `_site`, `_freeze`, `public`, or `static` output merely to make the source page pass. Follow the repository's normal build workflow for generated files.

## Output

Finish with a concise summary containing:

- the created page path
- the feature image path, or why no image was added
- the discovered/published links
- validation performed
- only the high-value questions or decisions that remain
