library(shiny)
library(shinydashboard)
library(tidyverse)
library(ggplot2)
setwd("~/Desktop/Work/6AM Health/Data")
byte_fridges         = read_csv("Sales_Dta.csv")
#assign a data type 
byte_fridges$Product = as.factor(byte_fridges$Product)
#adjust date format 
byte_fridges$Date    = as.Date(byte_fridges$Date,'%m/%d/%y')

shinyServer(function(input,output){
  output$gplot = renderPlot({
    ggplot(subset(byte_fridges, Date>= as.Date("2019-09-01") & Fridge_Type=="Byte", select = c(Date, Total, Product, Fridge_Type)))+
      geom_bar(aes(x = Date, y = Total, color = Product), alpha = 0.6, size = 0.6, stat= "identity")     +
      labs(x= "Date", y = "Total Units Sold", title = "September 1st - September 17th quantiry sales") +
      scale_x_date(breaks = date_breaks("1 day"), labels = date_format("%m-%d"))                      +
      scale_y_continuous(breaks = seq(0, 1000, 1))  +
      theme(axis.text.x = element_text(angle = 60, hjust = 1))
  })
})
