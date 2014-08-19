library(ggplot2)
library(shiny)
shinyServer(
        function(input, output) {
                output$startYear <- renderPrint({paste0("January 1st, ", input$slider[1])})
                output$endYear <- renderPrint({paste0("December 31st, ", input$slider[2])})
                output$adjust <- renderPrint({ifelse(input$adjust, "Yes", "No")})
                output$chart <- renderPlot({
                        real <- input$adjust
                        startYear <- input$slider[1]
                        endYear <- input$slider[2]
                        
                        horizon <- subset(tidyData, tidyData$year %in% startYear:endYear)
                        horizon <- transform(horizon,
                                             cumrate1yr = cumprod(rate1yr),
                                             cumSPTotalReturn = cumprod(SPTotalReturn),
                                             cumRealRate1yr = cumprod(realRate1yr),
                                             cumRealSPTotalReturn = cumprod(realSPTotalReturn)
                        )
                        
                        horizon <- cbind(year = horizon[,1], round(horizon[,-1],2))
                        if (real) {
                                dataSet <- melt(horizon,
                                                measure.vars = c("cumRealRate1yr", "cumRealSPTotalReturn"),
                                                value.name = "ret")
                                p <- ggplot(data=dataSet, aes(x = year, y=ret, color = variable)) + 
                                        geom_line() +
                                        scale_color_discrete(name = "Asset class",
                                                             breaks = c("cumRealRate1yr", "cumRealSPTotalReturn"),
                                                             labels = c("bonds", "stocks"))
                        } else {
                                dataSet <- melt(horizon,
                                                measure.vars = c("cumrate1yr", "cumSPTotalReturn"),
                                                value.name = "ret")
                                p <- ggplot(data=dataSet, aes(x = year, y=ret, color = variable)) + 
                                        geom_line() +
                                        scale_color_discrete(name = "Asset class",
                                                             breaks = c("cumrate1yr", "cumSPTotalReturn"),
                                                             labels = c("bonds", "stocks"))
                        }
                        print(p + labs(x="Year", y="Value, $", title = "Value of $1"))
                })
        }
)

