#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(randomForest)
library(nnet)
library(caret)
library(e1071)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict iris species"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       h3("Input observations"),
       sliderInput("slider1",
                   "Sepal.Length:",
                   min = 4.3,
                   max = 7.9,
                   value = 0.1), 
       sliderInput("slider2",
                   "Sepal.Width:",
                   min = 2.0,
                   max = 4.4,
                   value = 0.1), 
       sliderInput("slider3",
                   "Petal.Length:",
                   min = 1.0,
                   max = 6.9,
                   value = 0.1), 
       sliderInput("slider4",
                   "Petal.Width:",
                   min = 0.1,
                   max = 2.5,
                   value = 0.1), 
       checkboxInput("model1","generalized linear regression"), 
       checkboxInput("model2","random forest"), 
       submitButton("Submit") # submit!
    ),
    
    # Show a plot of the prediction
    mainPanel(
       uiOutput("predtPlot1"),
       textOutput("predt_spec1"),
       uiOutput("predtPlot2"),
       textOutput("predt_spec2")
    )
  )
))
