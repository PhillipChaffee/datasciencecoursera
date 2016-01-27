library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Eye Color Guesser"),
  sidebarPanel(
    h3("Input your hair color"),
    selectInput("hair", "Hair Color", choices=c("Black", "Brown", "Red", "Blond")),
    h3("Input your sex"),
    selectInput("sex", "Sex", choices = c("Male", "Female"))
  ),
  mainPanel(
    h3("This application takes your hair color and sex and makes a guess at your eye color!
       It is almost completely inacurate, but lots of fun!
       It will display it's guess below!"),
    h1(textOutput("eyeoutput"))
  )
))