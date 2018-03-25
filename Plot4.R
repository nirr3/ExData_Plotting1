## Plot 4


dat1 <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")


dat <- dat1
# creates variable of with date and time combined
timedate <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
# adds new variable to table
dat <- cbind(dat, timedate)
# formats columns
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
# Filters down to the specific dates
dat <- subset(dat, Date == "2007-02-02" | Date == "2007-02-01" )
#Removes "?"
dat <- subset(dat, Global_active_power != "?")
dat <- subset(dat, Voltage != "?")
dat <- subset(dat, Sub_metering_1 != "?")
dat <- subset(dat, Sub_metering_2 != "?")
dat <- subset(dat, Sub_metering_3 != "?")
dat <- subset(dat, Global_reactive_power != "?")
# Formats variable as numeric
dat$Global_active_power <- as.numeric(as.character(dat$Global_active_power))
dat$Voltage <- as.numeric(as.character(dat$Voltage))
dat$Sub_metering_1 <- as.numeric(as.character(dat$Sub_metering_1))
dat$Sub_metering_2 <- as.numeric(as.character(dat$Sub_metering_2))
dat$Sub_metering_3 <- as.numeric(as.character(dat$Sub_metering_3))
dat$Global_reactive_power <- as.numeric(as.character(dat$Global_reactive_power))
# Removes "?"
dat <- subset(dat, Global_active_power != "?")
# designs the number of charts
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
# plots upper left chart
plot(dat$timedate, dat$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
# Plots upper right chart
plot(dat$timedate, dat$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
# plots lower left chart
plot(dat$timedate,dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dat$timedate,dat$Sub_metering_2, col = "red")
lines(dat$timedate,dat$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty = "n")
# Plots bottom right chart
plot(dat$timedate, dat$Global_reactive_power, type = "l", xlab = "datetime")
dev.off()
