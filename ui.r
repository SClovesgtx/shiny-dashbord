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
      sidebarMenu(
      sidebarSearchForm("searchText", "buttonSearch", "Search"),
      menuItem('Dashboard', tabName = 'dashboard', icon = icon('dashboard')),
        menuSubItem('Dashboard Financeiro', tabName = "financeiro"),
        menuSubItem('Dashboard Vendas', 'vendas'),
      menuItem('Análises Detalhadas', badgeLabel = "Novo", badgeColor = 'yellow'),
      menuItem('Dado bruto')
    )),
    dashboardBody(
      tabItems(
        tabItem(tabName = "dashboard",
                fluidRow(
                  infoBox("Sales", 100000, icon = icon('thumbs-up')),
                  infoBox("Conversion %", paste0("20%"), icon = icon("warning")),
                  infoBoxOutput("approvedSales")
                ),
                fluidRow(
                  tabBox(
                  tabPanel(title = "Histogram of Faithful", status = "primary", solidHeader = T, plotOutput("histogram"), background = 'green'),
                  tabPanel(title = 'Controls for Dashboard', status = 'warning', solidHeader = T, background = 'aqua',
                      "Use esses controles para alterar o gráfico", br(),
                      "Tome cuidado",
                      sliderInput("bins", "Número de barras", 1, 100, 50),
                      textInput(inputId =  "text_input", label = 'search opportunities', value = '123456'))
                  )
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

