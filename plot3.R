#AFTER LOADING DATA FILE, SUBSETTING AND OVERWRITING THE DATA AS "mainData"
#FOR COMPLETE CODE PLEASE SEE THE "week1_project.R" FILE

#R CODE FOR PLOT 3
#variables for ploting graph 3
dateNtime <- strptime(paste(mainData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
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