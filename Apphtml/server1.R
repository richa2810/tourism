library(shiny)
library(twitteR)
library(ROAuth)
require(httr)
oauth_endpoints("twitter")
setup_twitter_oauth("vk8sI89Jr6AAIXNgP6duZ08bC","ho18g4lXYThvDgx0PiOGtLMAWjfBlqem0zSnWAS9cN5hXRni9n","794946058300178432-Vc3mcDZBOvd0qeWLC9IA2GGbPXNr9bK","DlZQt3bXFM8hzBBr4fCjJgWzCUauhHMpLqNfZTCQr9lhe")

# Define server logic for random distribution application
function(input, output) {

user<-getUser("goairlinesindia")
followers_goair<-user$followersCount

user<-getUser("airasia")
followers_airasia<-user$followersCount

user<-getUser("IndiGo6E")
followers_indigo<-user$followersCount
H<-c()

# H <- c(followers_indigo,followers_airasia,followers_goair)
 n <- c("AisAsia")

# reactive({
#   for (i in 1:length(input$airline)) {
#   if(input$airline[i]=="airasia") {
#       H<-append(H,followers_airasia)
#   }
# }
# })
# reactive({

#   a<-renderText({input$airline})
#   data<-unlist(strsplit(a(), split=" "))
#       print(data)

#   })




  # rawData <- (function(){
  #   a<-paste("#",input$airline,sep="")
  #   airlinetweets <- searchTwitter(a, n=4)
  #   airlinetweetsdf<-twListToDF(airlinetweets)
  # })
  # airlineemirates<-searchTwitter("#emirates",n=4)
  #  airlineemiratesdf<-twListToDF(airlineemirates)
  
  # Reactive expression to generate the requested distribution. This is 
  # called whenever the inputs change. The output expressions defined 
  # below then all used the value computed from this expression
  # data <- reactive({
  #   dist <- switch(input$airline,
  #                  emirates = rnorm,
  #                  unif = runif,
  #                  lnorm = rlnorm,
  #                  exp = rexp,
  #                  rnorm)
    
  #   dist(input$n)
  # })
  
  # Generate a plot of the data. Also uses the inputs to build the 
  # plot label. Note that the dependencies on both the inputs and
  # the data reactive expression are both tracked, and all expressions 
  # are called in the sequence implied by the dependency graph
  # output$plot <- renderPlot({
  #   dist <- input$dist
  #   n <- input$n
    
  #   hist(data(), 
  #        main=paste('r', dist, '(', n, ')', sep=''))
  # })
  
  # # Generate a summary of the data
  # output$summary <- renderPrint({
  #   summary(data())
  # })
  
  # Generate an HTML table view of the data
  # output$table <- renderTable({
  #    head(rawData()[1],n=5)
  # })

  # output$summary <- renderPrint({
  #     print(a())
  #   })

  output$summary<-renderText({ 

    print(input$airline1)

    # airasia      <- "airasia"       %in% input$airline
    # goair    <- "goair"     %in% input$airline
    # indigo <- "indigo"  %in% input$airline

    # if (airasia & goair & indigo){
    #   s <- 8 
    # } else if (airasia & goair){
    #   s <- 5
    # } else if (airasia){
    #   s <-1
    # } else if (goair){
    #   s <-2
    # } else if (indigo) {
    #   s <- 3
    # }  

    
  })

  #   output$plot <- renderPlot({
    
  #   # Render a barplot
  #   barplot(H,names.arg = n,xlab = "Airlines",ylab = "Followers",col = "pink",main = "Airline Followers Chart",border = "black")
  # })
    
}
  

