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


png(filename = "Plot1.png", width = 480, height = 480, units = "px")
hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kw)", breaks = 12, ylim = c(0, 1200))
dev.off()
rm(data)