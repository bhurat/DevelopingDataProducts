library(shiny)
library(lattice)

shinyUI(fluidPage(
        
        title = "Conic Sections",
        
        plotOutput('plot'),
        
        hr(),
        
        fluidRow(
                column(3,
                       h4("Conic Section"),
                       selectInput("shape", "SHAPE: ", c("Ellipse",
                                                         "Hyperbola (Vertical)",
                                                         "Hyperbola (Horizontal)",
                                                         "Circle",
                                                         "Parabola (Vertical)",
                                                         "Parabola (Horizontal)"),
                                   selected = NULL, multiple = FALSE,
                                   selectize = TRUE, width = NULL, size = NULL)
                ),
                column(5, wellPanel(
                        # This outputs the dynamic UI component
                        uiOutput("ui"),
                        uiOutput("ui2")
                )),
                column(4,
                       numericInput("num","Resolution",value = 300),
                       numericInput("xmin","Xmin = ",value = -10),
                       numericInput("xmax","Xmax = ",value = 10),
                       numericInput("ymin","Ymin = ",value = -10),
                       numericInput("ymax","Ymax = ",value = 10)
                )
        ),
        includeHTML("ConSecDocumentation.html")
))


