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
png(file="plot1.png")
hist(powerdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() ##Turn off device
