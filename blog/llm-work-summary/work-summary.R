# Query issues and pull requests from this week -------------------------------
library(dplyr)
library(purrr)
library(gh)

author <- "gadenbuie"
start_date <- Sys.Date() - 7

search_created <- sprintf("author:%s created:>%sT00:00:00Z", author, start_date)
search_closed <- sprintf("author:%s closed:>%sT00:00:00Z", author, start_date)

created <- gh("/search/issues", q = search_created, .limit = Inf)
closed <- gh("/search/issues", q = search_closed, .limit = Inf)

work_data <-
  c(created$items, closed$items) |>
    map(function(issue) {
      tibble(
        repository = sub(
          "https://api.github.com/repos/",
          "",
          issue$repository_url
        ),
        title = issue$title,
        created_at = issue$created_at,
        closed_at = issue$closed_at,
        url = issue$html_url,
        state = issue$state,
        is_issue = is.null(issue$pull_request),
        body = issue$body
      )
    }) |>
    list_rbind() |>
      mutate(
        personal = grepl("(^gadenbuie)|bluesky-comments", repository),
        action_at = coalesce(closed_at, created_at),
        action = recode(state, open = "opened"),
        action = paste(action, if_else(is_issue, "an issue", "a PR")),
      ) |>
      arrange(personal, repository, is_issue, action_at)

# Prepare the work data summary -----------------------------------------------
library(epoxy)

work_summary <-
  epoxy(
    "<work-item>
    Action: {action}
    Title: {title}
    Type: {ifelse(personal, 'Personal Work', 'Professional Work')}
    Link: {url}

    <work-description>
    {body}
    </work-description>
    </work-item>",
    .collapse = "\n\n"
  )

# Summarize with the LLM ------------------------------------------------------
library(ellmer)

chat <- chat_claude(
  system_prompt = epoxy(
    "You are an assistant who keeps track of the work I do each week. Your goal is to
    faithfully and accurately report the work I do to my boss while making sure that
    the impact of my work is clearly articulated. You are clear and concise and use
    direct language, preferring to match the terminology and phrases that I use. You
    respond directly without any preamble."
  )
)

chat$chat(
  interpolate(
    "Summarize my work over the last week for a team update in prose.
    Focus more on pull requests; issues are less important and just provide context.
    Write in prose with full paragraphs.
    Focus on the user impact of the work first and secondarily on the internal impact of dev changes.

    Summarize the work using markdown under two headings:
    '## Professional Work' and '## Personal Work'.
    Include direct links to any mentioned pull requests using markdown syntax.
    Use the first-person and try to sound like me.

    <work-summary>
    {{ work_summary }}
    </work-summary>"
  )
)

# To get the LLM response as markdown:
contents_markdown(chat$last_turn())
