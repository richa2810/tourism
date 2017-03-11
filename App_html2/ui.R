fluidPage(
	h1("Pilgrimage", style="color:brown"),
  img(src='pilgrimage.jpg', style='width:100%;height:300px'),
    
  # Copy the chunk below to make a group of checkboxes
  # checkboxGroupInput("checkGroup", label = h3("Airlines"), 
  #   choices = list("Jet Airways" = "jetairways", "Indigo" = "indigo", "Go Air" = "goair", "Spice Jet" = "spicejet"),
  #   selected = 1),

    checkboxGroupInput("checkGroup1", label = h3("Select Cities"), 
    choices = list("Haridwar" = "haridwar", "Shirdi" = "shirdi", "Dwarka" = "dwarka", "Mathura" = "mathura"),
    selected = 1),
  
  
  hr(),

  mainPanel(
    plotOutput("value1"),
  h1("Shirdi", style="color:brown")	,
        tabsetPanel(
      
      tabPanel('Locations of followers',
               dataTableOutput("mytable1"))
      
    )
        
    ),

  sidebarPanel(
    plotOutput("wordcloud")
    )
   
 # fluidRow(column(3, verbatimTextOutput("value")))
  
)