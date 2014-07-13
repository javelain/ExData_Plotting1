library(data.table)
myFile <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
data <- fread(myFile, header=T,sep = ";", colClasses = c(rep("character", 9)))
dt <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")

dateandtime = paste(dt$Date, dt$Time)

x = strptime(dateandtime, "%d/%m/%Y %H:%M:%S")
plot(x, as.numeric(dt$Sub_metering_1), type = "l", ylab = "Energy Sub Metering", xlab = "")
lines(x, as.numeric(dt$Sub_metering_2), type = "l", col = "red")
lines(x, as.numeric(dt$Sub_metering_3), type = "l", col = "blue")

legend("topright", lty = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"))

dev.copy(png, file = "plot3.png")
dev.off()