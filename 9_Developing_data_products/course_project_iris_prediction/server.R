#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
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

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  model1 <- nnet::multinom(Species ~.,data = iris)
  model2 <- caret::train(Species ~., data = iris, method = "rf")
  
  predt_spec1 <- reactive({
  new_data <- data.frame(Sepal.Length = input$slider1, Sepal.Width = input$slider2, Petal.Length = input$slider3, Petal.Width = input$slider4)
  as.character(predict(model1, new_data, "class"))
  })
  predt_spec2 <- reactive({
  new_data <- data.frame(Sepal.Length = input$slider1, Sepal.Width = input$slider2, Petal.Length = input$slider3, Petal.Width = input$slider4)
  as.character(predict(model2, new_data))
  })
  
  output$predtPlot1 <- renderUI({
          if(input$model1){
                  if(predt_spec1() == "setosa"){
                          img(src='setosa.png', height = '300px')
                  }else if(predt_spec1() == "versicolor"){
                          img(src='versicolor.png', height = '300px')    
                  }else{
                          img(src='virginica.png', height = '300px')       
                  }   
          }
          
  })
  
output$predt_spec1 <- renderText({
        if(input$model1){
                paste0("Based on GLM, it is ", predt_spec1())     
        }
                })
output$predtPlot2 <- renderUI({
        if(input$model2){
                if(predt_spec2() == "setosa"){
                        img(src='setosa.png', height = '300px')
        }else if(predt_spec2() == "versicolor"){
                        img(src='versicolor.png', height = '300px')    
        }else{
                        img(src='virginica.png', height = '300px')       
        }
                }
        
})
output$predt_spec2 <- renderText({
        if(input$model2){
                paste("Based on Random Forest, it is ", predt_spec2())     
        }
                })
  })

