setwd("~/Documents/ce/ExData_Plotting1")

data <- read.table("./data/household_power_consumption.txt", 
                   header = TRUE, sep = ";", 
                   na = "?", 
                   colClasses = c(rep("character", 2), rep("numeric", 7)))
attach(data)
df <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
attach(df)
df$DateTime <- strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
rownames(df) <- 1 : nrow(data)
attach(df)
df <- cbind(df[, 10], df[, 3:9])
colname <- colnames(df)
colname[1] <- "Date_time"
colnames(df) <- colname
attach(df)


png(filename = "Plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
# Top - Left
plot(Date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")
lines(Date_time, Global_active_power, col = "black")
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
# Top - Right
plot(Date_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
lines(Date_time, Voltage, col = "black")
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
# Bottom - Left
plot(Date_time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(Date_time, Sub_metering_1, col = "black")
lines(Date_time, Sub_metering_2, col = "red")
lines(Date_time, Sub_metering_3, col = "blue")
legend("topright", bty = "n", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
# Bottom - Right
plot(Date_time, Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = colnames(data)[3], xaxt = "n")
lines(Date_time, Global_reactive_power, col = "black")
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()
rm(data)