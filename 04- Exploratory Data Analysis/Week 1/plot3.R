##Download the data from the internet
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household-power-consumption.zip")

##Unzip file
unzip("household-power-consumption.zip")

##Read in table
powerdata <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)

##Subset data
powerdata <- powerdata[powerdata$Date=="1/2/2007"|powerdata$Date=="2/2/2007",]

##Convert to date and time objects
powerdata[,"Date"] <- as.Date(powerdata[,"Date"], "%d/%m/%Y")
powerdata[,"date_time"] <- as.POSIXct(strptime(paste(powerdata[,"Time"], powerdata[,"Date"]), '%H:%M:%S %Y-%m-%d'))

##Create plot
png(file="plot3.png")
with(powerdata, plot(date_time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(powerdata, lines(date_time, Sub_metering_2, col="Red"))
with(powerdata, lines(date_time, Sub_metering_3, col="Blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("Black", "Red", "Blue"))
dev.off() ##Turn off device