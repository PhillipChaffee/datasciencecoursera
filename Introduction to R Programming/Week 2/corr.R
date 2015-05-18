corr <- function(directory, threshold=0) {
  
  ##Initialize df of complete cases & numeric vector to store correlations
  datacor <- numeric()
  com <- complete(directory)
  com <- com[com$nobs > threshold,]
  
  for(i in com$id) {
    file <- read.csv(file.path(directory, paste(formatC(i, width=3, flag=0), ".csv", sep = "")))
    datacor[i] <- cor(file[["sulfate"]], file[["nitrate"]], use ="complete.obs")
  }
  
  datacor <- datacor[!is.na(datacor)]
  return(datacor)
}