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

# Start PNG to save output to file plot2.png
png(filename="C:/Users/Mister Spock/Desktop/rprog/ExplDatAnPr1/plot2.png", height=480, width=480, bg="white")

#type = "l" means that we don't want to have pch on our graph, only line: xlab = NA
plot(PCdata$FullDate, PCdata$Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)")
dev.off()