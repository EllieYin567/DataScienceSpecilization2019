#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # Application title
    titlePanel(h2("Word prediction using n-gram models",h4("- 1-gram, 2-gram and 3-gram models with Good-turing adjusting and Katz's Backoff model"), align = "center")),
    
    # Layout
    #splitLayout(#object1
    #cellWidths = c("50%","10%", "40%"),
    #textInput("input","please type in the word (no space at the end)"),
        #object2
        #submitButton("Submit"),
        #object3
    #plotOutput("pro_plot")
    # )

    fluidRow(
        column(width = 6,
               textInput("input","please type in the word (no space at the end)"),
               submitButton("Submit")
        ),
        column(width = 6,
               plotOutput("pro_plot")
        ),
    )
))
