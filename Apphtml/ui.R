fluidPage(
	headerPanel("Hello!"),
    
  # Copy the chunk below to make a group of checkboxes
  checkboxGroupInput("checkGroup", label = h3("Checkbox group"), 
    choices = list("Jet Airways" = "jetairways", "Indigo" = "indigo", "Go Air" = "goair", "Spice Jet" = "spicejet"),
    selected = 1),
  
  
  hr(),

  mainPanel(
  	img(src='pilgrimage.jpg', align = "right"),
      plotOutput("value"),
headerPanel("Hello!")
      
    )
   
 # fluidRow(column(3, verbatimTextOutput("value")))
  
)