###################
#### functions ####
###################

#text processing 
preprocessing <- function(text){
  #create corpus
  text_corpus <- VCorpus(VectorSource(text))
  #remove anything except the english language and sapce
  NumPunct <- function(x){gsub("[^[:alpha:][:space:]]*","",x)}
  text.clean <- tm_map(text_corpus,content_transformer(NumPunct))
  #remove the links (URLs)
  removeURL <- function(x){gsub("http[^[:space:]]*","",x)}
  text.clean <- tm_map(text.clean,content_transformer(removeURL))
  text.clean <- tm_map(text.clean,removeNumbers)
  text.clean <- tm_map(text.clean,removeWords,stopwords())
  text.clean <- tm_map(text.clean,removePunctuation)
  text.clean <- tm_map(text.clean,stemDocument)
  text.clean <- tm_map(text.clean,stripWhitespace)
  text.clean <- tm_map(text.clean,removeWords,letters)
  text.clean <- tm_map(text.clean,content_transformer(tolower))
  text_processed <- as.character(text.clean[[1]])
  return(list(text.clean, text_processed))
}

#analyze tweets sentiment 
predict_new <- function(sentence){
  sentence <- preprocessing(sentence)
  feature <- as.data.frame(as.matrix(DocumentTermMatrix(sentence[[1]])))
  pred <- predict(model, feature)
  return(cat(substr(pred, start = 1, stop = 8)))
}


