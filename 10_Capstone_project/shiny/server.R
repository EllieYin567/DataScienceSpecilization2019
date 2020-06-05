#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(stringr)
library(data.table)
library(imager)
library(ggplot2)

tri_gt_model_red <- readRDS("tri_gt_model_reduced.rds")
bi_gt_model_red <- readRDS("bi_gt_model_reduced.rds")
tri_leftover_pro <- readRDS("tri_leftover_probability.rds")
bi_leftover_pro <- readRDS("bi_leftover_probability.rds")
# import the function
predict_next_word_red <- function(input,n=3){
    input <- unlist(str_split(tolower(input), " "))
    if(length(input)>=2){ # If input string length >= 2, e.g I love, I love you, I love you so
        input_terms <- paste(input[length(input)-1], input[length(input)], sep = "_")
        # First check whether it is already in tri-gram
        if(input_terms %in% tri_gt_model_red$first_terms){ # if yes
            temp <- tri_gt_model_red[first_terms == input_terms]
            all_freq = sum(temp$freq)
            temp$finalProb = ((temp$d_coefft * temp$freq) / all_freq)
            # For now output the most likely one 
            next_word <- temp[order(finalProb, decreasing = T)][1:n, list(finalProb, last_term)]
        }else if(input[length(input)] %in% bi_gt_model_red$first_terms){ # check bi-gram # if exist in bi-gram model
            beta_leftoverprob = ifelse(is.null(tri_leftover_pro[first_terms == input[length(input)]]$leftoverprob), 1,tri_leftover_pro[first_terms == input[length(input)]]$leftoverprob)  # equal to 1 
            temp <- bi_gt_model_red[first_terms==input[length(input)]]
            temp1 <- temp[!term %in% tri_gt_model_red$last_two]
            alpha = beta_leftoverprob / sum((temp1$freq * temp1$d_coefft) / sum(temp1$freq))
            temp1$finalProb = alpha * ((temp1$freq * temp1$d_coefft ) / sum(temp1$freq))
            next_word <- temp1[order(finalProb, decreasing = T)][1:n, list(finalProb, last_term)]
        } else{next_word=NULL}
    }else if(length(input)==1 && input %in% bi_gt_model_red$first_terms){ # if input have length ==1 
        temp <- bi_gt_model_red[first_terms == input]
        all_freq = sum(temp$freq)
        temp$finalProb = ((temp$d_coefft * temp$freq) / all_freq)
        # For now output the most likely one 
        next_word <- temp[order(finalProb, decreasing = T)][1:n, list(finalProb, last_term)]
    }else{next_word=NULL}
    return(next_word) 
}

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    # the prediction function 
    res <- reactive({ 
        predict_next_word_red(input$input)
        })
    # output$pro_plot <- renderPlot({ ggplot(data= res, aes(last_term, finalProb)) + geom_bar(stat = "identity")})
    
    output$pro_plot <- renderPlot({
    if(!is.null(res())){
        data=res()
        ggplot(data, aes(x = last_term, y = finalProb, color = finalProb, fill = finalProb)) + geom_bar(stat = "identity") + theme_bw() + theme(legend.position = "none", axis.text.x = element_text(size = 15, face = "bold"), axis.title.x = element_blank(), plot.title = element_text(hjust = 0.5, face = "italic")) + ggtitle("Predicted top 3 next words") 
    }else if(is.null(res()) && grepl("[[:alnum:]]+",input$input)){
        pic = load.image("Screen Shot 2020-06-04 at 12.28.59 PM.png")
       plot(pic, axes=FALSE)
    }
    
        })
})
