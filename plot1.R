# Exploratory Data Analysis
# Project 1 (Plot 1)

rm(list=ls())

# Load and process data
rawData<-read.table("household_power_consumption.txt", header=TRUE, sep=";",colClasses="character",na.strings = "?")
rawData$Date<-as.Date(rawData$Date, "%d/%m/%Y")
subData<-subset(rawData, rawData$Date %in% as.Date(c("2007-02-01","2007-02-02")))
subData$Global_active_power <- as.numeric(subData$Global_active_power)
subData$Global_reactive_power <- as.numeric(subData$Global_reactive_power)
subData$Voltage <- as.numeric(subData$Voltage)
subData$Global_intensity <- as.numeric(subData$Global_intensity)
subData$Sub_metering_1 <- as.numeric(subData$Sub_metering_1)
subData$Sub_metering_2 <- as.numeric(subData$Sub_metering_2)
subData$Sub_metering_3 <- as.numeric(subData$Sub_metering_3)

# Plot 1
hist(subData$Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()