## Plot 2
#Reading Data
dat <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

## creates variable of with date and time combined
timedate <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
# adds new variable to table
dat <- cbind(dat, timedate)
## formats columns
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
#formats variable as numeric
dat$Global_active_power <- as.numeric(as.character(dat$Global_active_power))
## Filters down to the specific dates
dat <- subset(dat, Date == "2007-02-02" | Date == "2007-02-01" )
#Removes "?"
dat <- subset(dat, Global_active_power != "?")
# opens PNG file connection
png("plot2.png", width=480, height=480)
#plots chart
plot(dat$timedate,dat$Global_active_power, type = "l", ylab = "Global Active Power (kilowats)", xlab = "")
dev.off()
