require(shiny)
require(caret)
require(randomForest)
require(e1071)
load("eyecolor.RData")
shinyServer(
  function(input, output){
    output$eyeoutput <- renderPrint({
      Hair <- switch(input$hair,
                     "Black" = "Black",
                     "Brown" = "Brown",
                     "Red" = "Red",
                     "Blond" = "Blond")
      Sex <- switch(input$sex,
                    "Male" = "Male",
                    "Female" = "Female")
      data <- data.frame(Hair, Sex)
      guess <- predict(eyecolor, newdata=data)
      as.character(guess[[1]])
    })
  }
)