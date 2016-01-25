library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Wage - ISLR wage data"),
  sidebarPanel(
    numericInput("age", "Age", 0, min = 16, max = 120, step = 1, width = "70px"),
    selectInput("gender", "Gender", choices=c("Male", "Female")),
    selectInput("race", "Race", choices = c("White", "Black", "Asian", "Other")),
    selectInput("education", "Education", choices = c("< HS Grad", "HS Grad", "Some College", "College Grad", "Advanced Degree")),
    selectInput("jobtype", "Job Type", choices = c("Industrial", "Information"))
  ),
  mainPanel()
))
