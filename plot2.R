tf <- "exdata-data-household_power_consumption/household_power_consumption.txt"
dt <- read.table(tf, header = TRUE, sep = ";", na.strings = "?")
dt <- na.omit(dt)
dt$Time <- as.POSIXct(strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S"))
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
dt <- dt[dt$Date=="2007-02-01" | dt$Date=="2007-02-02",]
png(file = "plot2.png")
plot(dt[,"Global_active_power"] ~ dt[,"Time"], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()