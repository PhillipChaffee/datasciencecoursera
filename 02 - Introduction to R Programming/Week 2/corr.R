corr <- function(directory, threshold=0) {
  
  ##Initialize numeric vector to store correlations & df of complete cases over threshold
  datacor <- numeric()
  com <- complete(directory)
  com <- com[com$nobs > threshold,]
  
  ##Loop over files in directory that contain complete cases over the threshold and add to datacor vector
  for(i in com$id) {
    file <- read.csv(file.path(directory, paste(formatC(i, width=3, flag=0), ".csv", sep = "")))
    datacor[i] <- cor(file[["sulfate"]], file[["nitrate"]], use ="complete.obs")
  }
  
  ##Remove NA values from datacor vector
  datacor <- datacor[!is.na(datacor)]
  
  ##Return datacor vector
  return(datacor)
}
