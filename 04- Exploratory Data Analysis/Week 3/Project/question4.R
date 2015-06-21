library(ggplot2)
sccPM25 <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
coal <- character()
for(i in 1:length(scc$SCC)) {
  if(length(grep("coal", as.character(scc$EI.Sector[i]), fixed=T)) > 0 | 
       length(grep("Coal", as.character(scc$EI.Sector[i]), fixed=T)) > 0) {
    coal <- c(coal, as.character(scc$SCC[i]))
  }
}
coalData <- sccPM25[sccPM25$SCC %in% coal,]
png(file="question4.png")
qplot(year, Emissions, data=coalData, geom=c("point", "smooth"), 
      method="lm", main="Coal Emissions")
dev.off()