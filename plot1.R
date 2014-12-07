data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings= "?", colClasses = c("character"   ,   "character" ,rep("numeric",1,7)))
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

hist(subdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()
