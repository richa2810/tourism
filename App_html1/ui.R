fluidPage(
	headerPanel("Pilgrimage!"),
  img(src='pilgrimage.jpg', style='width:100%;height:200px'),
    
  # Copy the chunk below to make a group of checkboxes
  checkboxGroupInput("checkGroup", label = h3("Checkbox group"), 
    choices = list("Jet Airways" = "jetairways", "Indigo" = "indigo", "Go Air" = "goair", "Spice Jet" = "spicejet"),
    selected = 1),
  
  
  hr(),

  mainPanel(
  	
      plotOutput("value"),
headerPanel("Hello!")
      
    )
   
 # fluidRow(column(3, verbatimTextOutput("value")))
  
)