# Read in the Data
dataFileName <- "household_power_consumption.txt"
data <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the desired dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Clean up the formatting
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Set up the various variables in the 4 plots 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Open a new png file of the desired width and height
png("plot4.png", width=480, height=480)

# Set up four plots in 2 rows and 2 columns
par(mfrow = c(2, 2)) 

# Draw the first chart as line grapgh with x and y labels
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Draw the second chart as a line graph with x and y labels
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Draw the third chart as 3 line graphs with a legend and balck, red and blue lines
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Draw the fourth chart as a line graph with x and y labels
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()