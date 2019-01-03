library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage( 
    dashboardHeader(title = 'EstatCAPS',
                    dropdownMenu(type = 'message',
                                 messageItem(from = "Finance update",
                                             message = "we are on threshold"),
                                 messageItem(from = "Sales Update", message = "Sales are at 55%",
                                             icon = icon("bar-chart"), time = "22:00"),
                                 messageItem(from = "Sales update", message = "Sales meeting at 6 PM",
                                             icon = icon("handshake-o"), time = "14:00")
                      
                    )
                    ),
    
    
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
