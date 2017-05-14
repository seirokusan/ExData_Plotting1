## plot1.R - Script to generate histogram plot1.png from data "Global Active Power"

fileURL <- "./ExData_Plotting1/household_power_consumption.txt"
eData <- read.table(text = grep("^[1,2]/2/2007",readLines(fileURL),value=TRUE), header=TRUE, sep=";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?")

## Define PNG properties
png(filename = './ExData_Plotting1/plot1.png', width = 480, height = 480, units='px')

## Plot histogram for Global Active Power
with(eData, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))

## Close the device
dev.off()


