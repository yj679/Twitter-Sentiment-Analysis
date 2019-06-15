library(tm)
library(caret)
library(naivebayes)
library(SnowballC)
library(shiny)

model <- load('model.rda', .GlobalEnv)
source('sentiment_project.R')

shinyServer(function(input, output){
  txt <- eventReactive(input$click, {as.character(input$text)})
  output$result <- renderPrint({
    cat(predict_new(txt()))
  })
}
  
)

