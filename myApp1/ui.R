fluidPage(
	headerPanel("Hello!"),
    
  # Copy the chunk below to make a group of checkboxes
  checkboxGroupInput("checkGroup", label = h3("Checkbox group"), 
    choices = list("Goa" = "goa", "GoKarna" = "gokarna", "HavelockAndaman" = "havelockAndaman", "Pondicherry" = "pondicherry"),
    selected = 1),
  
  
  hr(),

  mainPanel(
  	img(src='pilgrimage.jpg', align = "right"),
      plotOutput("value"),
headerPanel("Hello!")
      
    )
   
 # fluidRow(column(3, verbatimTextOutput("value")))
  
)