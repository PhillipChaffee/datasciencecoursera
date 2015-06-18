readFromWebpage <- function(webpage) {
  con = url(webpage)
  data <- readLines(con)
  close(con)
  return(data)
}