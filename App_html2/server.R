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


 H<-c()
 names_airlines<-c()
 countJetAirways<-0
 countGoAir<-0
 countIndigo<-0
 countSpiceJet<-0

 
 	 
 	 observe({valores<-renderText({
        input$checkGroup
      })
      data<-unlist(strsplit(valores(), split=" "))
      if(identical(toString(data[1]),"jetairways") || identical(toString(data[2]),"jetairways") || identical(toString(data[3]),"jetairways")  || identical(toString(data[4]),"jetairways") && countJetAirways==0){
      	 countJetAirways=1
      	 H<-append(H,followers_jetairways)
      	 names_airlines<-append(names_airlines,"Jet Airways")
      	 #output$value <- renderPrint({ H })
      	 output$value<-renderPlot({barplot(H,names.arg = names_airlines,xlab = "Airlines",ylab = "Followers",col = "pink",main = "Airline Followers Chart",border = "black") })
       }
        if(identical(toString(data[1]),"goair") || identical(toString(data[2]),"goair") || identical(toString(data[3]),"goair") || identical(toString(data[4]),"goair")  && countGoAir==0){
      	 countGoAir=1
      	 H<-append(H,followers_goair)
      	 names_airlines<-append(names_airlines,"Go Air")
      	 output$value<-renderPlot({barplot(H,names.arg = names_airlines,xlab = "Airlines",ylab = "Followers",col = "pink",main = "Airline Followers Chart",border = "black") })
       } 

         if(identical(toString(data[1]),"indigo") || identical(toString(data[2]),"indigo") || identical(toString(data[3]),"indigo") || identical(toString(data[4]),"indigo")&& countIndigo==0){
      	 countIndigo=1
      	 H<-append(H,followers_indigo)
      	 names_airlines<-append(names_airlines,"Indigo")
      	 output$value<-renderPlot({barplot(H,names.arg = names_airlines,xlab = "Airlines",ylab = "Followers",col = "pink",main = "Airline Followers Chart",border = "black") })
       }

       if(identical(toString(data[1]),"spicejet") || identical(toString(data[2]),"spicejet") || identical(toString(data[3]),"spicejet") || identical(toString(data[4]),"spicejet")  && countSpiceJet==0){
      	 countSpiceJet=1
      	 H<-append(H,followers_spicejet)
      	 names_airlines<-append(names_airlines,"Spicejet")
      	 output$value<-renderPlot({barplot(H,names.arg = names_airlines,xlab = "Airlines",ylab = "Followers",col = "pink",main = "Airline Followers Chart",border = "black") })
       } 
     

 	})

}