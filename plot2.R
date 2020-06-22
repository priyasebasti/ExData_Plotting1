# Load data
Consumptiondata <- data.table::fread(input = "household_power_consumption.txt")

# Filter the data to the two dates mentioned 
Consumptiondata<-subset(Consumptiondata,Consumptiondata$Date=="1/2/2007" | Consumptiondata$Date=="2/2/2007")

# Add a column DateTime
Consumptiondata[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = Consumptiondata$dateTime, y = Consumptiondata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()