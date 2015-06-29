sccPM25 <- readRDS("summarySCC_PM25.rds")
baltimore <- sccPM25[sccPM25$fips=="24510",]
png(file="question2.png")
with(baltimore, plot(year, Emissions, ylab="Emissions", xlab="Year", 
                     main="Baltimore"))
with(baltimore, abline(lm(Emissions ~ year)))
dev.off()