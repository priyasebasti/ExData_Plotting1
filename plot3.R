# Load data
Consumptiondata <- data.table::fread(input = "household_power_consumption.txt")

# Filter the data to the two dates mentioned
Consumptiondata<-subset(Consumptiondata,Consumptiondata$Date=="1/2/2007" | Consumptiondata$Date=="2/2/2007")

# Add a column DateTime
Consumptiondata[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

png("plot3.png", width=480, height=480)

# Plot 3
plot(Consumptiondata$DateTime, Consumptiondata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Consumptiondata$DateTime, Consumptiondata$Sub_metering_2,col="red")
lines(Consumptiondata$DateTime, Consumptiondata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.off()