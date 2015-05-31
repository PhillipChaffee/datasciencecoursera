rankall <- function(outcome, num = "best") {
  ##Set global variables
  outcomevalid <- F
  hospitals <- data.frame("hospital" = character(0), "state" = character(0), stringsAsFactors=F)
  
  ##Read in outcome data for hospitals
  outcomedata <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available", stringsAsFactors=F)
  
  ##Set outcome to the column name for the selected outcome & check validity
  if(outcome == "heart attack") {
    outcomecol <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    outcomevalid <- T
  }
  if(outcome == "heart failure") {
    outcomecol <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    outcomevalid <- T
  }
  if(outcome == "pneumonia") {
    outcomecol <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    outcomevalid <- T
  }
  
  ##Split outcomedata into list of seperate tables based on state
  by_state <- split(outcomedata, outcomedata$State)
  
  
  ##Find rank num hospital for each
  if(outcomevalid) {
    
    ##Build data frame to be returned
    for(i in 1:length(by_state)) {
      ##Assign current state to variable
      current_state <- by_state[[i]]
      current_state <- current_state[complete.cases(current_state[,outcomecol]),]
      
      ##Set rank
      if(num == "best") {
        rank <- 1
      }
      else if(num == "worst") {
        rank <- length(current_state[,outcomecol])
      }
      else {
        rank <- num
      }
      
      ##Return hospital if rank within split data frame, otherwise return NA for that state
      if(rank <= length(current_state[,outcomecol])) {
        ##Order current state data frame by outcomecol and then Hospital.Name
        current_state <- current_state[order(current_state[,outcomecol], current_state[,"Hospital.Name"]),]
        
        ##Add current states hospital to hospitals data frame
        newrow <- c(as.character(current_state[[rank,"Hospital.Name"]]), as.character(current_state[[rank,"State"]]))
        hospitals[i,] <- rbind(newrow)
      }
      else {
        newrow <- c(NA, as.character(current_state[[1,"State"]]))
        hospitals[i,] <- rbind(newrow)
      }
    }
    ##Return hospitals data frame
    return(hospitals)
  }
  else if(!outcomevalid) {
    stop("invalid outcome")
  }
  
}