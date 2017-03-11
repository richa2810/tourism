library(shiny)
library(twitteR)
library(ROAuth)
require(httr)
oauth_endpoints("twitter")
setup_twitter_oauth("4rAb7bQY8tEqxlZfovZq0pBwr","i8Ov6T4Yuha8hJmU7phIvRIU2qZ9TmH4XsL4jFcedHG1wc1xwJ","839510278299660288-j8LtSgEBuhwoU7QIC2uoCksQ2B5VbAS","rLdTRZ6Atss8BKU8ZvfHPUlg9WD4BUQ2PKG8svxJ0jI1N")


function(input, output) {

user<-getUser("innGOA")
followers_goa<-user$followersCount


user<-getUser("RishikeshTour")
followers_rishikesh<-user$followersCount


user<-getUser("RoopkundTrek")
followers_uttarakhand<-user$followersCount


user<-getUser("Ladakhlehtours")
followers_ladakh<-user$followersCount

user$followersCount
 H<-c()
 names_advDestinations<-c()
 countGoa<-0
 countRishikesh<-0
 countUttarakhand<-0
 countLadakh<-0

 
 	 
 	 observe({valores<-renderText({
        input$checkGroup
      })
      data<-unlist(strsplit(valores(), split=" "))
      if(identical(toString(data[1]),"goa") || identical(toString(data[2]),"goa") || identical(toString(data[3]),"goa")  || identical(toString(data[4]),"goa") && countGoa==0){
      	 countGoa=1
      	 H<-append(H,followers_goa)
      	 names_advDestinations<-append(names_advDestinations,"Goa")
      	 #output$value <- renderPrint({ H })
      	 output$value<-renderPlot({barplot(H,names.arg = names_advDestinations,xlab = "Adventure Destinations",ylab = "Followers",col = "green",main = "Adventure Destination Followers Chart",border = "black") })
       }
        if(identical(toString(data[1]),"rishikesh") || identical(toString(data[2]),"rishikesh") || identical(toString(data[3]),"rishikesh") || identical(toString(data[4]),"rishikesh")  && countRishikesh==0){
      	 countRishikesh=1
      	 H<-append(H,followers_rishikesh)
      	 names_advDestinations<-append(names_advDestinations,"Rishikesh")
      	 output$value<-renderPlot({barplot(H,names.arg = names_advDestinations,xlab = "Adventure Destinations",ylab = "Followers",col = "green",main = "Adventure Destination Followers Chart",border = "black") })
       } 

         if(identical(toString(data[1]),"uttarakhand") || identical(toString(data[2]),"uttarakhand") || identical(toString(data[3]),"uttarakhand") || identical(toString(data[4]),"uttarakhand")&& countUttarakhand==0){
      	 countUttarakhand=1
      	 H<-append(H,followers_uttarakhand)
      	 names_advDestinations<-append(names_advDestinations,"Uttarakhand")
      	 output$value<-renderPlot({barplot(H,names.arg = names_advDestinations,xlab = "Adventure Destinations",ylab = "Followers",col = "green",main = "Adventure Destination Followers Chart",border = "black") })
       }

       if(identical(toString(data[1]),"ladakh") || identical(toString(data[2]),"ladakh") || identical(toString(data[3]),"ladakh") || identical(toString(data[4]),"ladakh")  && countLadakh==0){
      	 countLadakh=1
      	 H<-append(H,followers_ladakh)
      	 names_advDestinations<-append(names_advDestinations,"Ladakh")
      	 output$value<-renderPlot({barplot(H,names.arg = names_advDestinations,xlab = "Adventure Destinations",ylab = "Followers",col = "green",main = "Adventure Destination Followers Chart",border = "black") })
       } 
     

 	})

}