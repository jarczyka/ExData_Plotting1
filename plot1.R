tf <- "exdata-data-household_power_consumption/household_power_consumption.txt"
dt <- read.table(tf, header = TRUE, sep = ";", na.strings = "?")
dt <- na.omit(dt)
dt$Time <- as.POSIXct(strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S"))
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
dt <- dt[dt$Date=="2007-02-01" | dt$Date=="2007-02-02",]
png(file = "plot1.png")
hist(dt$Global_active_power, col="red", main="Global Active Power" , ylim=c(0, 1200), xlab="Global Active Power (kilowatts)")
dev.off()