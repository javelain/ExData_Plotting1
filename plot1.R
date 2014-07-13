library(data.table)
myFile <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
data <- fread(myFile, header=T,sep = ";", colClasses = c(rep("character", 9)))
dt <- subset(data,Date == "1/2/2007" | Date == "2/2/2007")

hist(x = as.numeric(dt$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power" )
dev.copy(png, file = "plot1.png")
dev.off()


