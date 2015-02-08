setwd("C:/Users/Venkata/Downloads/exdata_data_household_power_consumption")

## Getting full NeededDATAset (converting the big text file into a csv and then converting the date to a more legible version as specified)
DFNeededDATA <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
DFNeededDATA$Date <- as.Date(DFNeededDATA$Date, format="%d/%m/%Y")

## Subsetting the NeededDATA (Converting the Big data set into something that is more relevant to the problem at hand)
NeededDATA <- subset(DFNeededDATA, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(DFNeededDATA)


## Converting dates
datetime <- paste(as.Date(NeededDATA$Date), NeededDATA$Time)
NeededDATA$Datetime <- as.POSIXct(datetime)


## Plot 2
plot(NeededDATA$Global_active_power~NeededDATA$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()