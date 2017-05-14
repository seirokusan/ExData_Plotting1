## plot3.R - Script to generate plot3.png with 3xSub-Metering data against day, with legend
## 

fileURL <- "./ExData_Plotting1/household_power_consumption.txt"
eData <- read.table(text = grep("^[1,2]/2/2007",readLines(fileURL),value=TRUE), header=TRUE, sep=";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?")

## Extract and concat Date&Time
eDay <- strptime(paste(eData$Date, eData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Extract data for 3 x sub-meters
subMeter1 <- as.numeric(eData$Sub_metering_1)
subMeter2 <- as.numeric(eData$Sub_metering_2)
subMeter3 <- as.numeric(eData$Sub_metering_3)

## Define PNG properties
png(filename = './ExData_Plotting1/plot3.png', width = 480, height = 480, units='px')

## plot with lines
plot(eDay, subMeter1, col = "black", ylab = "Enercy sub metering", type="l")
lines(eDay, subMeter2, type="l", col="red")
lines(eDay, subMeter3, type="l", col="blue")

## add legend
legend("topright", c("Sub-metering_1", "Sub-metering_2", "Sub-metering_3"), col = c("black", "red", "blue"), lwd = 2)

## close the device
dev.off()
