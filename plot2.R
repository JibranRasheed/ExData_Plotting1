#AFTER LOADING DATA FILE, SUBSETTING AND OVERWRITING THE DATA AS "mainData"
#FOR COMPLETE CODE PLEASE SEE THE "week1_project.R" FILE

#R CODE FOR PLOT 2
#variables for ploting graph 3
dateNtime <- strptime(paste(mainData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(mainData$Global_active_power)

#ploting graph
png("plot2.png", width=480, height=480)
plot(dateNtime, gap, type="l", xlab="" , ylab="Global Active Power (kilowatts)")
dev.off()