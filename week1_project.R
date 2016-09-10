#checking curretn working directory
CDir <- getwd()
WDir <-"C:/Users/JIBRAN/Desktop/Week1"
#setting up woring directory if its not the desire directory
if (!(CDir==WDir)) setwd(WDir)
#loading data file into environment
mainData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset and overwrite the data object to reduce the memory useage
mainData <- mainData[mainData$Date %in% c("1/2/2007","2/2/2007") ,]

dateNtime <- strptime(paste(mainData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(mainData$Global_active_power)

# PLOT 1
png("plot1.png", width=480, height=480)
hist(gap, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

# PLOT 2
png("plot2.png", width=480, height=480)
plot(dateNtime, gap, type="l", xlab="" , ylab="Global Active Power (kilowatts)")
dev.off()

# PLOT 3
meter1 <- as.numeric(mainData$Sub_metering_1)
meter2 <- as.numeric(mainData$Sub_metering_2)
meter3 <- as.numeric(mainData$Sub_metering_3)
#ploting graph
png("plot3.png", width=480, height=480)
plot(dateNtime, meter1, type="l", col="black", xlab="", ylab="Energy Submetering")
lines(dateNtime, meter2, type="l", col="red")
lines(dateNtime, meter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2.5)
dev.off()

#PLOT 4
grp <- as.numeric(mainData$Global_reactive_power)
volts <- as.numeric(mainData$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#plot1
hist(gap, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#plot2
plot(dateNtime, volts, type="l", xlab="datetime", ylab="Voltage")

#plot3
plot(dateNtime, meter1, type="l", col="black", xlab="", ylab="Energy Submetering")
lines(dateNtime, meter2, type="l", col="red")
lines(dateNtime, meter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2.5)

#plot4
plot(dateNtime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()