library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage( dashboardHeader(title = 'EstatCAPS', dropdownMenuOutput('msgOutput'),
                 # dropdownMenu(type = 'message',
                 #                messageItem(from = "Finance update",
                 #                            message = "we are on threshold"),
                 #                messageItem(from = "Sales Update", message = "Sales are at 55%",
                 #                            icon = icon("bar-chart"), time = "22:00"),
                 #              messageItem(from = "Sales update", message = "Sales meeting at 6 PM",
                 #                           icon = icon("handshake-o"), time = "14:00")
                 #   )
                 dropdownMenu(type = "notifications",
                              notificationItem(
                                text = "2 new tab added to the dashboard",
                                icon = icon('dashboard'),
                                status = "success"
                              ),
                              notificationItem(
                                text = "Server is currently running at 95% load",
                                icon = icon("warning"),
                                status = "warning"
                              )
                              ),
                 dropdownMenu(type = "tasks",
                              taskItem(
                                value = 80,
                                color = "aqua",
                                "Comprar ações X e Y"
                                      ),
                              taskItem(
                                      value = 55,
                                      color = 'red',
                                      "Vender as ações Z"
                                      ),
                              taskItem(
                                      value = 40,
                                      color = 'green',
                                      "Verificar cotação do dolar"
                                      )
                    )),
    dashboardSidebar(
      sliderInput("bins", "Número de barras", 1, 100, 50),
      sidebarMenu(
      menuItem('Dashboard', tabName = 'dashboard', icon = icon('dashboard')),
        menuSubItem('Dashboard Financeiro', tabName = "financeiro"),
        menuSubItem('Dashboard Vendas', 'vendas'),
      menuItem('Análises Detalhadas'),
      menuItem('Dado bruto')
    )),
    dashboardBody(
      tabItems(
        tabItem(tabName = "dashboard",
                fluidRow(
                  box(
                    plotOutput("histogram"))
                  
                  )),
                
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

