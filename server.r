library(shiny)
library(shinydashboard)

setwd('/home/cloves/Documents/shiny/')

shinyServer(function(input, output){
  
  output$histogram <- renderPlot({
    hist(faithful$eruptions, breaks = input$bins)
     })
  
  output$msgOutput <- renderMenu({
    msgs <- apply(read.csv('messages.csv'), 1, function(row){
      messageItem(from = row[['from']], message = row[['message']])
    })
    
    dropdownMenu(type = "messages", .list = msgs)
    
  })
})