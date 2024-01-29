library(shiny)
library(bslib)

my_value_box_ui <- function(id) {
  uiOutput(NS(id, "value_box"))
}

my_value_box_server <- function(
  id,
  value,
  state,
  title = "KPI",
  icon = NULL
) {
  stopifnot(is.reactive(value))
  stopifnot(is.reactive(state))

  moduleServer(
    id,
    function(input, output, session) {
      output$value_box <- renderUI({
        value_box(
          title = title,
          showcase = if (!is.null(icon)) bsicons::bs_icon(icon),
          value = value(),
          theme = if (value() > 0) state()
        )
      })
    }
  )
}

ui <- page_fluid(
  layout_column_wrap(
    width = 1 / 2,
    class = "mt-4",
    my_value_box_ui("engagement"),
    my_value_box_ui("complain"),
    sliderInput("value_engaged", "Engagement", 0, 100, 0, 5, ticks = FALSE),
    sliderInput("value_complain", "Complaints", 0, 100, 0, 5, ticks = FALSE)
  )
)

server <- function(input, output, session) {
  vb_engaged_state <- reactive({
    if (!isTruthy(input$value_engaged)) {
      return(NULL)
    }

    if (input$value_engaged > 50) {
      "success"
    } else if (input$value_engaged > 25) {
      "warning"
    } else {
      "danger"
    }
  })

  vb_complain_state <- reactive({
    if (!isTruthy(input$value_complain)) {
      return(NULL)
    }

    if (input$value_complain < 30) {
      "success"
    } else if (input$value_complain < 50) {
      "warning"
    } else {
      "danger"
    }
  })

  vb_engaged <- my_value_box_server(
    "engagement",
    value = reactive(input$value_engaged),
    state = vb_engaged_state,
    title = "Engagement",
    icon = "chat-text-fill"
  )

  vb_complain <- my_value_box_server(
    "complain",
    value = reactive(input$value_complain),
    state = vb_complain_state,
    title = "Complaints",
    icon = "emoji-smile-fill"
  )
}

shinyApp(ui, server)
