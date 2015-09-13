data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$Time, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()