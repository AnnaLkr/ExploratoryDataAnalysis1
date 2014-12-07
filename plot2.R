data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings= "?", colClasses = c("character"   ,   "character" ,rep("numeric",1,7)))
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
subdata$DateTime = strptime( apply( subdata[ , c("Date","Time") ], 1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")

plot(subdata$DateTime, subdata$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()