library(twitteR)
library(ROAuth)
setup_twitter_oauth("4rAb7bQY8tEqxlZfovZq0pBwr","i8Ov6T4Yuha8hJmU7phIvRIU2qZ9TmH4XsL4jFcedHG1wc1xwJ","839510278299660288-j8LtSgEBuhwoU7QIC2uoCksQ2B5VbAS","rLdTRZ6Atss8BKU8ZvfHPUlg9WD4BUQ2PKG8svxJ0jI1N")
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
hashtags <- c("#travel", "#festival")
needle <- paste(hashtags, collapse = " AND ")
tweets <- searchTwitteR(needle,n=500)
tweets.df<-twListToDF(tweets)

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot

  
  
  
  
  output$distPlot <- renderPlot({
    dates <- strptime(tweets.df$created, format="%Y-%m-%d")
	selected <- which(tweets.df$retweetCount >= input$retweets)
    vector1<-tweets.df$retweetCount[selected]
	vector2<-dates[selected]
	vector3<-c(1:length(selected))
barplot(vector1,names.arg = vector3,col=c("aquamarine3", "coral"),xlab = "Number of tweets with selected retweet count",ylab = "Retweet count",main = "Most Trending (Events & Travel)",border = "black",ylim=c(0,max(vector1)+5))

    mytable<- data.frame(vector3,vector2,tweets.df$text[selected])
	output$mytable1 = renderDataTable({
  
    mytable
  }, options = list(orderClasses = TRUE))
  })
  
  
})

