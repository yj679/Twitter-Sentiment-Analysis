library(shiny)

fluidPage(
  titlePanel('Sentiment Analysis DEMO'),
  textInput(inputId = 'text', label = 'Write a Sentence:', value = 'I am happy now!'),
  actionButton(inputId = 'click','Start Analyse'),
  textOutput(outputId = 'result')
)