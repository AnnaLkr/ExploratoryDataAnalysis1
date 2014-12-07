data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings= "?", colClasses = c("character"   ,   "character" ,rep("numeric",1,7)))
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
subdata$DateTime = strptime( apply( subdata[ , c("Date","Time") ], 1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
plot(subdata$DateTime, subdata$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(subdata$DateTime, subdata$Voltage, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(subdata$DateTime, subdata$Sub_metering_1, type="l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(subdata$DateTime, subdata$Sub_metering_2, type = "l", col = "red")
lines(subdata$DateTime, subdata$Sub_metering_3, type = "l", col = "blue")
plot(subdata$DateTime, subdata$Global_reactive_power, type="l", xlab = "", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()