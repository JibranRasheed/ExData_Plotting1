#AFTER LOADING DATA FILE, SUBSETTING AND OVERWRITING THE DATA AS "mainData"
#FOR COMPLETE CODE PLEASE SEE THE "week1_project.R" FILE

#R CODE FOR PLOT 1
#variables for ploting graph 3
gap <- as.numeric(mainData$Global_active_power)

# PLOT 1
png("plot1.png", width=480, height=480)
hist(gap, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()