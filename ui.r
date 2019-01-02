library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage( 
    dashboardHeader(title = 'Isso é o Header'),
    dashboardSidebar(
      menuItem('Dashboard'),
        menuSubItem('Dashbord Finace'),
        menuSubItem('Dashboard Sales'),
      menuItem('Data Analysis'),
      menuItem('Raw Data')
    ),
    dashboardBody()
  )
)