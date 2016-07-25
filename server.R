library(shiny) ; library(shinythemes)
library(dplyr)
library(foreign)
library(scales)
library(ggplot2)
library(tidyr)

## http://stackoverflow.com/questions/25415613/using-the-input-from-updateselectinput

education <- readRDS("education.Rds")

shinyServer(function(input, output, session){
  
  observe({
    Factor2<- input$Factor
    updateRadioButtons(session, "Province", choices = sort(levels(factor(education$province[education$factor == Factor2]))))
  })
  
  observe({
    Factor2<- input$Factor
    Province2 <- input$Province
    
    updateSelectInput(session, "District", choices = sort(levels(factor(education$district[education$province == Province2 & education$factor == Factor2]))))
  })
  
  
  get_ddf<-reactive({
    subset(education, education$factor==input$Factor & education$province==input$Province & education$district==input$District
    )
  })  
  
 
    
  
  output$plot<- renderPlot({
    print(ggplot(get_ddf(), aes(x=attribute, y=pct, colour=attribute, fill=attribute)) +
            theme(axis.text.x=element_blank(),axis.ticks.x=element_blank())+
            geom_bar(stat="identity") +
            scale_y_continuous(labels=percent))
          
  })
  
})