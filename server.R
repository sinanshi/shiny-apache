library(ggplot2)
library(plotly)


plotfun <- function(input){
    diagc <- (input$mychooser$right)

    if (length(diagc)==0){ 
        showtb <- mock
        gg <- ggplot(showtb, aes(x=pre, y=ob))+
            geom_abline(color="black", linetype=2, 
                        intercept = 0, slope = 1)

    }
    else { 
        showtb <- mock[diag %in% diagc]

        gg <- ggplot(showtb, aes(x=pre, y=ob), xlim()) +
            xlim(0, 1) + ylim(0, 1)+
            geom_point(aes(color=diag)) + geom_smooth(color="red") + 
            geom_abline(color="black", linetype=2, 
                        intercept = 0, slope = 1)
    }
    gg
}


function(input, output, session) {
     output$interactive <- eventReactive(input$interactive, {
                            renderPlot(plotfun(input))
                            ggplotly()
                          })
    output$someplot <- renderPlot(plotfun(input))
  
}
