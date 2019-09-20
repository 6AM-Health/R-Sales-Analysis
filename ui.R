library(shiny)
library(shinydashboard)
shinyUI(
  dashboardPage(
    dashboardHeader(title = "6AM Health"),
    dashboardSidebar(
      menuItem("Dashboard"),
              menuSubItem("un Graph"),
      menuItem("Reports"),
              menuSubItem("un report"),
      menuItem("Analysis")
    ),
    dashboardBody(
      fluidRow(
        box(plotOutput("gplot"), height = "500px", width = "1000px")
      )
    )
  )
)