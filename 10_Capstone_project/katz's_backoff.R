#' @description This function applies Katz's backoff model to predict the probability of last word. And it currently only limits to up to 3-gram 
#' @param input input strings e.g I love, I love you, I love you so
#' @param last_word a word, which probability will be predicted
#' @input the function will use several pre-computed information, including tri_gt_model (tri-gram model with good-turing adjustment coefficient. columns are "term", "first_terms", "last_term", "last_two", "freq" and "d_coefft"), bi_gt_model (bi-gram model with the same format), uni_model (uni-gram model), tri_leftover_pro (leftover probability for the unseen terms for tri-gram model, including columns "first_terms", and "leftoverprob"), bi_leftover_pro (leftover prabability for the unseen terms for bi-gram model)
#' @example tri_gt_model
#' first_terms last_term term freq d_coefft
#' i_love you i_love_you 1 0.3
#' i_love her i_love_her 2 0.1
#' i_love him i_love_him 3 0.2
#' @example tri_leftover_pro
#' first_terms leftoverprob
#' i_love 0.01
#' @output the probability of the last word 
#' @import data.table stringr
#' @references https://thachtranerc.wordpress.com/2016/04/12/katzs-backoff-model-implementation-in-r/

library(data.table)
library(stringr)

calculate_last_word_p <- function(input,last_word){
  prob=NULL
  input <- unlist(str_split(tolower(input), " "))
  if(length(input)>=2){ # If input string length >= 2, 
    input_terms <- paste(input[length(input)-1], input[length(input)], sep = "_")
    full_term <- paste(input_terms, last_word, sep = "_")
    # First check whether it is already in tri-gram
    if(full_term %in% tri_gt_model$term){ # if yes
      temp <- tri_gt_model[first_terms == input_terms]
      temp1 <- temp[term == full_term]
      all_freq = sum(temp$freq)
      prob=((temp1$d_coefft * temp1$freq) / all_freq)
    }else if(input_terms %in% tri_gt_model$first_terms){# for the unseen ones # for the ones, only first two words are in the tri-gram model
      beta_leftoverprob = tri_leftover_pro[first_terms == input_terms]$leftoverprob
      temp <- bi_gt_model[first_terms==input[length(input)] & !term %in% tri_gt_model[first_terms == input_terms]$last_two]
      if(last_word %in% temp$last_term){
        temp1 <- temp[first_terms==input[length(input)] & last_term == last_word]
        alpha = beta_leftoverprob / sum((temp$freq * temp$d_coefft) / sum(temp$freq))
        prob = alpha * ((temp1$freq * temp1$d_coefft ) / sum(temp$freq))
      }else{# get the last word probability from the uni-gram directly but take into consideration of the leftover probability from previous models
        temp <- uni_model[term == last_word]
        beta_leftoverprob1 <- bi_leftover_pro[first_terms==input[length(input)]]$leftoverprob
        prob <- beta_leftoverprob*beta_leftoverprob1*temp$freq* temp$d_coefft / sum(temp$freq)
      }
    }else{# first input terms are not in tri-gram model
      beta_leftoverprob = 1
      temp <- bi_gt_model[first_terms==input[length(input)]]
      if(last_word %in% temp$last_term){
        temp1 <- temp[first_terms==input[length(input)] & last_term == last_word]
        alpha = beta_leftoverprob / sum((temp$freq * temp$d_coefft) / sum(temp$freq))
        prob = alpha * ((temp1$freq * temp1$d_coefft ) / sum(temp$freq))
      }else{ #directly output from uni-model
        temp <- uni_model[term == last_word]
        beta_leftoverprob1 <- bi_leftover_pro[first_terms==input[length(input)]]$leftoverprob
        prob <- beta_leftoverprob1*temp$freq* temp$d_coefft / sum(temp$freq)
      }
    }
}else if(length(input)==1){ # if input have length ==1 
    full_term <- paste(input, last_word, sep = "_")
    if(full_term %in% bi_gt_model$term){
      temp <- bi_gt_model[first_terms == input]
      temp1 <- temp[term == full_term]
      all_freq = sum(temp$freq)
      prob=((temp1$d_coefft * temp1$freq) / all_freq)
    }else if(input %in% bi_gt_model$first_terms){
      beta_leftoverprob = bi_leftover_pro[first_terms == input]$leftoverprob
      temp <- uni_gt_model[!term %in% bi_gt_model[first_terms ==  input]$last_term]
      temp1 <- temp[term==input]
      alpha = beta_leftoverprob / sum((temp$freq * temp$d_coefft) / sum(temp$freq))
      prob = alpha * ((temp1$freq * temp1$d_coefft ) / sum(temp$freq))
    }
}
  return(prob) 
}