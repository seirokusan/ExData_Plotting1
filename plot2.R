## plot2.R - Script to generate plot2.png with global active power against day
## 

fileURL <- "./ExData_Plotting1/household_power_consumption.txt"
eData <- read.table(text = grep("^[1,2]/2/2007",readLines(fileURL),value=TRUE), header=TRUE, sep=";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?")

## Extract and concat Date&Time
eDay <- strptime(paste(eData$Date, eData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Extract data "global active power"
globalActivePower <- as.numeric(eData$Global_active_power)

## Define PNG properties
png(filename = './ExData_Plotting1/plot2.png', width = 480, height = 480, units='px')

## plot with line
plot(eDay, globalActivePower, xlab="", ylab = "Global Active Power (kilowatts)", type="l")

## close the device
dev.off()
