#Code for graph 1. Data was downloaded from the 
#"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#then unzipped using WinRar to "C:/Users/Mister Spock/Desktop/rprog/ExplDatAnPr1"

setwd("C:/Users/Mister Spock/Desktop/rprog/ExplDatAnPr1")
#Before reading file do not forget about NA values marked as '?'
PCdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
#Subset data according to Dates
PCdata <- subset(PCdata, (Date == "1/2/2007") | (Date == "2/2/2007"))
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

# Start PNG to save output to file plot1.png
png(filename="C:/Users/Mister Spock/Desktop/rprog/ExplDatAnPr1/plot1.png", height=480, width=480, bg="white")
hist(PCdata$Global_active_power, col = "red", xlab = "Global active power (kilowatts)", main = "Global active power")
dev.off()