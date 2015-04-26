library(shiny)
library(lattice)

shinyUI(fluidPage(
        
        title = "Conic Sections",
        ##Plots the graph here
        plotOutput('plot'), 
        
        hr(),
        
        fluidRow(
                column(3,
                       h4("Conic Section"),
                       ##Here's where you select your shape
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
                        ##This column contains dynamic UI component. Look in  
                        ##server.R for how it works.
                        uiOutput("ui"),
                        uiOutput("ui2")
                )),
                column(4,
                       ##Here is where resolution and graph axis limits are chosen
                       numericInput("num","Resolution",value = 300),
                       numericInput("xmin","Xmin = ",value = -10),
                       numericInput("xmax","Xmax = ",value = 10),
                       numericInput("ymin","Ymin = ",value = -10),
                       numericInput("ymax","Ymax = ",value = 10)
                )
        ),
        ##Lastly, this loads up the documentation
        includeHTML("ConSecDocumentation.html")
))


