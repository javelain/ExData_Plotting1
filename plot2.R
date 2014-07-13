library(data.table)
myFile <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
data <- fread(myFile, header=T,sep = ";", colClasses = c(rep("character", 9)))
dt <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")

dateandtime = paste(dt$Date, dt$Time)

x = strptime(dateandtime, "%d/%m/%Y %H:%M:%S")
plot(x, as.numeric(dt$Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()