## Plot 1

#Reading Data
dat <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
#Formatting Date
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat$Time <- format(dat$Time, format="%H:%M:%S")
#Filtering down to the two days
dat <- subset(dat, Date == "2007-02-02" | Date == "2007-02-01" )
#Removes "?"
dat <- subset(dat, Global_active_power != "?")
#Transforms the Global active Power values to numeric so the Histogram can pick them up
dat$Global_active_power <- as.numeric(as.character(dat$Global_active_power))
# opens PNG file connection
png("plot1.png", width=480, height=480)
#Generates the Histogram
hist(dat$Global_active_power, col = "red", breaks = 24, main = "Global Active Power" , xlab = "Global Active Power (kilowats)")
dev.off()