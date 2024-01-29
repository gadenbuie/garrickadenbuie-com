library(shiny)
library(bslib)

my_value_box_ui <- function(id) {
  uiOutput(NS(id, "value_box"))
}

my_value_box_server <- function(id, title = "KPI", icon = NULL) {
  moduleServer(
    id,
    function(input, output, session) {
      value <- reactiveVal(0)

      state <- reactiveVal(NULL)

      output$value_box <- renderUI({
        value_box(
          title = title,
          showcase = if (!is.null(icon)) bsicons::bs_icon(icon),
          value = value(),
          theme = if (value() > 0) state()
        )
      })

      list(
        value = value,
        state = state
      )
    }
  )
}

ui <- page_fluid(
  layout_column_wrap(
    width = 1/2,
    class = "mt-4",
    my_value_box_ui("engagement"),
    my_value_box_ui("complain"),
    sliderInput("value_engaged", "Engagement", 0, 100, 0, 5, ticks = FALSE),
    sliderInput("value_complain", "Complaints", 0, 100, 0, 5, ticks = FALSE)
  )
)

server <- function(input, output, session) {
   vb_engaged <- my_value_box_server(
     "engagement",
     title = "Engagement",
     icon = "chat-text-fill"
   )

   vb_complain <- my_value_box_server(
     "complain",
     title = "Complaints",
     icon = "emoji-smile-fill"
   )

  observeEvent(input$value_engaged, {
    vb_engaged$value(input$value_engaged)

    if (input$value_engaged > 50) {
      vb_engaged$state("success")
    } else if (input$value_engaged > 25) {
      vb_engaged$state("warning")
    } else {
      vb_engaged$state("danger")
    }
  })

 observeEvent(input$value_complain, {
    vb_complain$value(input$value_complain)

    if (input$value_complain < 30) {
      vb_complain$state("success")
    } else if (input$value_complain < 50) {
      vb_complain$state("warning")
    } else {
      vb_complain$state("danger")
    }
  })
}

shinyApp(ui, server)
