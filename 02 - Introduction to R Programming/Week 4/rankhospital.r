rankhospital <- function(state, outcome, num = "best") {
  ##Set global variables
  statevalid <- F
  outcomevalid <- F
  outcomecol <- NULL
  rank <- NULL
  
  ##Read in outcome data for hospitals
  outcomedata <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available")
  
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
  
  ##Check state validity
  if(state %in% outcomedata$State) {
    statevalid <- T
  }
  
  ##If outcome and state are valid, create a data frame with data only from
  ##the desired state. Order by outcome then by name and return the top result.
  if(statevalid && outcomevalid) {
    y <- outcomedata[outcomedata$State==state,]
    y <- y[complete.cases(y[,outcomecol]),]
    y <- y[order(y[,outcomecol], y[,"Hospital.Name"]),]
    
    ##Set rank
    if(num == "best") {
      rank <- 1
    }
    else if(num == "worst") {
      rank <- length(y[,outcomecol])
    }
    else {
      rank <- num
    }
    
    ##Return hospital if rank within data frame, otherwise return NA
    if(rank <= length(y[,outcomecol])) {
      return(as.character(y[[rank,"Hospital.Name"]]))
    }
    else {
      return(NA)
    }
    
  }else if(statevalid && !outcomevalid) {
    stop("invalid outcome")
  }else if(!statevalid && outcomevalid) {
    stop("invalid state")
  }
}