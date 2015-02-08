# Read Data
dataFileName <- "household_power_consumption.txt"
data <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the desired days
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Clean up the formats
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

# OPen a new png file with desired height and width
png("plot2.png", width=480, height=480)

# We want a line plot which is type l and we want x and y labels but NO main label
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()