## Plot 3
#Reading Data
dat <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")


# creates variable of with date and time combined
timedate <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
# adds new variable to table
dat <- cbind(dat, timedate)
# formats columns
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

#Removes "?"
dat <- subset(dat, Sub_metering_1 != "?")
dat <- subset(dat, Sub_metering_2 != "?")
dat <- subset(dat, Sub_metering_3 != "?")
#formats variable as numeric
dat$Sub_metering_1 <- as.numeric(as.character(dat$Sub_metering_1))
dat$Sub_metering_2 <- as.numeric(as.character(dat$Sub_metering_2))
dat$Sub_metering_3 <- as.numeric(as.character(dat$Sub_metering_3))
# Filters down to the specific dates
dat <- subset(dat, Date == "2007-02-02" | Date == "2007-02-01" )
#Removes "?"
dat <- subset(dat, Global_active_power != "?")
# opens PNG file connection
png("plot3.png", width=480, height=480)
#plots chart
plot(dat$timedate,dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dat$timedate,dat$Sub_metering_2, col = "red")
lines(dat$timedate,dat$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()



