complete <- function(directory, id = 1:332) {
  ##Initialize complete cases number storage
  cclist <- vector()
  
  ##Load file and determine number of complete cases
  for(i in id) {
    dir <- read.csv(file.path(directory, paste(formatC(i, width=3, flag=0), ".csv", sep = "")))
    cclist <- c(cclist, sum(complete.cases(dir)))
  }
  
  #Create data frame
  nobs <- cclist
  cbind.data.frame(id, nobs)
}