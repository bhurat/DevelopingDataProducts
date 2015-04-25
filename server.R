library(shiny)
library(lattice)
shinyServer(
        function(input,output){
                x<-numeric()
                y<-numeric()
                output$ui <- renderUI({
                        if (is.null(input$shape))
                                return()
                        
                        # Depending on input$input_type, we'll generate a different
                        # UI component and send it to the client.
                        switch(input$shape,
                               "Ellipse" = numericInput("Aval", "A = ", value = 2),
                               "Hyperbola (Vertical)" = numericInput("Aval", "A = ", value = 1),
                               "Hyperbola (Horizontal)" = numericInput("Aval", "A = ", value = 1),
                               "Circle" =  numericInput("Rad", "R = ", value = 1),
                               "Parabola (Vertical)" = numericInput("Foc", "F = ", value = 1),
                               "Parabola (Horizontal)" = numericInput("Foc", "F = ", value = 1)
                        )
                })
                output$ui2 <- renderUI({
                        if (is.null(input$shape)||input$shape=="Circle")
                                return()
                        
                        switch(input$shape,
                               "Ellipse" = numericInput("Bval", "B = ", value = 1),
                               "Hyperbola (Vertical)" = numericInput("Bval", "B = ", value = 1),
                               "Hyperbola (Horizontal)" = numericInput("Bval", "B = ", value = 1),
                               "Parabola (Vertical)" = numericInput("pperc","n = ", value = 5),
                               "Parabola (Horizontal)" = numericInput("pperc","n = ",value = 5)
                        )
                })
                output$plot<- renderPlot({
                        
                        if(input$shape == "Ellipse") {
                                a<-input$Aval
                                b<-input$Bval
                                n<-input$num
                                for (t in 0:(n-1)){
                                        x[t]=a*cos(2*pi*t/n)
                                        y[t]=-b*sin(2*pi*t/n)
                                }
                        }
                        if(input$shape == "Hyperbola (Vertical)") {
                                a<-input$Aval
                                b<-input$Bval
                                n<-input$num
                                for (t in 2:(n+1)){
                                        x[t]=b*tan(pi*t/(n+3)+pi/2)
                                        y[t]=(-1)^t*(a*1/cos(pi*t/(n+3)+pi/2))
                                }
                        }
                        if(input$shape == "Hyperbola (Horizontal)") {
                                a<-input$Aval
                                b<-input$Bval
                                n<-input$num
                                
                                for (t in 2:(n+1)){
                                        x[t]=(-1)^t*(a*1/cos(pi*t/(n+3)+pi/2))
                                        y[t]=b*tan(pi*t/(n+3)+pi/2)
                                }
                        }
                        if(input$shape == "Circle") {
                                r<-input$Rad
                                n<-input$num
                                for (t in 0:(n-1)){
                                        x[t]=r*cos(2*pi*t/n)
                                        y[t]=-r*sin(2*pi*t/n)
                                }
                        }
                        if(input$shape == "Parabola (Vertical)") {
                                f<-input$Foc
                                n<-input$num
                                P<-n/input$pperc
                                for (t in 0:(n-1)){
                                        x[t]=(-1)^t*2*f*t/P
                                        y[t]=f*(t/P)^2
                                }
                        }
                        if(input$shape == "Parabola (Horizontal)") {
                                f<-input$Foc
                                n<-input$num
                                P<-n/input$pperc
                                for (t in 0:(n-1)){
                                        x[t]=f*(t/P)^2
                                        y[t]=(-1)^t*2*f*t/P
                                }
                        }
                        par(pty="s")
                        plot(y~x,xlim=c(input$xmin,input$xmax),
                             ylim=c(input$ymin,input$ymax))
                })
        }
)