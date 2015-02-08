setwd("C:/Users/Venkata/Downloads/exdata_data_household_power_consumption")

## Getting full NeededDATAset (converting the big text file into a csv and then converting the date to a more legible version as specified)
HDFMAIN <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
HDFMAIN$Date <- as.Date(HDFMAIN$Date, format="%d/%m/%Y")


## Subsetting the NeededDATA (Converting the Big data set into something that is more relevant to the problem at hand)
NeededDATA <- subset(HDFMAIN, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(HDFMAIN)


## Converting dates
datetime <- paste(as.Date(NeededDATA$Date), NeededDATA$Time)
NeededDATA$Datetime <- as.POSIXct(datetime)


## Plot 3 for the combined graph set
with(NeededDATA, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright",col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.5)

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
