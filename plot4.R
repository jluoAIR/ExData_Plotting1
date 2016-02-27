# Exploratory Data Analysis
# Project 1 (Plot 4)

rm(list=ls())

# Load and process data
rawData<-read.table("household_power_consumption.txt", header=TRUE, sep=";",colClasses="character",na.strings = "?")
rawData$Date<-as.Date(rawData$Date, "%d/%m/%Y")
subData<-subset(rawData, rawData$Date %in% as.Date(c("2007-02-01","2007-02-02")))
subData$datetime<-strptime(paste(subData$Date, subData$Time),"%Y-%m-%d %H:%M:%S")
subData$Global_active_power <- as.numeric(subData$Global_active_power)
subData$Global_reactive_power <- as.numeric(subData$Global_reactive_power)
subData$Voltage <- as.numeric(subData$Voltage)
subData$Global_intensity <- as.numeric(subData$Global_intensity)
subData$Sub_metering_1 <- as.numeric(subData$Sub_metering_1)
subData$Sub_metering_2 <- as.numeric(subData$Sub_metering_2)
subData$Sub_metering_3 <- as.numeric(subData$Sub_metering_3)

# Plot 4
par(mfrow = c(2,2), mar=c(4,4,0.1,1))
with(subData, {
  plot(datetime, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")
  plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(datetime, Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
  lines(datetime,Sub_metering_2,col="Red")
  lines(datetime,Sub_metering_3,col="Blue")
  legend(x = "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black","Red","Blue"), lwd = 1,cex = 0.5, bty = "n")
  plot(datetime, Global_reactive_power , type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.copy(png,file="plot4.png")
dev.off()