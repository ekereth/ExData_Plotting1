data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol=c(2,2))

plot(data$Time, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",
     xlab="")

plot(data$Time, data$Sub_metering_1, type="n", ylab="Global Active Power (kilowatts)",
     xlab="")
points(data$Time, data$Sub_metering_1, type="l", col="black")
points(data$Time, data$Sub_metering_2, type="l", col="red")
points(data$Time, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=2, lty=1, bty="n")

plot(data$Time, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(data$Time, data$Global_reactive_power, type="l", ylab="Global_reactive_power",
     xlab="datetime")
dev.off()