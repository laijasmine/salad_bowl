#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Salad Bowl"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            #https://stackoverflow.com/questions/49250167/how-to-create-a-countdown-timer-in-shiny
            actionButton("timer","Start"),
            actionButton("goButton", "Next"),
            actionButton("goButton", "Toss Bowl For Next Round"),
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
           #textOutput("your_word")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    #your_word <- renderText()

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
