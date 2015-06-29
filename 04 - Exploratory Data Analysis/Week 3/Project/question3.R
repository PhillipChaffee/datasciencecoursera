library(ggplot2)
sccPM25 <- readRDS("summarySCC_PM25.rds")
baltimore <- sccPM25[sccPM25$fips=="24510",]
png(file="question3.png")
qplot(year, Emissions, data=baltimore, facets=.~type, 
      geom=c("point", "smooth"), method="lm")
dev.off()