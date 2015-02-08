# read in the file
dataFileName <- "household_power_consumption.txt"
data <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the desired dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Open a new png file with the desired height and width
png("plot1.png", width=480, height=480)
# First plot is a histogram with red bars and an x-label and main label
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()