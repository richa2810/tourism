library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
 headerPanel('Examples of DataTables'),
  # Application title
  titlePanel("Most trending On Twitter !"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("retweets",
                  "Number of retweets:",
                  min = 1,
                  max = 25,
                  value = 5),
				  helpText('For the diamonds data, we can select variables
             to show in the table; for the mtcars example, we
             use orderClasses = TRUE so that sorted columns 
             are colored since they have special CSS classes 
             attached; for the iris data, we customize the 
             length menu so we can display 5 rows per page.')
    ),

	 
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
	  
	  tabsetPanel(
      
      tabPanel('mytable',
               dataTableOutput("mytable1"))
      
    )
    )
  )
))