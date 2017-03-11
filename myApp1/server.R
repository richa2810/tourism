
library(shiny)
library(twitteR)
library(ROAuth)
require(httr)
oauth_endpoints("twitter")
setup_twitter_oauth("4rAb7bQY8tEqxlZfovZq0pBwr","i8Ov6T4Yuha8hJmU7phIvRIU2qZ9TmH4XsL4jFcedHG1wc1xwJ","839510278299660288-j8LtSgEBuhwoU7QIC2uoCksQ2B5VbAS","rLdTRZ6Atss8BKU8ZvfHPUlg9WD4BUQ2PKG8svxJ0jI1N")

function(input, output) {

user<-getUser("innGOA")
followers_goa<-user$followersCount


user<-getUser("srigokarna")

followers_gokarna<-user$followersCount
user<-getUser("pondytourism")
followers_pondicherry<-user$followersCount


user<-getUser("AndamanTourism_")
followers_havelockAndaman<-user$followersCount


 H<-c()
 names_beachDestinations<-c()
 countGoa<-0
 countGokarna<-0
 countPondicherry<-0
 countAndaman<-0
  
 	 
 	 observe({valores<-renderText({
        input$checkGroup
      })
      data<-unlist(strsplit(valores(), split=" "))
      if(identical(toString(data[1]),"goa") || identical(toString(data[2]),"goa") || identical(toString(data[3]),"goa")  || identical(toString(data[4]),"goa") && countGoa==0){
      	 countGoa=1
      	 H<-append(H,followers_goa)
      	 names_beachDestinations<-append(names_beachDestinations,"Goa")
      	 #output$value <- renderPrint({ H })
      	 output$value<-renderPlot({barplot(H,names.arg = names_beachDestinations,xlab = "Beach Destinations",ylab = "Followers",col = "lightblue",main = "Beach Destinations Followers Chart",border = "black") })
       }
        if(identical(toString(data[1]),"gokarna") || identical(toString(data[2]),"gokarna") || identical(toString(data[3]),"gokarna") || identical(toString(data[4]),"gokarna")  && countGokarna==0){
      	 countGokarna=1
      	 H<-append(H,followers_gokarna)
      	 names_beachDestinations<-append(names_beachDestinations,"GoKarna")
      	 output$value<-renderPlot({barplot(H,names.arg = names_beachDestinations,xlab = "Beach Destinations",ylab = "Followers",col = "lightblue",main = "Beach Destinations Followers Chart",border = "black") })
       } 

         if(identical(toString(data[1]),"havelockAndaman") || identical(toString(data[2]),"havelockAndaman") || identical(toString(data[3]),"havelockAndaman") || identical(toString(data[4]),"havelockAndaman")&& countAndaman==0){
      	 countAndaman=1
      	 H<-append(H,followers_havelockAndaman)
      	 names_beachDestinations<-append(names_beachDestinations,"HavelockAndaman")
      	 output$value<-renderPlot({barplot(H,names.arg = names_beachDestinations,xlab = "Beach Destinations",ylab = "Followers",col = "lightblue",main = "Beach Destinations Followers Chart",border = "black") })
       }

       if(identical(toString(data[1]),"pondicherry") || identical(toString(data[2]),"pondicherry") || identical(toString(data[3]),"pondicherry") || identical(toString(data[4]),"pondicherry")  && countPondicherry==0){
      	 countPondicherry=1
      	 H<-append(H,followers_pondicherry)
      	 names_beachDestinations<-append(names_beachDestinations,"Pondicherry")
      	 output$value<-renderPlot({barplot(H,names.arg = names_beachDestinations,xlab = "Beach Destinations",ylab = "Followers",col = "lightblue",main = "Beach Destinations Followers Chart",border = "black") })
       } 
     

 	})

}