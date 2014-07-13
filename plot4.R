# Exploratory Data Analysis Project 1 - Plot 4

# Read the data file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=71000, stringsAsFactors=FALSE)

# Convert date and time strings to R Date/Time classes
data <- within(data, DateTime <- as.POSIXlt(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# Limit data to 2007-02-01 and 2007-02-02
data <- subset(data, DateTime >= as.POSIXlt("2007-02-01") & DateTime < as.POSIXlt("2007-02-03"))

# Process plot4 in 480x480 dimensions
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Set up plotting in two rows and two columns, plotting along rows first.
par( mfrow = c( 2, 2))

# Plot for Global Active Power
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot for Voltage
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot for Energy sub metering
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
# With no legend border (bty=n)
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lty=1, bty="n")

# Plot for Global reactive power
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()