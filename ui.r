library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage( 
    dashboardHeader(title = 'EstatCAPS'),
    dashboardSidebar(
      sliderInput("bins", "Número de barras", 1, 100, 50),
      sidebarMenu(
      menuItem('Dashboard', tabName = 'dashbord', icon = icon('dashboard')),
        menuSubItem('Dashboard Financeiro', tabName = "financeiro"),
        menuSubItem('Dashboard Vendas', 'vendas'),
      menuItem('Análises Detalhadas'),
      menuItem('Dado bruto')
    )),
    dashboardBody(
      tabItems(
        tabItem(tabName = "dashboard",
                fluidRow(
                  box(plotOutput("histogram")))),
        tabItem(tabName = "financeiro", 
                h1("Dashboard Financeiro")
                ),
        tabItem(tabName = "vendas", 
                h2("Dashboard Vendas")
        )
      )
      )
    )
)
