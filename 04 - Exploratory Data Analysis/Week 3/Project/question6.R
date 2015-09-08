library(ggplot2)

sccPM25 <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

baltimore <- sccPM25[sccPM25$fips=="24510",]
losAngeles <- sccPM25[sccPM25$fips=="06037",]
motorVeh <- character()

for(i in 1:length(scc$SCC)) {
  if(length(grep("Mobile", as.character(scc$EI.Sector[i]), fixed=T)) > 0) {
    motorVeh <- c(motorVeh, as.character(scc$SCC[i]))
  }
}

data <- rbind(baltimore, losAngeles)
data <- data[data$SCC %in% motorVeh,]

png(file="question6.png")
qplot(year, Emissions, data=data, geom=c("point", "smooth"), 
      method="lm", main="LA v. Baltimore", facets=.~fips)
dev.off()