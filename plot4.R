setwd("C:/Users/Mister Spock/Desktop/rprog/ExplDatAnPr1")
#Before reading file do not forget about NA values marked as '?'
PCdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#Subset data according to Dates
PCdata <- subset(PCdata, (Date == "1/2/2007") | (Date == "2/2/2007"))
#head(PCdata)
#sum(complete.cases(PCdata))
#Remove NAs
PCdata <- na.omit(PCdata)
#Merging Date and Time into FullDate column
PCdata$FullDate <- paste(PCdata$Date, PCdata$Time, sep = "")
#Convert into Time format
PCdata$FullDate <- strptime(PCdata$FullDate, "%d/%m/%Y %H:%M:%S")
str(PCdata)
#Plotting cannot be performed with POSIXlt format, convert FullDate into
#PosIXct format
PCdata$FullDate <- as.POSIXct(PCdata$FullDate)
#check "srt(PCdata)" for Data formats if necessary

# Start PNG to save output to file plot4.png
png(filename="C:/Users/Mister Spock/Desktop/rprog/ExplDatAnPr1/plot4.png", height=480, width=480, bg="white")
par(mfcol = c(2,2), mar = c(4, 4, 2, 1))
with(PCdata, {
    plot(PCdata$FullDate, PCdata$Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)")
    plot(PCdata$FullDate, PCdata$Sub_metering_1, type = "l", xlab = NA, ylab = "Energy sub metering")
    lines(PCdata$FullDate, PCdata$Sub_metering_2, col = "red")
    lines(PCdata$FullDate, PCdata$Sub_metering_3, col = "blue")
    legend("topright", lty = 1, bty = "n", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(PCdata$FullDate, PCdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    plot(PCdata$FullDate, PCdata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()