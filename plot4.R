#AFTER LOADING DATA FILE, SUBSETTING AND OVERWRITING THE DATA AS "mainData"
#FOR COMPLETE CODE PLEASE SEE THE "week1_project.R" FILE

#R CODE FOR PLOT 4
#variables for ploting graph 4
dateNtime <- strptime(paste(mainData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(mainData$Global_active_power)
grp <- as.numeric(mainData$Global_reactive_power)
volts <- as.numeric(mainData$Voltage)
meter1 <- as.numeric(mainData$Sub_metering_1)
meter2 <- as.numeric(mainData$Sub_metering_2)
meter3 <- as.numeric(mainData$Sub_metering_3)

#Ploting graph

#Setting up Ploting region
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
