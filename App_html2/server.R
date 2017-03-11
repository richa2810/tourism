library(shiny)
library(twitteR)
library(ROAuth)
require(httr)
oauth_endpoints("twitter")
setup_twitter_oauth("vk8sI89Jr6AAIXNgP6duZ08bC","ho18g4lXYThvDgx0PiOGtLMAWjfBlqem0zSnWAS9cN5hXRni9n","794946058300178432-Vc3mcDZBOvd0qeWLC9IA2GGbPXNr9bK","DlZQt3bXFM8hzBBr4fCjJgWzCUauhHMpLqNfZTCQr9lhe")


function(input, output) {

user<-getUser("goairlinesindia")
followers_goair<-user$followersCount

user<-getUser("IndiGo6E")
followers_indigo<-user$followersCount

user<-getUser("jetairways")
followers_jetairways<-user$followersCount

user<-getUser("flyspicejet")
followers_spicejet<-user$followersCount

user<-getUser("HaridwarTour")
followers_haridwar<-user$followersCount

user<-getUser("shirditourism")
followers_shirditourism<-user$followersCount

user<-getUser("dwarka_tourism")
followers_dwarka_tourism<-user$followersCount

user<-getUser("mathuratemple")
followers_mathuratemple<-user$followersCount

 H<-c()
 HPilgrimage<-c()
 names_airlines<-c()
 names_pilgrimage<-c()
 countJetAirways<-0
 countGoAir<-0
 countIndigo<-0
 countSpiceJet<-0
 
 countShirdi<-0
 countMathura<-0
 countHaridwar<-0
 countDwarka<-0


user<-getUser("haridwartour")
user$toDataFrame()
followers <- user$getFollowers()
followers.df<-twListToDF(followers)
locations<-followers.df$location
locations<-setdiff(locations,"")
mytable<- data.frame(locations)
  output$mytable1 = renderDataTable({ 
    mytable
  }, options = list(orderClasses = TRUE, pageLength = 5))

tweets<-searchTwitter("#shirdi",n=3000)
tweetsText <- unlist(Map(statusText, tweets))
tweetsCorpus <- Corpus(VectorSource(tweetsText))


tweetsCorpus <- tm_map(tweetsCorpus, removePunctuation)
tweetsCorpus <- tm_map(tweetsCorpus, removeNumbers)
# added tolower
tweetsCorpus <- tm_map(tweetsCorpus, tolower)
tweetsCorpus <- tm_map(tweetsCorpus, removeWords, c("amazon","kindle","amidst","every","india", "nature", "via", "is", "the", "in", "out", "year", "days", "can", "travel", "hotel", "via", "thanks", "you", "things", "incredibleindia", "travel","love" ,"lover","hidden","travelist","tour", "trip", "hptdc", "https", "himachal", "tourist", "news", "amp", "clicks"))



# moved stripWhitespace
tweetsCorpus <- tm_map(tweetsCorpus, stripWhitespace)


# here is where we'd use different weighting functions, for example TfIdf
tweetsTDM <- TermDocumentMatrix(tweetsCorpus,
control = list(
#tokenize = tokenize,        # use the opennlp POS tokenizer
# tokenize = NGramTokenizer,  # use the RWeka NGram tokenizer
# stemming = TRUE,            # perform word stemming - not working
stopwords = TRUE,             # remove stopwords
tolower = TRUE,               # convert terms to lowercase
removePunctuation = TRUE))    # remove punctuation


tweetsWordFrequencies <- apply(tweetsTDM, 1, sum)
#tweetsWordFrequencies
tweetsFrequentWords <- sort(tweetsWordFrequencies, decreasing=T)[1:100]
tweetsFrequentWords
library("wordcloud")
output$wordcloud <- renderPlot({
wordcloud(words = names(tweetsFrequentWords), freq = tweetsFrequentWords, min.freq = 3,
random.order = F)

})




 	 # observe({valores<-renderText({
   #      input$checkGroup
   #    })
   #    data<-unlist(strsplit(valores(), split=" "))
   #    if(identical(toString(data[1]),"jetairways") || identical(toString(data[2]),"jetairways") || identical(toString(data[3]),"jetairways")  || identical(toString(data[4]),"jetairways") && countJetAirways==0){
   #    	 countJetAirways=1
   #    	 H<-append(H,followers_jetairways)
   #    	 names_airlines<-append(names_airlines,"Jet Airways")
   #    	 #output$value <- renderPrint({ H })
   #    	 output$value<-renderPlot({barplot(H,names.arg = names_airlines,xlab = "Airlines",ylab = "Followers",col = "pink",main = "Airline Followers Chart",border = "black") })
   #     }
   #      if(identical(toString(data[1]),"goair") || identical(toString(data[2]),"goair") || identical(toString(data[3]),"goair") || identical(toString(data[4]),"goair")  && countGoAir==0){
   #    	 countGoAir=1
   #    	 H<-append(H,followers_goair)
   #    	 names_airlines<-append(names_airlines,"Go Air")
   #    	 output$value<-renderPlot({barplot(H,names.arg = names_airlines,xlab = "Airlines",ylab = "Followers",col = "pink",main = "Airline Followers Chart",border = "black") })
   #     } 

   #       if(identical(toString(data[1]),"indigo") || identical(toString(data[2]),"indigo") || identical(toString(data[3]),"indigo") || identical(toString(data[4]),"indigo")&& countIndigo==0){
   #    	 countIndigo=1
   #    	 H<-append(H,followers_indigo)
   #    	 names_airlines<-append(names_airlines,"Indigo")
   #    	 output$value<-renderPlot({barplot(H,names.arg = names_airlines,xlab = "Airlines",ylab = "Followers",col = "pink",main = "Airline Followers Chart",border = "black") })
   #     }

   #     if(identical(toString(data[1]),"spicejet") || identical(toString(data[2]),"spicejet") || identical(toString(data[3]),"spicejet") || identical(toString(data[4]),"spicejet")  && countSpiceJet==0){
   #    	 countSpiceJet=1
   #    	 H<-append(H,followers_spicejet)
   #    	 names_airlines<-append(names_airlines,"Spicejet")
   #    	 output$value<-renderPlot({barplot(H,names.arg = names_airlines,xlab = "Airlines",ylab = "Followers",col = "pink",main = "Airline Followers Chart",border = "black") })
   #     } 
     


     observe({valores1<-renderText({
        input$checkGroup1
      })

      data<-unlist(strsplit(valores1(), split=" "))
      if(identical(toString(data[1]),"haridwar") || identical(toString(data[2]),"haridwar") || identical(toString(data[3]),"haridwar")  || identical(toString(data[4]),"haridwar") && countHaridwar==0){
         countHaridwar=1
         HPilgrimage<-append(HPilgrimage,followers_haridwar)
         names_pilgrimage<-append(names_pilgrimage,"Haridwar")
         #output$value <- renderPrint({ H })
         output$value1<-renderPlot({barplot(HPilgrimage,names.arg = names_pilgrimage,xlab = "Pilgriimage Cities",ylab = "Followers",col = "#f6780b",main = "Pilgrimage Cities Followers Chart",border = "black") })
       }
        if(identical(toString(data[1]),"shirdi") || identical(toString(data[2]),"shirdi") || identical(toString(data[3]),"shirdi") || identical(toString(data[4]),"shirdi")  && countShirdi==0){
         countShirdi=1
         HPilgrimage<-append(HPilgrimage,followers_shirditourism)
         names_pilgrimage<-append(names_pilgrimage,"Shirdi")
         output$value1<-renderPlot({barplot(HPilgrimage,names.arg = names_pilgrimage,xlab = "Pilgriimage Cities",ylab = "Followers",col = "#f6780b",main = "Pilgrimage Cities Followers Chart",border = "black") })
       } 

         if(identical(toString(data[1]),"dwarka") || identical(toString(data[2]),"dwarka") || identical(toString(data[3]),"dwarka") || identical(toString(data[4]),"dwarka")&& countDwarka==0){
         countDwarka=1
         HPilgrimage<-append(HPilgrimage,followers_dwarka_tourism)
         names_pilgrimage<-append(names_pilgrimage,"Dwarka")
         output$value1<-renderPlot({barplot(HPilgrimage,names.arg = names_pilgrimage,xlab = "Pilgriimage Cities",ylab = "Followers",col = "#f6780b",main = "Pilgrimage Cities Followers Chart",border = "black") })
       }

       if(identical(toString(data[1]),"mathura") || identical(toString(data[2]),"mathura") || identical(toString(data[3]),"mathura") || identical(toString(data[4]),"mathura")  && countMathura==0){
         countMathura=1
         HPilgrimage<-append(HPilgrimage,followers_mathuratemple)
         names_pilgrimage<-append(names_pilgrimage,"Mathura")
         output$value1<-renderPlot({barplot(HPilgrimage,names.arg = names_pilgrimage,xlab = "Pilgriimage Cities",ylab = "Followers",col = "#f6780b",main = "Pilgrimage Cities Followers Chart",border = "black") })
       } 

 	})

}