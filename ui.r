library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage( 
    dashboardHeader(title = 'EstatCAPS'),
    dashboardSidebar(
      sliderInput("bins", "Número de barras", 1, 100, 50),
      menuItem('Dashboard'),
        menuSubItem('Dashbord Financeiro'),
        menuSubItem('Dashboard Vendas'),
      menuItem('Análises Detalhadas'),
      menuItem('Dado bruto')
    ),
    dashboardBody(
      fluidRow(
        box(plotOutput("histogram"))
      )
    )
  )
)