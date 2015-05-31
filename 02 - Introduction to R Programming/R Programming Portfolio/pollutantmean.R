pollutantmean <- function(directory, pollutant, id = 1:332) {
  ##Create a list to store means in the length of the # of id's
  vectorlist <- list()
  
  ##Loop over ids and store each id's values in vectorlist
  for(i in id) {
    dir <- read.csv(file.path(directory, paste(formatC(i, width=3, flag=0), ".csv", sep = "")))
    vectorlist[[i]] <- dir[[pollutant]]
  }
  
  ##Return mean of all values
  mean(unlist(vectorlist), na.rm=T)
}