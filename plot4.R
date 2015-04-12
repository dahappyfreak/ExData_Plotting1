a <- "household_power_consumption.txt"
data1 <- read.table(a, header = TRUE, sep = ";", na.strings = "?", nrows = 10)
classes <- sapply(data1, class)
data <- read.table(a, header = TRUE, sep = ";", na.strings = "?", colClasses = classes)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
sum(complete.cases(data)) == nrow(data)

png(filename = "plot4.png")
par(mfcol = c(2, 2))
plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(data$Datetime, data$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
points(data$Datetime, data$Sub_metering_2, col = "red", type = "l")
points(data$Datetime, data$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
