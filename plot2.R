a <- "household_power_consumption.txt"
data1 <- read.table(a, header = TRUE, sep = ";", na.strings = "?", nrows = 10)
classes <- sapply(data1, class)
data <- read.table(a, header = TRUE, sep = ";", na.strings = "?", colClasses = classes)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
sum(complete.cases(data)) == nrow(data)

datetime <- paste(data$Date, data$Time)
data$Datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png")
plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
