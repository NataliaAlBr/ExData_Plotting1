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

# Start PNG to save output to file plot3.png
png(filename="C:/Users/Mister Spock/Desktop/rprog/ExplDatAnPr1/plot3.png", height=480, width=480, bg="white")
plot(PCdata$FullDate, PCdata$Sub_metering_1, type = "l", xlab = NA, ylab = "Energy sub metering")
lines(PCdata$FullDate, PCdata$Sub_metering_2, col = "red")
lines(PCdata$FullDate, PCdata$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "o", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()