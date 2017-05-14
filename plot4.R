## plot3.R - Script to generate plot4.png with 2 previous charts and 2 new charts
## 

fileURL <- "./ExData_Plotting1/household_power_consumption.txt"
eData <- read.table(text = grep("^[1,2]/2/2007",readLines(fileURL),value=TRUE), header=TRUE, sep=";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?")

## Extract and concat Date&Time
eDay <- strptime(paste(eData$Date, eData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Extract data "global active power"
globalActivePower <- as.numeric(eData$Global_active_power)

## Extract data "global reactive power"
globalReActivePower <- as.numeric(eData$Global_reactive_power)

## Extract data for 3 x sub-meters
subMeter1 <- as.numeric(eData$Sub_metering_1)
subMeter2 <- as.numeric(eData$Sub_metering_2)
subMeter3 <- as.numeric(eData$Sub_metering_3)

## Extract Voltage
voltage <- as.numeric(eData$Voltage)

## Define PNG properties
png(filename = './ExData_Plotting1/plot4.png', width = 480, height = 480, units='px')

## set the 2x2 graphical parameters
par(mfrow = c(2, 2))

## plot top-left
plot(eDay, globalActivePower, xlab="", ylab = "Global Active Power", type="l")

## plot top-right
plot(eDay, voltage, xlab="datetime", ylab = "Voltage", type="l")

## plot bottom-left
plot(eDay, subMeter1, col = "black", xlab = "", ylab = "Enercy sub metering", type="l")
lines(eDay, subMeter2, type="l", col="red")
lines(eDay, subMeter3, type="l", col="blue")
legend("topright", c("Sub-metering_1", "Sub-metering_2", "Sub-metering_3"), col = c("black", "red", "blue"), lwd = 2)

## plot bottom-right
plot(eDay, globalReActivePower, xlab="datetime", ylab = "Global_reactive_power", type="l")

## close the device
dev.off()
