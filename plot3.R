tf <- "exdata-data-household_power_consumption/household_power_consumption.txt"
dt <- read.table(tf, header = TRUE, sep = ";", na.strings = "?")
dt <- na.omit(dt)
dt$Time <- as.POSIXct(strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S"))
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
dt <- dt[dt$Date=="2007-02-01" | dt$Date=="2007-02-02",]
png(file = "plot3.png")
plot(dt[,"Sub_metering_1"] ~ dt[,"Time"], type="n", xlab = "", ylab="Energy sub  metering")
points(dt[,"Sub_metering_1"] ~ dt[,"Time"], type="l", col="black")
points(dt[,"Sub_metering_2"] ~ dt[,"Time"], type="l", col="red") 
points(dt[,"Sub_metering_3"] ~ dt[,"Time"], type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()