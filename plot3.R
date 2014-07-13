# Exploratory Data Analysis Project 1 - Plot 3

# Read the data file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=71000, stringsAsFactors=FALSE)

# Convert date and time strings to R Date/Time classes
data <- within(data, DateTime <- as.POSIXlt(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# Limit data to 2007-02-01 and 2007-02-02
data <- subset(data, DateTime >= as.POSIXlt("2007-02-01") & DateTime < as.POSIXlt("2007-02-03"))

# Process plot3 in 480x480 dimensions
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")

# With legend border
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lty=1, bty="o")

dev.off()