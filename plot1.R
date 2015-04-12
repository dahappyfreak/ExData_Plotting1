a <- "household_power_consumption.txt"
data1 <- read.table(a, header = TRUE, sep = ";", na.strings = "?", nrows = 10)
classes <- sapply(data1, class)
data <- read.table(a, header = TRUE, sep = ";", na.strings = "?", colClasses = classes)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
sum(complete.cases(data)) == nrow(data)
png(filename = "plot1.png")
hist(data$Global_active_power, col = "Red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()