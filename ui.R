library(shiny)
library(shinythemes)

education <- readRDS("education.Rds")
shinyUI(fluidPage(
  
  theme = shinytheme("journal"),
  
  #Title of Application
  headerPanel("Education Situation"), 
  
  sidebarPanel( 
    
    selectInput("Factor", "Select the equation factor:", 
                choices= unique(as.character(education$factor))),
    
    radioButtons("Province", "Province:", 
                 choices= unique(as.character(education$province))),
    
    selectInput("District", "District:", 
                 choices= unique(as.character(education$district))),
    
    
    
    
    
    h5("This is a simple application showing the education situation for
       114 districts of Pakistan")
    
    ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput("plot"))
      
    )
  )
  
  #end of UI brackets
  ))