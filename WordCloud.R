library(tm)
library(SnowballC)
library(wordcloud)

# use the read.csv command followed by the file path
# row.names=1 tells R that the data in the first column are the names of the rows
#cars <- read.csv('/Users/majerus/Desktop/R/intro/data/cars.csv', row.names=1)             
jeopQ <- read.csv('C:\\RStudio\\data\\JEOPARDY_CSV.csv', stringsAsFactors = FALSE)



jeopCorpus <- Corpus(VectorSource(jeopQ$Question))
jeopCorpus <- tm_map(jeopCorpus, PlainTextDocument)
jeopCorpus <- tm_map(jeopCorpus, removePunctuation)
jeopCorpus <- tm_map(jeopCorpus, removeWords, stopwords('english'))
jeopCorpus <- tm_map(jeopCorpus, stemDocument)

jeopCorpus <- tm_map(jeopCorpus, removeWords, c('the', 'this', stopwords('english')))

wordcloud(jeopCorpus, max.words = 100, random.order = FALSE)

