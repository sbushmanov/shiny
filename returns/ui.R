library(ggplot2)
library(shiny)
shinyUI(pageWithSidebar(
        headerPanel('Historical Stocks vs Bonds returns'),
        sidebarPanel(h4("User inputs"),
                            sliderInput("slider",
                                        label = h5("Investment horizon"), 
                                        min = 1872,
                                        max = 2012,
                                        value = c(1950, 2000),
                                        format = "####"),
                            checkboxInput("adjust",
                                          label = "Adjust for inflation?",
                                          value = TRUE)
                
        ),
        mainPanel(
                h4("Check your inputs below:"),
                fluidRow(
                        column(6, 
                               h5('Starting date'),
                               verbatimTextOutput(paste0("startYear"))),
                        column(6, 
                               h5('Ending date'),
                               verbatimTextOutput("endYear"))
                ),
                h5('Adjust for inflation?'),
                verbatimTextOutput("adjust"),
#                 h4('Value of $1 invested in:'),
                plotOutput("chart")
        )
))