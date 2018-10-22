library(shiny)
library(shinyFiles)

ui <- shinyUI(fluidPage(
  tags$script(src = "script.js"),

  titlePanel("Example"),
  actionButton("open.modal", "Open modal"),
  shiny::modalDialog(
    shinySaveButton("save", "Save file", "Save file as ...", filetype=list(xlsx="xlsx"))
  )

))

server <- shinyServer(function(input, output, session) {

  observeEvent(input$open.modal, {
    showModal(modalDialog(
      shinySaveButton("more", "Another save", "Save file as . . .", filetype=list(xlsx="xlsx"))
    ))
  })

  observe({
    volumes <- c("UserFolder"="D:/Data")
    shinyFileSave(input, "save", roots=getVolumes(), session=session)
    fileinfo <- parseSavePath(volumes, input$save)
    data <- data.frame(a=c(1,2))
  })
})

shinyApp(ui = ui, server = server)
